part of 'chat_bloc.dart';

abstract class ChatEvent {
  const ChatEvent();
}

class LoadMessages extends ChatEvent {
  final String chatId;
  final BuildContext context;

  const LoadMessages({required this.chatId, required this.context});
}

class SendMessage extends ChatEvent {
  final String content;
  final String senderId;
  final String receiverId;
  final String chatId;
  final bool isSystemMessage;
  final BuildContext context;

  const SendMessage({
    required this.content,
    required this.senderId,
    required this.receiverId,
    required this.chatId,
    this.isSystemMessage = false,
    required this.context,
  });
}

class UpdateTextInput extends ChatEvent {
  final String text;

  const UpdateTextInput({required this.text});
}

class ClearTextInput extends ChatEvent {
  const ClearTextInput();
}