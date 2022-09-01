import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm_state_mgt/provider/auth_provider.dart';
import 'package:flutter_provider_mvvm_state_mgt/screens/login_rest_api/home_page.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(hintText: "Username"),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(hintText: "Password"),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                authProvider
                    .login(
                  _usernameController.text,
                  _passwordController.text,
                )
                    .then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Container(
                        child: Text(value["token"] ?? "Error"),
                      ),
                    ),
                  );
                  if (value["token"] != null) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }
                });
              },
              child: Container(
                height: 40,
                width: double.maxFinite,
                decoration: const BoxDecoration(color: Colors.blue),
                child: Center(
                  child: authProvider.isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
