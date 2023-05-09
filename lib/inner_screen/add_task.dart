import 'package:flutter/material.dart';
import 'package:work_tasks/constants/constants.dart';
import 'package:work_tasks/widgets/drawer_widget.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _categoryController =
      TextEditingController(text: 'Task Category');
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _deadlineDateController =
      TextEditingController(text: 'pick up a date  ');
  final _formKey = GlobalKey<FormState>();
  DateTime? picked;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _categoryController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _deadlineDateController.dispose();
  }

  void uploadFtc() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      print('form valid');
    } else {
      print('form not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Constants.darkBlue),
      ),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'All field are required',
                      style: TextStyle(
                        fontSize: 25,
                        color: Constants.darkBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Divider(thickness: 1),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textWidget(textLabel: 'Task Category*'),
                        _textFromFields(
                          valueKey: 'Task Category',
                          controller: _categoryController,
                          enabled: false,
                          ftc: () {
                            showTaskCategoryDialog(size);
                          },
                          maxLength: 100,
                        ),
                        textWidget(textLabel: 'Task Title*'),
                        _textFromFields(
                          valueKey: 'Task title',
                          controller: _titleController,
                          enabled: true,
                          ftc: () {},
                          maxLength: 100,
                        ),
                        textWidget(textLabel: 'Task Description*'),
                        _textFromFields(
                          valueKey: 'TaskDescription',
                          controller: _descriptionController,
                          enabled: true,
                          ftc: () {},
                          maxLength: 1000,
                        ),
                        textWidget(textLabel: 'Task Deadline date*'),
                        _textFromFields(
                          valueKey: 'DeadlineDate',
                          controller: _deadlineDateController,
                          enabled: false,
                          ftc: () {
                            _pickData();
                          },
                          maxLength: 100,
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.all(40),
                          child: Center(
                            child: MaterialButton(
                              onPressed: uploadFtc,
                              color: Colors.pink,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  side: BorderSide.none),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 14),
                                    child: Text(
                                      'Upload',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(Icons.upload_file)
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _pickData() async {
    picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 0)),
        lastDate: DateTime(2100));

    if (picked != null) {
      setState(() {
        _deadlineDateController.text = '${picked!.year}-'
            '${picked!.month}-'
            '${picked!.day}';
      });
    }
  }

  textWidget({String? textLabel}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        textLabel!,
        style: TextStyle(
          fontSize: 18,
          color: Colors.pink.shade800,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void showTaskCategoryDialog(size) {
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
                  itemCount: Constants.taskCategoryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _categoryController.text =
                              Constants.taskCategoryList[index];
                        });
                        Navigator.pop(context);
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
                              Constants.taskCategoryList[index],
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
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                },
                child: const Text('Close'),
              ),
            ],
          );
        });
  }

  _textFromFields({
    required String valueKey,
    required TextEditingController controller,
    required bool enabled,
    required Function ftc,
    required int maxLength,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          ftc();
        },
        child: TextFormField(
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Filed is missing';
            }
            return null;
          },
          enabled: enabled,
          key: ValueKey(valueKey),
          style: TextStyle(
              color: Constants.darkBlue,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontStyle: FontStyle.italic),
          maxLines: valueKey == 'TaskDescription' ? 3 : 1,
          maxLength: maxLength,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.pink.shade800)),
            //focusedErrorBorder: const OutlineInputBorder(
            //  borderSide: BorderSide(color: Colors.red)),
          ),
        ),
      ),
    );
  }
}
