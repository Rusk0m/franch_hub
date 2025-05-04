import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/core/entities/user.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/chat/presentation/bloc/chat_bloc.dart';

class ChatPage extends StatelessWidget {
  final UserEntity currentUser;
  final UserEntity otherUser;

  ChatPage({
    super.key,
    required Map<String, dynamic> arguments,
  })  : currentUser = arguments['currentUser'] as UserEntity,
        otherUser = arguments['otherUser'] as UserEntity;

  @override
  Widget build(BuildContext context) {
    final chatId = _generateChatId(currentUser.uid, otherUser.uid);
    return BlocProvider(
      create: (_) => sl<ChatBloc>()..add(LoadMessages(chatId: chatId)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(otherUser.name ?? otherUser.email),
        ),
        body: _ChatBody(
          currentUser: currentUser,
          otherUser: otherUser,
          chatId: chatId,
        ),
      ),
    );
  }

  String _generateChatId(String uid1, String uid2) {
    final ids = [uid1, uid2]..sort();
    return '${ids[0]}_${ids[1]}';
  }
}

class _ChatBody extends StatefulWidget {
  final UserEntity currentUser;
  final UserEntity otherUser;
  final String chatId;

  const _ChatBody({
    required this.currentUser,
    required this.otherUser,
    required this.chatId,
  });

  @override
  _ChatBodyState createState() => _ChatBodyState();
}

class _ChatBodyState extends State<_ChatBody> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final content = _controller.text.trim();
    if (content.isNotEmpty) {
      context.read<ChatBloc>().add(
        SendMessage(
          content: content,
          senderId: widget.currentUser.uid,
          receiverId: widget.otherUser.uid,
          chatId: widget.chatId,
        ),
      );
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              if (state is ChatLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ChatLoaded) {
                return ListView.builder(
                  reverse: true,
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    final message = state.messages[index];
                    final isCurrentUser =
                        message.senderId == widget.currentUser.uid;
                    return Align(
                      alignment: isCurrentUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isCurrentUser
                              ? Colors.blue[100]
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: isCurrentUser
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Text(message.content),
                            const SizedBox(height: 4),
                            Text(
                              message.sentAt.toString().substring(0, 16),
                              style: const TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (state is ChatError) {
                return Center(child: Text('Error: ${state.message}'));
              }
              return const Center(child: Text('No messages yet'));
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Type a message...',
                    border: OutlineInputBorder(),
                  ),
                  onSubmitted: (_) => _sendMessage(),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: _sendMessage,
              ),
            ],
          ),
        ),
      ],
    );
  }
}