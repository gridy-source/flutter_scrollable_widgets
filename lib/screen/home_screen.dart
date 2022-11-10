import 'package:flutter/material.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';
import 'package:scrollable_widgets/screen/custom_scroll_view_screen.dart';
import 'package:scrollable_widgets/screen/grid_view_screen.dart';
import 'package:scrollable_widgets/screen/list_view_screen.dart';
import 'package:scrollable_widgets/screen/refresh_indicator.dart';
import 'package:scrollable_widgets/screen/reorderable_list_view_screen.dart';
import 'package:scrollable_widgets/screen/scrollbar_screen.dart';
import 'package:scrollable_widgets/screen/single_child_scroll_view_screen.dart';

class ScreenModel {
  const ScreenModel({
    Key? key,
    required this.name,
    required this.builder,
  });

  final WidgetBuilder builder;
  final String name;
}

class HomeScreen extends StatelessWidget {
  final screens = [
    ScreenModel(
      name: "SingleChildScrollViewScreen",
      builder: (_) => SingleChildScrollViewScreen(),
    ),
    ScreenModel(
      name: "ListViewScreen",
      builder: (_) => ListViewScreen(),
    ),
    ScreenModel(
      name: "GridViewScreen",
      builder: (_) => GridViewScreen(),
    ),
    ScreenModel(
      name: "ReorderableListView",
      builder: (_) => ReorderableListViewScreen(),
    ),
    ScreenModel(
      name: "CustomScrollViewScreen",
      builder: (_) => CustomScrollViewScreen(),
    ),
    ScreenModel(
      name: "ScrollbarScreen",
      builder: (_) => ScrollbarScreen(),
    ),
    ScreenModel(
      name: "RefreshIndicatorScreen",
      builder: (_) => RefreshIndicatorScreen(),
    ),
  ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Home",
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: screens
              .map(
                (screen) => ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: screen.builder,
                    ),
                  ),
                  child: Text(screen.name),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
