import 'package:envo_safe/app/data/api_provider/api_client.dart';
import 'package:socket_io_client/socket_io_client.dart';

class ChatWsClient {
  Socket socket = init();  
  static init() {
    return io(ApiClient.baseUrl);
  }
}
