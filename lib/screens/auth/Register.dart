import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/constants.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final TextEditingController _fullNameTextController =
      TextEditingController(text: '');
  final TextEditingController _emailTextController =
      TextEditingController(text: '');
  final TextEditingController _passwordTextController =
      TextEditingController(text: '');
  final TextEditingController _positionCPTextController =
      TextEditingController(text: '');
  final TextEditingController _phoneTextController =
      TextEditingController(text: '');

  final FocusNode _fullNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _positionFocusNode = FocusNode();
  bool _obscureText = true;
  final _loginFormKey = GlobalKey<FormState>();
  File? imageFile;

  @override
  void dispose() {
    _animationController.dispose();
    _fullNameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _positionCPTextController.dispose();
    _fullNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _positionFocusNode.dispose();
    _phoneFocusNode.dispose();
    _phoneTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((animationStatus) {
            if (animationStatus == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
          });
    _animationController.forward();
    super.initState();
  }

  void submitFormOnLogin() {
    final isValid = _loginFormKey.currentState!.validate();
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
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://images.unsplash.com/photo-1553877690-e82598a1c80e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTEyfHxidXNzaW5lc3N8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60",
            placeholder: (context, url) => const Image(
                image: NetworkImage(
              'https://images.pexels.com/photos/1181269/pexels-photo-1181269.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            )),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
            alignment: FractionalOffset(_animation.value, 0),
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                SizedBox(height: size.height * 0.1),
                const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          focusNode: _fullNameFocusNode,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_emailFocusNode),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field can\'t be missing';
                            }
                            return null;
                          },
                          controller: _fullNameTextController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Full name',
                            hintStyle: const TextStyle(color: Colors.white),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.pink.shade700),
                            ),
                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                          child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: size.width * 0.15,
                              height: size.width * 0.15,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                  borderRadius: BorderRadius.circular(16)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: imageFile == null
                                      ? Image.network(
                                          'https://louisville.edu/enrollmentmanagement/images/person-icon/image',
                                          fit: BoxFit.fill,
                                        )
                                      : Image.file(
                                          imageFile!,
                                          fit: BoxFit.fill,
                                        )),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                _showImageDialog();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.pink,
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.white,
                                    ),
                                    shape: BoxShape.circle),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    imageFile == null
                                        ? Icons.add_a_photo
                                        : Icons.edit_outlined,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    focusNode: _emailFocusNode,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_passwordFocusNode),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid Email address';
                      }
                      return null;
                    },
                    controller: _emailTextController,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: const TextStyle(color: Colors.white),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink.shade700),
                      ),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    focusNode: _passwordFocusNode,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_phoneFocusNode),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 7) {
                        return 'Please enter a valid password';
                      }
                      return null;
                    },
                    obscureText: _obscureText,
                    controller: _passwordTextController,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                      ),
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Colors.white),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink.shade700),
                      ),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  focusNode: _phoneFocusNode,
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(_positionFocusNode),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field can\'t be missing';
                    }
                    return null;
                  },
                  onChanged: (v) {
                    print(
                        '_phoneTextController.text ${_phoneTextController.text}');
                  },
                  controller: _phoneTextController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Phone number',
                    hintStyle: const TextStyle(color: Colors.white),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink.shade700),
                    ),
                    errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      showJobsDialog(context, size);
                    },
                    child: TextFormField(
                        enabled: false,
                        focusNode: _positionFocusNode,
                        textInputAction: TextInputAction.done,
                        onEditingComplete: submitFormOnLogin,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Filed can\'t be missing ';
                          }
                          return null;
                        },
                        controller: _positionCPTextController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          hintText: 'Position in the company',
                          hintStyle: const TextStyle(color: Colors.white),
                          disabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink.shade700),
                          ),
                          errorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        )),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: 'Already have an account?  ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 16)),
                  TextSpan(
                      text: 'Login',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen())),
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16)),
                ])),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(height: size.height * 0.05),
                MaterialButton(
                  onPressed: submitFormOnLogin,
                  color: Colors.lightBlue,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                      side: BorderSide.none),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.person_add)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  File? _image;
  void _pickImage(ImageSource source)async{
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      setState(() {
        _image = img;
        Navigator.pop(context);
      });
    }on PlatformException catch(e){
      print(e);
      Navigator.pop(context);
    }

  }


  void _pickImageWithCamera() async {
    PickedFile? pickedFile = await ImagePicker()
        .getImage(source: ImageSource.camera, maxHeight: 1080, maxWidth: 1080);

    setState(() {
      imageFile =File(pickedFile!.path);
    });
  }

  void _pickImageWithGallery() async {
    PickedFile? pickedFile = await ImagePicker()
        .getImage(source: ImageSource.gallery, maxHeight: 1080, maxWidth: 1080);


    setState(() {
      imageFile =File(pickedFile!.path);
    });
  }
  Future<File?> _cropImage({required File imageFile})async{
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage==null) return null;
    return File(croppedImage.path);


  }

  void _showImageDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('please choose an option'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //const Divider(thickness: 1,),

                InkWell(
                  onTap: (){_pickImageWithCamera;},
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.camera,
                          color: Colors.purple,
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(color: Colors.purple),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {_pickImageWithGallery();},
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.image,
                          color: Colors.purple,
                        ),
                        Text(
                          'Gallery',
                          style: TextStyle(color: Colors.purple),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void showJobsDialog(context, size) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Jobs',
              style: TextStyle(color: Colors.pink[300], fontSize: 20),
            ),
            content: Container(
              width: size.width * 0.9,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Constants.jobsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        _positionCPTextController.text =
                            Constants.jobsList[index];
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
                              Constants.jobsList[index],
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
              TextButton(
                onPressed: () {},
                child: const Text('Cancel Filter'),
              ),
            ],
          );
        });
  }
}
