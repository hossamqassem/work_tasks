import 'package:flutter/material.dart';
import 'package:work_tasks/constants/constants.dart';
import 'package:work_tasks/inner_screen/add_task.dart';
import 'package:work_tasks/inner_screen/profile.dart';
import 'package:work_tasks/screens/auth/all_workers.dart';

import '../screens/tasks.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.cyan),
            child: Column(
              children: [
                Flexible(
                    child: Image.network(
                        'https://img.icons8.com/external-avoca-kerismaker/256/external-Task-project-management-avoca-kerismaker.png')),
                const SizedBox(height: 20),
                const Flexible(
                  child: Text(
                    'Work os',
                    style: TextStyle(
                        color: Color(0xFF00325A),
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _listTiles(
              label: 'All Tasks',
              ftc: () {
                _navigateToTaskScreen(context);
              },
              icon: Icons.task),
          const SizedBox(height: 20),
          _listTiles(
            label: 'My Account',
            ftc: () {_navigateToProfileScreen(context);},
            icon: Icons.settings_outlined,
          ),
          const SizedBox(height: 20),
          _listTiles(
            label: 'Registered Works ',
            ftc: () {_navigateToAllWorkersScreen(context);},
            icon: Icons.workspaces_outline,
          ),
          const SizedBox(height: 20),
          _listTiles(
            label: 'Add Task',
            ftc: () {
              _navigateToAddTaskScreen(context);
            },
            icon: Icons.add_task_outlined,
          ),
          const SizedBox(height: 20),
          const Divider(thickness: 1),
          const SizedBox(height: 10),
          _listTiles(
            label: 'Logout',
            ftc: () {
              _logout(context);
            },
            icon: Icons.logout_outlined,
          ),
        ],
      ),
    );
  }
  void _navigateToProfileScreen(context){
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()));
  }
  void _navigateToAllWorkersScreen(context){
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const AllWorkersScreen()));
  }

  void _navigateToAddTaskScreen(context) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const AddTaskScreen()));
  }

  void _navigateToTaskScreen(context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => TasksScreen()));
  }

  void _logout(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    'https://img.icons8.com/external-sbts2018-flat-sbts2018/256/external-logout-social-media-sbts2018-flat-sbts2018.png',
                    height: 20,
                    width: 20,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Sign Out'),
                )
              ],
            ),
            content: Text(
              'Do you wanna sign out',
              style: TextStyle(
                color: Constants.darkBlue,
                fontWeight: FontWeight.bold,
                fontSize: 19,
                fontStyle: FontStyle.italic,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Ok',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          );
        });
  }

  Widget _listTiles(
      {required String label, required Function ftc, required IconData icon}) {
    return ListTile(
      onTap: () {
        ftc();
      },
      leading: Icon(
        icon,
        size: 35,
        color: Constants.darkBlue,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: Constants.darkBlue,
          fontWeight: FontWeight.bold,
          fontSize: 22,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
