import 'package:app_chat/components/message_bubble.dart';
import 'package:app_chat/core/models/chat_message.dart';
import 'package:app_chat/core/services/auth/auth_service.dart';
import 'package:app_chat/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = AuthService().currentUser;
    return StreamBuilder<List<ChatMessage>>(
      stream: ChatService().messagesStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: const Text('Sem dados. Vamos conversar?'));
        } else {
          final message = snapshot.data!;
          return ListView.builder(
            reverse: true,
            itemCount: message.length,
            itemBuilder: (context, index) {
              return MessageBubble(
                key: ValueKey(message[index].id),
                message: message[index],
                belongsToCurrentUser: currentUser?.id == message[index].userId,
              );
            },
          );
        }
      },
    );
  }
}
