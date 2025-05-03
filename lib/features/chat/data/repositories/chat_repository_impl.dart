import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/chat/data/data_source/chat_remote_data_source.dart';
import 'package:franch_hub/features/chat/data/models/message_model.dart';
import 'package:franch_hub/features/chat/domain/entities/message.dart';
import 'package:franch_hub/features/chat/domain/repositories/chat_repository.dart';
class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource = sl();

  ChatRepositoryImpl();

  @override
  Future<void> sendMessage(Message message, String chatId) async {
    try {
      final messageModel = MessageModel.fromEntity(message);
      await remoteDataSource.sendMessage(messageModel, chatId);
    } catch (e) {
      throw Exception('Failed to send message: $e');
    }
  }

  @override
  Stream<List<Message>> getMessages(String chatId) {
    return remoteDataSource.getMessages(chatId).map(
          (models) => models.map((model) => model.toEntity()).toList(),
    );
  }
}