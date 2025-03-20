import 'package:finance_tracker/view_model/home_view_model/home_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawerContent extends ConsumerStatefulWidget {
  const DrawerContent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DrawerContentState();
}

class _DrawerContentState extends ConsumerState<DrawerContent> {
  void changeScreen(int pageNum) {
    ref.read(homeNavProvider.notifier).changeScreen(pageNum);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = ref.watch(homeNavProvider);

    return Drawer(
      child: Column(
        children: [
          SizedBox(height: 200),
          ListTile(
            tileColor:
                currentPage == 0 ? Colors.black.withValues(alpha: 0.1) : null,
            leading: Icon(Icons.dashboard_rounded),
            title: Text("Dashboard"),
            onTap: () {
              if (currentPage != 0) {
                changeScreen(0);
              }
            },
          ),
          ListTile(
            tileColor:
                currentPage == 1 ? Colors.black.withValues(alpha: 0.1) : null,
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              if (currentPage != 1) {
                changeScreen(1);
              }
            },
          ),
        ],
      ),
    );
  }
}
