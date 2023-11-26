import 'package:web_socket_channel/web_socket_channel.dart';

//Returns a socket object after connection
WebSocketChannel connectToSocket() {
  return WebSocketChannel.connect(
    Uri.parse('ws://192.168.0.14:81'),
  );
}
