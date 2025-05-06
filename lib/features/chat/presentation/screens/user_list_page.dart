import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:franch_hub/config/routes/app_routes.dart';
import 'package:franch_hub/core/entities/user.dart';
import 'package:franch_hub/features/auth/data/models/user_model.dart';
import 'package:franch_hub/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:franch_hub/generated/l10n.dart';

class UsersListPage extends StatelessWidget {
  const UsersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthBloc>().state;
    if (authState is! Authenticated) {
      return Scaffold(
        body: Center(
            child: Text(S.of(context)!.pleaseLogInToViewUsers)),
      );
    }
    final currentUser = authState.user;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context)!.selectUserToChatTitle),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
                child: Text(S.of(context)!.noUsersFound));
          }
          final users = snapshot.data!.docs
              .map((doc) => UserModel.fromFirestore(doc).toEntity())
              .where((user) => user.uid != currentUser.uid)
              .toList();
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user.name ?? user.email),
                subtitle: Text(user.email),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRouter.chatPage,
                    arguments: {
                      'currentUser': currentUser,
                      'otherUser': user,
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}