

import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
    CommentWidget({Key? key}) : super(key: key);

  final List<Color> _colors=[
    Colors.orangeAccent,
    Colors.pink,
    Colors.amber,
    Colors.purple,
    Colors.brown,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    _colors.shuffle();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 5,),
        Flexible(
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 2, color: _colors[0]),
              shape: BoxShape.circle,
              image: const DecorationImage(
                  image: NetworkImage(
                    'https://louisville.edu/enrollmentmanagement/images/person-icon/image',
                  ),
                  fit: BoxFit.fill),
            ),
          ),
        ),
        Flexible(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10  ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text('Commenter name',style: TextStyle(fontStyle: FontStyle.normal,color: Colors.grey.shade700,fontSize: 20,fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                Text('Commenter body',style: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey.shade700),),
              ],
            ),
          ),
        )

      ],
    );
  }
}
