import 'dart:async';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService extends GetxService {
  final RxBool hasNetwork = true.obs;
  late final StreamSubscription _subscription;

  Future<ConnectivityService> init() async {
    final result = await Connectivity().checkConnectivity();
    hasNetwork.value = result.contains(ConnectivityResult.none) ;

    _subscription = Connectivity().onConnectivityChanged.listen((status) {
      hasNetwork.value = status.contains(ConnectivityResult.none);
    });

    return this;
  }

  @override
  void onClose() {
    _subscription.cancel();
    super.onClose();
  }
}
