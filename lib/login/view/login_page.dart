import 'package:facebook_login_app/home/home_page.dart';
import 'package:facebook_login_app/login/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as facebook;
import 'package:flutter/foundation.dart' show kIsWeb;

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const path = '/login';
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign In',
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () async {
            if (kIsWeb) {
              await facebook.FacebookAuth.i.webInitialize(
                  appId: '1025143801428078',
                  cookie: true,
                  xfbml: true,
                  version: "v13.0");
              final facebook.LoginResult result =
                  await facebook.FacebookAuth.instance.login();
              if (result.status == facebook.LoginStatus.success) {
                final facebook.AccessToken accessToken = result.accessToken!;
                final data = await facebook.FacebookAuth.instance.getUserData();
                User user = User.fromJson(data);
                print('Login with Web');
                Navigator.of(context).push(HomePage.route(user));
                //print(data["picture"]["data"]);
              } else {
                print(result.status);
                print(result.message);
              }
            } else {
              final facebook.LoginResult result =
                  await facebook.FacebookAuth.instance.login();
              if (result.status == facebook.LoginStatus.success) {
                final facebook.AccessToken accessToken = result.accessToken!;
                final data = await facebook.FacebookAuth.instance.getUserData();
                User user = User.fromJson(data);
                print('Login with Mobile');
                Navigator.of(context).push(HomePage.route(user));
              } else {
                print(result.status);
                print(result.message);
              }
            }
          },
          icon: const Icon(Icons.facebook),
          label: const Text('Login with Facebook'),
        ),
      ),
    );
  }
}
