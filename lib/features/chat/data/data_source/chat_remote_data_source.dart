import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:franch_hub/features/chat/data/models/message_model.dart';

abstract class ChatRemoteDataSource {
  Future<void> sendMessage(MessageModel message, String chatId);
  Stream<List<MessageModel>> getMessages(String chatId);
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final FirebaseFirestore firestore;

  ChatRemoteDataSourceImpl({required this.firestore});

  @override
  Future<void> sendMessage(MessageModel message, String chatId) async {
    try {
      await firestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .doc(message.id)
          .set(message.toJson());
    } catch (e) {
      throw Exception('Failed to send message: $e');
    }
  }

  @override
  Stream<List<MessageModel>> getMessages(String chatId) {
    return firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('sentAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => MessageModel.fromFirestore(doc))
        .toList());
  }
}