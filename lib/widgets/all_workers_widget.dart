import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllWorkersWidget extends StatefulWidget {
  const  AllWorkersWidget({super.key});

  @override
  State<AllWorkersWidget> createState() => _AllWorkersWidgetState();
}

class _AllWorkersWidgetState extends State<AllWorkersWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        onTap: () {},
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: Container(
          padding: const EdgeInsets.only(right: 12),
          decoration: const BoxDecoration(
              border: Border(right: BorderSide(width: 1.0))),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 20,
            child: Image.network('https://cdn.iconscout.com/icon/free/png-256/free-avatar-370-456322.png?f=webp&w=256'),
          ),
        ),
        title: const Text(
          'Name',
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
              'Position In The Company/5677336',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )
          ],
        ),
        trailing: Icon(Icons.mail_outline,size:30,color: Colors.pink.shade800),
      ),
    );
  }
}
