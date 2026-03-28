import 'package:local_auth/local_auth.dart';

class BiometricService {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> authenticate() async {
    try {
      bool canCheckBiometrics = await _auth.canCheckBiometrics;
      bool isDeviceSupported = await _auth.isDeviceSupported();

      if (!canCheckBiometrics || !isDeviceSupported) {
        return false;
      }

      bool didAuthenticate = await _auth.authenticate(
        localizedReason: 'Please authenticate to unlock the app',
        biometricOnly: true,
      );

      return didAuthenticate;
    } catch (e) {
      print("/////////////////////////////////////////////");
      print(e);
      print("/////////////////////////////////////////////");
      return false;
    }
  }
}
