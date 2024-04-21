import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Login", style: Theme.of(context).textTheme.titleLarge),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: const Padding(
        padding:  EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              'Guess who’s back!!',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
             SizedBox(height: 20),
             Text(
              'Your Email',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            UserTextField(),

          ],
        ),
      ),
    );
  }
}


class UserTextField extends StatelessWidget {
  const UserTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          const TextField(
            maxLines: null,
            decoration: InputDecoration(
              hintText: 'yourmail@example.com',
              border: InputBorder.none,
            ),
            // come aggiungo un bottone interno?
          ),
          Positioned(
            right: 0,
            bottom: 5,
            child: TextButton(
              onPressed: () => print('a'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsetsDirectional.all(15)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              child: const Text('SUBMIT', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
