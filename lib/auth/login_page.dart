import 'package:dashboardca/auth/auth_respository.dart';
import 'package:dashboardca/auth/signup_page.dart';
import 'package:dashboardca/features/dashboard/presentation/pages/main_shell_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final empIdController = TextEditingController();
  final passwordController = TextEditingController();
  final authRepo = AuthRepository();

  void showSnack(String msg, Color color) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(msg), backgroundColor: color));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: Center(
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SizedBox(
              width: 320,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: empIdController,
                    decoration: const InputDecoration(
                      labelText: 'Employee ID',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 219, 222, 237),
                      minimumSize: const Size(double.infinity, 45),
                    ),
                   onPressed: () async {
                      try {
                        await authRepo.login(
                          empIdController.text,
                          passwordController.text,
                        );

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const MainShellPage(),
                          ),
                        );
                      } catch (e) {
                        showSnack(e.toString(), Colors.red);
                      }
                    },


                    child: const Text('LOGIN'),
                  ),
                  const SizedBox(height: 10),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SignupPage()),
                      );
                    },
                    child: const Text(
                      'Create a new account',
                      style: TextStyle(color: Colors.indigo),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
