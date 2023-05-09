import 'package:flutter/material.dart';
import 'package:work_tasks/constants/constants.dart';
import 'package:work_tasks/widgets/comments_widgets.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({Key? key}) : super(key: key);

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  bool _isCommiting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Back',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Constants.darkBlue,
                fontSize: 22),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Task Title',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Constants.darkBlue),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Uploaded by',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Constants.darkBlue),
                          ),
                          const Spacer(),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3, color: Colors.pink.shade800),
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                  image: NetworkImage(
                                    'https://louisville.edu/enrollmentmanagement/images/person-icon/image',
                                  ),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Uploaded Name',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    color: Constants.darkBlue),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Uploaded Job',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    color: Constants.darkBlue),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Uploaded on:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Constants.darkBlue),
                          ),
                          Text(
                            ' data: 14-2-2022',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: Constants.darkBlue),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Deadline date',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Constants.darkBlue),
                          ),
                          Text(
                            ' data: 14-6-2022',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: Colors.red.shade800),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          ' data: 14-6-2022',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.green.shade800,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Done state:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Constants.darkBlue),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              'Done',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: Constants.darkBlue),
                            ),
                          ),
                          const Opacity(
                              opacity: 1,
                              child: Icon(Icons.check_circle,
                                  color: Colors.green)),
                          const SizedBox(width: 40),
                          Flexible(
                            child: Text(
                              'Not done',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: Constants.darkBlue),
                            ),
                          ),
                          const Opacity(
                              opacity: 1,
                              child:
                                  Icon(Icons.check_circle, color: Colors.red)),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Task description:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Constants.darkBlue),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Description for the task',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Constants.darkBlue),
                      ),
                      const SizedBox(height: 20),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: _isCommiting
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: TextField(
                                      maxLength: 200,
                                      // controller: ,
                                      style:
                                          TextStyle(color: Constants.darkBlue),
                                      keyboardType: TextInputType.text,
                                      maxLines: 6,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        errorBorder: const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.pink),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            MaterialButton(
                                              onPressed: () {},
                                              color: Colors.pink,
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                  side: BorderSide.none),
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 14),
                                                child: Text(
                                                  'Post',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _isCommiting =
                                                        !_isCommiting;
                                                  });
                                                },
                                                child: const Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 15),
                                                ))
                                          ],
                                        ),
                                      ))
                                ],
                              )
                            : Center(
                                child: MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      _isCommiting = !_isCommiting;
                                    });
                                  },
                                  color: Colors.pink,
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13),
                                      side: BorderSide.none),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 14),
                                    child: Text(
                                      'Add a comment',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      const SizedBox(height: 30,),
                      ListView.separated(
                        shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return   CommentWidget();
                          },
                          separatorBuilder:(context,index){
                            return const Divider(thickness: 1,);
                          },
                          itemCount: 20)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
