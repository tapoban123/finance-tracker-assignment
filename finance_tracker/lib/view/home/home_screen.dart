import 'package:finance_tracker/components/drawer_content.dart';
import 'package:finance_tracker/utils/utils.dart';
import 'package:finance_tracker/view/home/dashboard_screen.dart';
import 'package:finance_tracker/view/home/settings_screen.dart';
import 'package:finance_tracker/view_model/auth_view_model/auth_view_model.dart';
import 'package:finance_tracker/view_model/home_view_model/home_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final String uid;
  const HomeScreen({super.key, required this.uid});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late GlobalKey<ScaffoldState> _scaffoldkey;
  @override
  void initState() {
    super.initState();
    _scaffoldkey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            _scaffoldkey.currentState?.openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
      ),
      drawer: DrawerContent(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: IndexedStack(
        index: ref.watch(homeNavProvider),
        children: [DashboardScreen(widget.uid), SettingsScreen()],
      ),
    );
  }
}
