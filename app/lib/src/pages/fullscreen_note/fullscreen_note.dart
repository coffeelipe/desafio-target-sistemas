import 'package:app/src/core/extensions/mediaquery_extension.dart';
import 'package:app/src/core/theme/app_palette.dart';
import 'package:app/src/core/theme/app_typography.dart';
import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:app/src/models/note.dart';
import 'package:app/src/stores/main/root_store.dart';
import 'package:app/src/widgets/fullscreen_note/discard_changes_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:remixicon/remixicon.dart';

class FullscreenNote extends StatefulWidget {
  final Note note;
  const FullscreenNote({super.key, required this.note});

  @override
  State<FullscreenNote> createState() => _FullscreenNoteState();
}

class _FullscreenNoteState extends State<FullscreenNote> {
  late final RootStore _rootStore;

  @override
  void initState() {
    super.initState();
    _rootStore = context.read<RootStore>();
    _rootStore.noteStore.fullScreenTitleController.text =
        widget.note.title ?? 'Sem título';
    _rootStore.noteStore.fullScreenContentController.text = widget.note.content;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return PopScope(
          canPop: !_rootStore.noteStore.isFullScreenEditing,
          onPopInvokedWithResult: (didPop, result) async {
            if (didPop) return;

            if (!_rootStore.noteStore.isFullScreenEditing) {
              Navigator.of(context).pop();
              return;
            }

            final shouldExit = await DiscardChangesDialog.show(context);
            if (!shouldExit || !context.mounted) return;

            _rootStore.noteStore.isFullScreenEditing = false;
            FocusManager.instance.primaryFocus?.unfocus();
            Navigator.of(context).pop();
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppPalette.scaffoldColor,
              elevation:
                  _rootStore.noteStore.fullScreenScrollController.hasClients &&
                      _rootStore.noteStore.fullScreenScrollController.offset >
                          0.5
                  ? 4
                  : 0,
              shadowColor: AppPalette.blackShade.withValues(alpha: 0.1),
              surfaceTintColor: Colors.transparent,
              title: TextFormField(
                controller: _rootStore.noteStore.fullScreenTitleController,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  filled: false,
                ),
                style: AppTypography.heading2.apply(
                  color: AppPalette.blackShade,
                ),
                readOnly: !_rootStore.noteStore.isFullScreenEditing,
              ),
              actions: [
                IconButton(
                  onPressed: () => _rootStore.noteStore
                      .handleFullScreenButtonPress(widget.note),
                  icon: Icon(
                    _rootStore.noteStore.isFullScreenEditing
                        ? RemixIcons.check_line
                        : RemixIcons.pencil_line,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(RemixIcons.pie_chart_2_line),
                ),
              ],
              leading: IconButton(
                onPressed: () => Navigator.of(context).maybePop(),
                iconSize: 32,
                icon: const Icon(Icons.chevron_left_rounded),
              ),
            ),
            body: SizedBox.expand(
              child: TextFormField(
                controller: _rootStore.noteStore.fullScreenContentController,
                focusNode: _rootStore.noteStore.fullScreenContentFocusNode,
                scrollController:
                    _rootStore.noteStore.fullScreenScrollController,
                readOnly: !_rootStore.noteStore.isFullScreenEditing,
                expands: true,
                maxLines: null,
                minLines: null,
                textAlignVertical: TextAlignVertical.top,
                style: const TextStyle(
                  fontSize: 18,
                  color: AppPalette.blackShade,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(
                    ResponsiveUtils.spacing(SpacingSize.large),
                    0,
                    ResponsiveUtils.spacing(SpacingSize.large),
                    ResponsiveUtils.spacing(SpacingSize.large) +
                        context.safeBottom,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
