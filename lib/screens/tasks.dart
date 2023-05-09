import 'package:flutter/material.dart';
import 'package:work_tasks/constants/constants.dart';
import 'package:work_tasks/widgets/drawer_widget.dart';
import 'package:work_tasks/widgets/tasks_widget.dart';

// ignore: must_be_immutable
class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer:  DrawerWidget(),
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
          'Tasks',
          style: TextStyle(color: Colors.pink),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showTaskCategoryDialog(context,size);

            },
            icon: const Icon(
              Icons.filter_list_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return const TaskWidget();
          }),
    );
  }
  void showTaskCategoryDialog(context,size){
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Task Category',
              style: TextStyle(color: Colors.pink[300], fontSize: 20),
            ),
            content: Container(
              width: size.width * 0.9,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount:Constants.taskCategoryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){
                        print('taskCategoryList[index] ${Constants. taskCategoryList[index]}');
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_rounded,
                            color: Colors.red[200],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              Constants. taskCategoryList[index],
                              style: const TextStyle(
                                color: Color(0xFF00325A),
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.canPop(context)
                      ? Navigator.pop(context)
                      : null;
                },
                child: const Text('Close'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Cancel Filter'),
              ),
            ],
          );
        });
  }
}
