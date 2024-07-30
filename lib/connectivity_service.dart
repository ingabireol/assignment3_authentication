import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  ConnectivityService() {
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _showToast(result);
    });
  }

  void _showToast(ConnectivityResult result) {
    String message;
    if (result == ConnectivityResult.mobile) {
      message = "Connected to Mobile Network";
    } else if (result == ConnectivityResult.wifi) {
      message = "Connected to WiFi";
    } else {
      message = "No Internet Connection";
    }
    Fluttertoast.showToast(msg: message);
  }
}
