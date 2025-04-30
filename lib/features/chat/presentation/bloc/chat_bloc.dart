import 'package:bloc/bloc.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/chat/domain/entities/message.dart';
import 'package:franch_hub/features/chat/domain/repositories/chat_repository.dart';
import 'package:uuid/uuid.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository chatRepository = sl();

  ChatBloc() : super(ChatInitial()) {
    on<LoadMessages>(_onLoadMessages);
    on<SendMessage>(_onSendMessage);
  }

  Future<void> _onLoadMessages(
      LoadMessages event, Emitter<ChatState> emit) async {
    emit(ChatLoading());
    try {
      final messagesStream = chatRepository.getMessages(event.chatId);
      await for (final messages in messagesStream) {
        emit(ChatLoaded(messages: messages));
      }
    } catch (e) {
      emit(ChatError(message: 'Failed to load messages: $e'));
    }
  }

  Future<void> _onSendMessage(SendMessage event, Emitter<ChatState> emit) async {
    try {
      final message = Message(
        id: const Uuid().v4(),
        senderId: event.senderId,
        receiverId: event.receiverId,
        content: event.content,
        sentAt: DateTime.now(),
      );
      await chatRepository.sendMessage(message, event.chatId);
    } catch (e) {
      emit(ChatError(message: 'Failed to send message: $e'));
    }
  }
}