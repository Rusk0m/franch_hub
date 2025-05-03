import 'package:franch_hub/core/usecases/usecase.dart';
import 'package:franch_hub/features/chat/domain/entities/message.dart';
import 'package:franch_hub/features/chat/domain/repositories/chat_repository.dart';

class SendMessageUseCase implements UseCase<void, SendMessageParams> {
  final ChatRepository repository;

  SendMessageUseCase(this.repository);

  @override
  Future<void> call({SendMessageParams? params}) async {
    if (params == null) throw ArgumentError('SendMessageParams is required');
    await repository.sendMessage(params.message, params.chatId);
  }
}

class SendMessageParams {
  final Message message;
  final String chatId;

  SendMessageParams({required this.message, required this.chatId});
}