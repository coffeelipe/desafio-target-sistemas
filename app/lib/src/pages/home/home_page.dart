import 'package:app/src/core/extensions/mediaquery_extension.dart';
import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:app/src/pages/fullscreen_note/fullscreen_note.dart';
import 'package:app/src/stores/home/home_store.dart';
import 'package:app/src/stores/main/root_store.dart';
import 'package:app/src/widgets/global/empty_state.dart';
import 'package:app/src/widgets/home/header.dart';
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
              ResponsiveUtils.spacing(SpacingSize.small) + context.safeTop,
              ResponsiveUtils.spacing(SpacingSize.large),
              ResponsiveUtils.spacing(SpacingSize.small) + context.safeBottom,
            ),
            child: Column(
              children: [
                Header(greetingMessage: _homeStore.greetingMessage),
                _rootStore.noteStore.notes.isEmpty
                    ? Expanded(
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
                    : Expanded(
                        child: GridView.builder(
                          controller: _homeStore.scrollController,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: ResponsiveUtils.spacing(
                                  SpacingSize.small,
                                ),
                                crossAxisSpacing: ResponsiveUtils.spacing(
                                  SpacingSize.small,
                                ),
                                childAspectRatio: 0.75,
                              ),
                          itemCount: _rootStore.noteStore.notes.length,
                          itemBuilder: (context, index) {
                            return NoteThumbnail(
                              index: index,
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return FullscreenNote(
                                      note: _rootStore.noteStore.notes[index],
                                    );
                                  },
                                ),
                              ),
                              note: _rootStore.noteStore.notes[index],
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
