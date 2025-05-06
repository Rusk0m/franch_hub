part of 'chat_bloc.dart';

abstract class ChatState {
  final String textInput;

  const ChatState({this.textInput = ''});
}

class ChatInitial extends ChatState {
  const ChatInitial({super.textInput});
}

class ChatLoading extends ChatState {
  const ChatLoading({super.textInput});
}

class ChatLoaded extends ChatState {
  final List<Message> messages;

  const ChatLoaded({required this.messages, super.textInput});
}

class ChatError extends ChatState {
  final String message;

  const ChatError({required this.message, super.textInput});
}