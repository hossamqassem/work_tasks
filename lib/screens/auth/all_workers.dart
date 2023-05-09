import 'package:flutter/material.dart';
import 'package:work_tasks/widgets/all_workers_widget.dart';
import 'package:work_tasks/widgets/drawer_widget.dart';
import 'package:work_tasks/widgets/tasks_widget.dart';

// ignore: must_be_immutable
class AllWorkersScreen extends StatelessWidget {
  const AllWorkersScreen({super.key});



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer:  const DrawerWidget(),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu_outlined, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(
          'All worker',
          style: TextStyle(color: Colors.pink),
        ),
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return const AllWorkersWidget();
          }),
    );
  }
}
