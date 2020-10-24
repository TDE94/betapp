import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:iddaa_kazanc/thema/thema_manager.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayarlar'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Consumer<ThemeNotifier>(
              builder: (context, notifier, child) => SwitchListTile(
                title: Text("Gece Modu"),
                onChanged: (val) {
                  notifier.toggleTheme();
                },
                value: notifier.darkTheme,
              ),
            ),
            Container(
              height: size.height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    child: Text("Bizi İnstagramdan Takip Et"),
                    onPressed: () {
                      urlGit();
                    },
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text('Bize Ulaşın'),
              onPressed: () {
                sendMail();
              },
            )
          ],
        ),
      ),
    );
  }
}

sendMail() async {
  AndroidIntent intent = AndroidIntent(
    action: 'android.intent.action.MAIN',
    category: 'android.intent.category.APP_EMAIL',
  );
  await intent.launch();
}

urlGit() async {
  const url = 'https://www.instagram.com/iddaakazancimapp/';
  if (await canLaunch(url)) {
    await launch(url,
        forceWebView: true, forceSafariVC: false, enableJavaScript: true);
  } else {
    throw 'Url Bulunamadı $url';
  }
}
