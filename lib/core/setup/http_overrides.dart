import 'dart:io';

class DevHttpOverrides extends HttpOverrides {
  bool badCertCallback(X509Certificate cert, String host, int port) {
    return true;
  }

  @override
  HttpClient createHttpClient(SecurityContext? context) =>
      super.createHttpClient(context)..badCertificateCallback = badCertCallback;
}
