import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_tasks/inner_screen/task_details.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TaskDetails()));
        },
        onLongPress: () {
          showDialog(context: context, builder: (context){
            return AlertDialog(
              actions: [
                TextButton(onPressed:() {}, child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.delete,color: Colors.red),
                    SizedBox(width: 10),
                    Text('Delete',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)
                  ],
                ) )
              ],
            );
          });

        },
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: Container(
          padding: const EdgeInsets.only(right: 12),
          decoration: const BoxDecoration(
              border: Border(right: BorderSide(width: 1.0))),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 20,
            //https://png.pngtree.com/png-clipart/20191017/ourlarge/pngtree-3d-green-check-icon-png-image_1772786.jpg
            //https://png.pngtree.com/png-clipart/20190906/original/pngtree-orange-cartoon-alarm-clock-illustration-png-image_4571008.jpg//
            child: Image.network('https://png.pngtree.com/png-clipart/20191017/ourlarge/pngtree-3d-green-check-icon-png-image_1772786.jpg'),
          ),
        ),
        title: const Text(
          'Title',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.linear_scale,
              color: Colors.pink.shade800,
            ),
            const Text(
              'Subtitle,description',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )
          ],
        ),
        trailing: Icon(Icons.keyboard_arrow_right,size:30,color: Colors.pink.shade800),
      ),
    );
  }
}
