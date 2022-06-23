import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //IMAGE
              Image.asset(
                "assets/images/login_image.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),

              //WELCOME TEXT
              const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              //USER NAME
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter User Name",
                  hintStyle: TextStyle(
                    fontSize: 16,
                  ),
                  label: Text("User Name"),
                ),
              ),
              const SizedBox(height: 20),

              //PASSWORD
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Enter Password",
                  hintStyle: TextStyle(
                    fontSize: 16,
                  ),
                  label: Text("Password"),
                ),
              ),
              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    MyRoutes.homeRoute,
                  );
                },
                style: TextButton.styleFrom(
                  minimumSize: const Size(200, 48),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
