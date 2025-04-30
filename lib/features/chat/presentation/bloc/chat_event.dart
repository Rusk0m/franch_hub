part of 'chat_bloc.dart';

abstract class ChatEvent {
  const ChatEvent();
}

class LoadMessages extends ChatEvent {
  final String chatId;

  const LoadMessages({required this.chatId});
}

class SendMessage extends ChatEvent {
  final String content;
  final String senderId;
  final String receiverId;
  final String chatId;

  const SendMessage({
    required this.content,
    required this.senderId,
    required this.receiverId,
    required this.chatId,
  });
}