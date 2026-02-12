import 'package:dashboardca/auth/auth_respository.dart';
import 'package:dashboardca/features/dashboard/presentation/pages/main_shell_page.dart';
import 'package:flutter/material.dart';


class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final authRepo = AuthRepository();

  final name = TextEditingController();
  final email = TextEditingController();
  final mobile = TextEditingController();
  final department = TextEditingController();
  final committeeName = TextEditingController();
  final designation = TextEditingController();
  final fiveSDesignation = TextEditingController();
  final fiveSTeam = TextEditingController();
  final committeeDesignation = TextEditingController();
  final teamName = TextEditingController();
  final teamDesignation = TextEditingController();
  final gender = TextEditingController();
  final manager = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        title: const Text('Create Account'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    'Signup',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  const SizedBox(height: 20),

                  _field(name, 'Name'),
                  _field(email, 'Email'),
                  _field(mobile, 'Mobile'),
                  _field(department, 'Department'),
                  _field(committeeName, 'Committee Name'),
                  _field(designation, 'Designation'),
                  _field(fiveSDesignation, '5S Designation'),
                  _field(fiveSTeam, '5S Team'),
                  _field(committeeDesignation, 'Committee Designation'),
                  _field(teamName, 'Team Name'),
                  _field(teamDesignation, 'Team Designation'),
                  _field(gender, 'Gender'),
                  _field(manager, 'Manager ID'),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      minimumSize: const Size(double.infinity, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      try {
                        await authRepo.signup(
                          name: name.text,
                          email: email.text,
                          mobile: mobile.text,
                          department: department.text,
                          committeeName: committeeName.text,
                          designation: designation.text,
                          fiveSDesignation: fiveSDesignation.text,
                          fiveSTeam: fiveSTeam.text,
                          committeeDesignation: committeeDesignation.text,
                          teamName: teamName.text,
                          teamDesignation: teamDesignation.text,
                          gender: gender.text,
                          manager: manager.text,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Signup successful 🎉'),
                            backgroundColor: Colors.green,
                          ),
                        );

                       Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const MainShellPage(),
                          ),
                          (route) => false,
                        );

                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Signup failed ❌'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: const Text('CREATE ACCOUNT'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _field(TextEditingController c, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: c,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
