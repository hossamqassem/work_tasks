import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:work_tasks/screens/auth/Register.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final TextEditingController _forgetPasswordController =
      TextEditingController(text: '');

  @override
  void dispose() {
    _animationController.dispose();
    _forgetPasswordController.dispose();
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

  void _forgetPasswordFCT() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://images.unsplash.com/photo-1633194536901-fdc3ec15c577?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTQzfHxidXNzaW5lc3N8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60",
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
                  'Forget Password',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Email address',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _forgetPasswordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink.shade700),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                MaterialButton(
                  onPressed: _forgetPasswordFCT,
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
                          'Reset now',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
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
}
