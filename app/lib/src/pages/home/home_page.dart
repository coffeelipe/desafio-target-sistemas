import 'package:app/src/core/extensions/mediaquery_extension.dart';
import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:app/src/pages/fullscreen_note/fullscreen_note.dart';
import 'package:app/src/stores/home/home_store.dart';
import 'package:app/src/stores/main/root_store.dart';
import 'package:app/src/widgets/global/empty_state.dart';
import 'package:app/src/widgets/global/header.dart';
import 'package:app/src/widgets/home/animated_grid_layout_builder.dart';
import 'package:app/src/widgets/home/note/note_thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:remixicon/remixicon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeStore _homeStore;
  late final RootStore _rootStore;

  @override
  void initState() {
    super.initState();
    _homeStore = context.read<HomeStore>();
    _rootStore = context.read<RootStore>();
    _homeStore.setGreetingDisplayName(
      context.read<RootStore>().userProfileStore.displayName!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return NotificationListener<UserScrollNotification>(
          onNotification: _homeStore.onScrollNotification(),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              ResponsiveUtils.spacing(SpacingSize.large),
              0,
              ResponsiveUtils.spacing(SpacingSize.large),
              ResponsiveUtils.spacing(SpacingSize.small) + context.safeBottom,
            ),
            child: CustomScrollView(
              controller: _homeStore.scrollController,
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.only(
                    top:
                        ResponsiveUtils.spacing(SpacingSize.medium) +
                        context.safeTop,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Header(
                      title: 'Biblioteca',
                      subtitle: _homeStore.greetingMessage,
                    ),
                  ),
                ),
                if (_rootStore.noteStore.notes.isEmpty)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: EmptyState(
                        icon: RemixIcons.sticky_note_fill,
                        message: 'Nenhuma nota encontrada',
                        ctaText: 'Criar minha primeira nota',
                        onCtaPressed: () => _rootStore.noteStore
                            .showNewNoteDialog(context, null),
                      ),
                    ),
                  )
                else
                  SliverToBoxAdapter(
                    child: AnimatedGridLayoutBuilder(
                      notes: _rootStore.noteStore.notes,
                      itemBuilder: (context, currentNote, index) {
                        return Observer(
                          builder: (_) {
                            final isMarkedForDeletion = _rootStore
                                .noteStore
                                .markedForDeletion
                                .any((n) => n.id == currentNote.id);
                            final deletionProgress = _rootStore
                                .noteStore
                                .deletionProgress[currentNote.id];

                            return NoteThumbnail(
                              index: index,
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return FullscreenNote(note: currentNote);
                                  },
                                ),
                              ),
                              onEdit: () => _rootStore.noteStore
                                  .showNewNoteDialog(context, currentNote),
                              onDelete: () {
                                if (isMarkedForDeletion) {
                                  _rootStore.noteStore.undoDelete(currentNote);
                                } else {
                                  _rootStore.noteStore.deleteNote(currentNote);
                                }
                              },
                              isMarkedForDeletion: isMarkedForDeletion,
                              deletionProgress: deletionProgress,
                              note: currentNote,
                            );
                          },
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
