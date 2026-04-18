import 'package:app/src/core/extensions/mediaquery_extension.dart';
import 'package:app/src/core/utils/responsive_utils.dart';
import 'package:app/src/stores/home/home_store.dart';
import 'package:app/src/stores/main/root_store.dart';
import 'package:app/src/widgets/home/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeStore _homeStore;
  @override
  void initState() {
    super.initState();
    _homeStore = context.read<HomeStore>();
    _homeStore.setGreetingDisplayName(
      context.read<RootStore>().userProfileStore.displayName!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<UserScrollNotification>(
      onNotification: _homeStore.onScrollNotification(),
      child: ListView.builder(
        controller: mounted ? _homeStore.scrollController : null,
        itemCount: 50,
        padding: EdgeInsets.fromLTRB(
          ResponsiveUtils.spacing(SpacingSize.large),
          ResponsiveUtils.spacing(SpacingSize.small) + context.safeTop,
          ResponsiveUtils.spacing(SpacingSize.large),
          ResponsiveUtils.spacing(SpacingSize.small) + context.safeBottom,
        ),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Header(greetingMessage: _homeStore.greetingMessage);
          }
          return Container(
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
          );
        },
      ),
    );
  }
}
