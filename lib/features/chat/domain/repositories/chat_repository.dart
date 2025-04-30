import 'package:franch_hub/features/chat/domain/entities/message.dart';

abstract class ChatRepository {
  Future<void> sendMessage(Message message, String chatId);
  Stream<List<Message>> getMessages(String chatId);
}