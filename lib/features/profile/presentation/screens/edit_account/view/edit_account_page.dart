import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/config/theme/text_theme.dart';
import 'package:franch_hub/core/global_widgets/global_widgets.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/profile/presentation/bloc/profile_bloc.dart';

class EditAccountPage extends StatelessWidget {
  final uid = sl<FirebaseAuth>().currentUser?.uid;
   EditAccountPage();

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is ProfileUpdateSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is ProfileEditReady) {
          nameController.text = state.name;
          phoneController.text = state.phone;
        }

        if (state is ProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Edit Profile', style: FlutterTextTheme.titleLarge(context)),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 60)),
                const SizedBox(height: 20),
                CustomTextField(label: 'Full Name', controller: nameController, suffixIcon: Icons.person_outline, isPassword: false),
                const SizedBox(height: 15),
                CustomTextField(label: 'Phone Number', controller: phoneController, suffixIcon: Icons.phone_outlined, isPassword: false),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                  onPressed: () {
                    context.read<ProfileBloc>().add(
                      UpdateProfile(
                        uid: uid!,
                        name: nameController.text,
                        phone: phoneController.text,
                      ),
                    );
                  },
                  child: state is ProfileLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Save Changes'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}