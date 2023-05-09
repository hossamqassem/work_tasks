import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:work_tasks/screens/auth/Register.dart';
import 'package:work_tasks/screens/auth/forget_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final TextEditingController _emailTextController =
      TextEditingController(text: '');
  final TextEditingController _passwordTextController =
      TextEditingController(text: '');
  bool _obscureText = true;
  final _loginFormKey = GlobalKey<FormState>();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _animationController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _passwordFocusNode.dispose();
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
                  'Login',
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
                  child: TextFormField(
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(_passwordFocusNode),
                      validator: (value) {
                        if (value!.isEmpty || value.contains('@')) {
                          return 'please entre a valid Email address';
                        }
                        return null;
                      },
                      controller: _emailTextController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                          icon: Icon(Icons.email))),
                ),
                SizedBox(height: size.height * 0.05),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    onEditingComplete: submitFormOnLogin,
                      textInputAction: TextInputAction.next,
                      focusNode: _passwordFocusNode,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 7) {
                          return 'Please enter a valid password';
                        }
                        return null;
                      },
                      obscureText: _obscureText,
                      controller: _passwordTextController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              (_obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          hintText: 'password',
                          hintStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                          icon: const Icon(Icons.password))),
                ),
                SizedBox(height: size.height * 0.04),
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: 'Don\'t have an account?    ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 16)),
                  TextSpan(
                      text: 'Register',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen())),
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16)),
                ])),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      onPressed: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgetPasswordScreen()));
                      },
                      child: const Text(
                        'forget password?',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontStyle: FontStyle.italic),
                      )),
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
                          'Login',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.login)
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
