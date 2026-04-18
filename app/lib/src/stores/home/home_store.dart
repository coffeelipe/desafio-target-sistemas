import 'package:app/src/models/note.dart';
import 'package:app/src/stores/main_scaffold/main_scaffold_store.dart';
import 'package:app/src/widgets/home/note/note_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

// ignore: library_private_types_in_public_api
class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final MainScaffoldStore mainScaffoldStore;
  _HomeStoreBase({required this.mainScaffoldStore}) {
    _init();
  }

  final ScrollController scrollController = ScrollController();

  @observable
  List<Note> notes = [];

  @observable
  String timeOfDayGreeting = '';

  @observable
  String greetingDisplayName = '';

  @computed
  String get greetingMessage {
    return '$timeOfDayGreeting, $greetingDisplayName!\nQue ideias temos para hoje?';
  }

  @action
  void openNote() {
    // open the note dialog with the content of the selected note thumbnail
  }

  @action
  void createNote() {
    // create a new note and add it to the list of note thumbnails
  }

  @action
  void deleteNote() {
    // delete the selected note and remove it from the list of note thumbnails
  }

  @action
  void updateNote() {
    // update the content of the selected note and update the corresponding note thumbnail
  }

  @action
  Future<void> showNewNoteDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (_) {
        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 1),
          duration: Durations.short4,
          curve: Curves.easeOutBack,
          builder: (context, value, child) =>
              Transform.scale(scale: value, child: child),
          child: const NoteDialog(),
        );
      },
    );
  }

  @action
  bool Function(ScrollNotification) onScrollNotification() {
    return (ScrollNotification notification) {
      if (notification is UserScrollNotification) {
        if (notification.direction == ScrollDirection.reverse) {
          mainScaffoldStore.setNavBarVisibility(false);
        } else if (notification.direction == ScrollDirection.forward) {
          mainScaffoldStore.setNavBarVisibility(true);
        }
      }
      return false;
    };
  }

  @action
  void _setTimeOfDayGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      timeOfDayGreeting = 'Bom dia';
    } else if (hour < 18) {
      timeOfDayGreeting = 'Boa tarde';
    } else {
      timeOfDayGreeting = 'Boa noite';
    }
  }

  @action
  void setGreetingDisplayName(String username) =>
      greetingDisplayName = username;

  @action
  void _init() {
    _setTimeOfDayGreeting();
  }

  @action
  void dispose() {
    scrollController.dispose();
  }
}
