import 'package:facebook_login_app/login/model/user_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key? key, required this.user}) : super(key: key);
  const HomePage({Key? key, required this.user}) : super(key: key);
  static const path = '/home';

  final User user;

  static Route route(User user) {
    return MaterialPageRoute<void>(
      builder: (_) => HomePage(
          user: user,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(user.picture.url),
              ],
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Text('Name', style: Theme.of(context).textTheme.bodySmall,),
                  const SizedBox(height: 8,),
                  Text(user.name, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16,),
                  Text('Email', style: Theme.of(context).textTheme.bodySmall,),
                  const SizedBox(height: 8,),
                  Text(user.email, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
