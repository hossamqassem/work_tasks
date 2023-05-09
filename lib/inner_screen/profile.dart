import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:work_tasks/constants/constants.dart';

import '../widgets/drawer_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        elevation: 0,
        leading: Builder(builder: (context) {

          return IconButton(
            icon: const Icon(Icons.menu_outlined, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
      ),
      body: Padding(

        padding: const EdgeInsets.only(top: 100),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Card(

                margin: const EdgeInsets.all(30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Name',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Job since joined data(2022-....)',
                          style: TextStyle(
                              fontSize: 18,
                              color: Constants.darkBlue,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Contact Info',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      socialInfo(label: 'Email', content: 'Email@gmail.com'),
                      const SizedBox(
                        height: 10,
                      ),
                      socialInfo(label: 'Phone number', content: '+23456744'),
                      const SizedBox(height: 30),
                      Row(

                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          socialButtons(
                              color: Colors.green,
                              icon: FontAwesomeIcons.whatsapp,
                              ftc: () {
                               _openWhatsAppChat();
                              }),
                          socialButtons(
                              color: Colors.red,
                              icon: Icons.mail_outline,
                              ftc: () {_mailTo();}),
                          socialButtons(
                              color: Colors.purple,
                              icon: Icons.call_outlined,
                              ftc: () {}),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Center(
                          child: MaterialButton(
                            onPressed: () {},
                            color: Colors.pink,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                                side: BorderSide.none),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.logout),
                                SizedBox(width: 10),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 14),
                                  child: Text(
                                    'Logout',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * 0.17,
                      height: size.width * 0.17,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 10,
                              color: Theme
                                  .of(context)
                                  .scaffoldBackgroundColor),
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                              image: NetworkImage(
                                  'https://cdn.iconscout.com/icon/free/png-256/free-avatar-370-456322.png?f=webp&w=256'),
                              fit: BoxFit.fill)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

   void _openWhatsAppChat()async{
     var whatsappUrl = "whatsapp://send?phone=+201006476494";
     await canLaunchUrl(Uri.parse(whatsappUrl))
         ? launchUrl(Uri.parse(whatsappUrl))
         : print(
         "Why is there an error");

   }

  _launchURL() async {
    const url = ' "https://wa.me/+923045873730/?text=Hello"';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _mailTo()async{
    String email ='hossam@gmail.com';
    var url ='mailto:$email';
    await launch(url);
    if (await canLaunchUrl(url as Uri)){
      await launch(url);
    }

  }

  Widget socialInfo({required String label, required String content}) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            content,
            style: TextStyle(
                fontSize: 16,
                color: Constants.darkBlue,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        )
      ],
    );
  }

  Widget socialButtons(
      {required Color color, required IconData icon, required Function ftc}) {
    return CircleAvatar(
      backgroundColor: color,
      radius: 25,
      child: CircleAvatar(
        radius: 23,
        backgroundColor: Colors.white,
        child: IconButton(
            onPressed: () {
            ftc();
            },
            icon: Icon(
              icon,
              color: color,
            )),
      ),
    );
  }
}
