import 'package:flutter_bloc/flutter_bloc.dart';

import 'gateway/gateway.dart';
import 'gateway/states.dart';

class RootGateway extends Cubit<RootGatewayState> {
  RootGateway() : super(RootGatewayState()) {
    _updateGateways();
  }

  late Gateway _test;

  Gateway get gateway => _test;

  String get token => 'live_UJQ5QGMSZAoVxdEIVuhiNCTlQUSjTHnPWI0aRwgqzUV2EtrcII4kOFAxU6rSw90J';

  void _updateGateways() {
    _test = Gateway(
      uri: Uri(scheme: 'https', host: 'api.thecatapi.com'),
      token: () => token,
      onAuthError: (error) {
        emit(RootGatewayState(authError: error));
        emit(RootGatewayState());
      },
    );
  }
}
