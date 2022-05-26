import 'package:socket_io_client/socket_io_client.dart';

class ChatWsClient {
  Socket socket = init();
  static String baseUrl = "http://685e-103-117-14-176.ngrok.io";
  static init() {
    return io(baseUrl);
  }
}
