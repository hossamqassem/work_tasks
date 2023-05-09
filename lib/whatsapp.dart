
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Whatsapp extends StatelessWidget {
  const Whatsapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: IconButton(onPressed: ()async{
        var whatsappUrl = "whatsapp://send?phone=+201006476494";
        await canLaunchUrl(Uri.parse(whatsappUrl))
            ? launchUrl(Uri.parse(whatsappUrl))
            : print(
            "Why is there an error");

      }, icon: const Icon(FontAwesomeIcons.whatsapp), ),
    );
  }
}
