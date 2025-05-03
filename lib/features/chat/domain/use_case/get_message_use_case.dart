import 'package:franch_hub/core/usecases/stream_use_case.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/chat/domain/entities/message.dart';
import 'package:franch_hub/features/chat/domain/repositories/chat_repository.dart';

class GetMessagesUseCase implements StreamUseCase<List<Message>, String> {
  final ChatRepository repository= sl();

  GetMessagesUseCase();

  @override
  Stream<List<Message>> call({String? params}) {
    if (params == null) throw ArgumentError('chatId is required');
    return repository.getMessages(params);
  }
}