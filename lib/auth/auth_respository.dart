import '../core/api.dart';
import '../core/local_storage.dart';

class AuthRepository {
  Future<void> login(String employeeId, String password) async {
    final response = await Api.login(
      employeeId: employeeId,
      password: password,
    );

    final token = response['token'] ?? response['accessToken'];

    if (token == null) {
      throw Exception("Token missing in response");
    }

    await LocalStorage.saveToken(token);
  }

  Future<void> signup({
    required String name,
    required String email,
    required String mobile,
    required String department,
    required String committeeName,
    required String designation,
    required String fiveSDesignation,
    required String fiveSTeam,
    required String committeeDesignation,
    required String teamName,
    required String teamDesignation,
    required String gender,
    required String manager,
  }) async {
    await Api.signup(
      name: name,
      email: email,
      mobile: mobile,
      department: department,
      committeeName: committeeName,
      designation: designation,
      fiveSDesignation: fiveSDesignation,
      fiveSTeam: fiveSTeam,
      committeeDesignation: committeeDesignation,
      teamName: teamName,
      teamDesignation: teamDesignation,
      gender: gender,
      manager: manager,
    );
  }
}
