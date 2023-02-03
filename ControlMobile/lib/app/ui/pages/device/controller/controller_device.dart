import 'package:timer_control/app/ui/helpers/global_helpers.dart';
import 'package:web_socket_channel/io.dart';

///CONTROLLER ANDROID
class DevicesController extends ChangeNotifier {
  CountDownController countController = CountDownController();

  final DateTime dateTime = DateTime.now();

  void onStart() {
    countController.start();
  }

  void onLock(String ip) {
    socketEvent("timeUp", ip);
  }

  void onStop(String ip) {
    countController.reset();
    //countController.pause();

    socketEvent("timeUp", ip);
  }

  ///[unlock]
  void onUnlock(String ip) {
    socketEvent("unlock", ip);
  }

  ///[Socket]
  void socketEvent(String action, String ip) {
    IOWebSocketChannel? channel;
    try {
      channel = IOWebSocketChannel.connect('ws://$ip:8080');
    } catch (e) {
      // ignore: avoid_print
      print("Error on connecting to websocket: $e");
    }
    channel?.sink.add(action);
    channel?.stream.listen((event) {
      print(event);
      // Now only close the connection and we are done here!
      channel!.sink.close();
    });
  }
}
