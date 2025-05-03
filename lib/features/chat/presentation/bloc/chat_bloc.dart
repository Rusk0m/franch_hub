import 'package:bloc/bloc.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/chat/domain/entities/message.dart';
import 'package:franch_hub/features/chat/domain/use_case/get_message_use_case.dart';
import 'package:franch_hub/features/chat/domain/use_case/send_message_use_case.dart';
import 'package:uuid/uuid.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SendMessageUseCase sendMessageUseCase =sl();
  final GetMessagesUseCase getMessagesUseCase =sl();

  ChatBloc() : super(const ChatInitial()) {
    on<LoadMessages>(_onLoadMessages);
    on<SendMessage>(_onSendMessage);
    on<UpdateTextInput>(_onUpdateTextInput);
    on<ClearTextInput>(_onClearTextInput);
  }

  Future<void> _onLoadMessages(
      LoadMessages event, Emitter<ChatState> emit) async {
    if (event.chatId.isEmpty) {
      emit(const ChatError(
        message: 'Chat ID is required',
        textInput: '',
      ));
      return;
    }
    emit(const ChatLoading(textInput: ''));
    try {
      final messagesStream = getMessagesUseCase(params: event.chatId);
      await for (final messages in messagesStream) {
        emit(ChatLoaded(
          messages: messages,
          textInput: state.textInput,
        ));
      }
    } catch (e) {
      emit(ChatError(
        message: 'Failed to load messages: $e',
        textInput: state.textInput,
      ));
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
        isSystemMessage: event.isSystemMessage,
      );
      await sendMessageUseCase(
        params: SendMessageParams(
          message: message,
          chatId: event.chatId,
        ),
      );
      emit(ChatLoaded(
        messages: (state is ChatLoaded) ? (state as ChatLoaded).messages : [],
        textInput: '',
      ));
    } catch (e) {
      emit(ChatError(
        message: 'Failed to send message: $e',
        textInput: state.textInput,
      ));
    }
  }

  void _onUpdateTextInput(UpdateTextInput event, Emitter<ChatState> emit) {
    if (state is ChatInitial) {
      emit(ChatInitial(textInput: event.text));
    } else if (state is ChatLoading) {
      emit(ChatLoading(textInput: event.text));
    } else if (state is ChatLoaded) {
      emit(ChatLoaded(
        messages: (state as ChatLoaded).messages,
        textInput: event.text,
      ));
    } else if (state is ChatError) {
      emit(ChatError(
        message: (state as ChatError).message,
        textInput: event.text,
      ));
    }
  }

  void _onClearTextInput(ClearTextInput event, Emitter<ChatState> emit) {
    if (state is ChatInitial) {
      emit(const ChatInitial());
    } else if (state is ChatLoading) {
      emit(const ChatLoading(textInput: ''));
    } else if (state is ChatLoaded) {
      emit(ChatLoaded(
        messages: (state as ChatLoaded).messages,
        textInput: '',
      ));
    } else if (state is ChatError) {
      emit(ChatError(
        message: (state as ChatError).message,
        textInput: '',
      ));
    }
  }
}