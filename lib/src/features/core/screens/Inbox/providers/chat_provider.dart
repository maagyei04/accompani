import 'package:accompani/src/repository/chat_repository/chat_repository.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  late final ChatRepository chatRepository;

  @override
  void onInit() {
    chatRepository = ChatRepository();
    super.onInit();
  }
}