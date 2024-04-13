import 'package:flutter_bloc/flutter_bloc.dart';

import 'gateway/gateway.dart';
import 'gateway/states.dart';

class RootGateway extends Cubit<RootGatewayState> {
  RootGateway() : super(RootGatewayState()) {
    _updateGateways();

    // _localeSubsc = authGateway.localeStream.listen(
    //   (_) => _updateGateways(),
    // );
  }

  //late StreamSubscription<String> _localeSubsc;

  late Gateway _test;

  Gateway get gateway => _test;

  void _updateGateways() {
    _test = Gateway(
      uri: Uri(scheme: 'https', host: 'api.thecatapi.com'),
      token: () => 'live_UJQ5QGMSZAoVxdEIVuhiNCTlQUSjTHnPWI0aRwgqzUV2EtrcII4kOFAxU6rSw90J',
      onAuthError: (error) {
        emit(RootGatewayState(authError: error));
        emit(RootGatewayState());
      },
    );
  }

  // @override
  // Future<void> close() {
  //   _localeSubsc.cancel();
  //   return super.close();
  // }
}
