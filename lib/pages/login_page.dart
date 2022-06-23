import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
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
              Text(
                "Welcome $name",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              //USER NAME
              TextFormField(
                onChanged: (value) {
                  name = value;
                  setState(() {});
                },
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

              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(
              //       context,
              //       MyRoutes.homeRoute,
              //     );
              //   },
              //   style: TextButton.styleFrom(
              //     minimumSize: const Size(200, 48),
              //   ),
              //   child: const Text(
              //     "Login",
              //     style: TextStyle(
              //       fontSize: 16,
              //     ),
              //   ),
              // )

              InkWell(
                onTap: () async {
                  setState(() {
                    changeButton = true;
                  });
                  await Future.delayed(const Duration(seconds: 2));
                  Navigator.pushNamed(
                    context,
                    MyRoutes.homeRoute,
                  );
                },
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: 50,
                  width: changeButton == true ? 50 : 200,
                  decoration: BoxDecoration(
                    color:
                        changeButton == true ? Colors.green : Colors.deepPurple,
                    borderRadius: changeButton == true
                        ? BorderRadius.circular(100)
                        : BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: changeButton == true
                      ? const Icon(
                          Icons.done,
                          color: Colors.white,
                        )
                      : const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
