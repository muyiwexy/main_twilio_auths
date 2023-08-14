import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;

class AppwriteAuth {
  final Client _client;

  AppwriteAuth()
      : _client = Client()
          ..setEndpoint("http://10.0.2.2:3000/v1")
          ..setProject("64d7901207df1564813f");

  Future<models.Token> phoneLogin(String phoneNumber) async {
    final account = Account(_client);

    try {
      final response = await account.createPhoneSession(
        userId: ID.unique(),
        phone: phoneNumber,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<models.Session> verifyPhoneOTP({
    required String userID,
    required String otp,
  }) async {
    final account = Account(_client);

    try {
      return await account.updatePhoneSession(
        userId: userID,
        secret: otp,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> enter(String userID, String otp) async {
    await verifyPhoneOTP(userID: userID, otp: otp);
  }
}
