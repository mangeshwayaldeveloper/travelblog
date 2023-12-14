import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../provider/user_provider.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});

  @override
  ConsumerState<Profile> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<Profile> {
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LocalUser currentUser = ref.watch(userProvider);
    _nameController.text = currentUser.user.name;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
                  // Pick an image.
                  final XFile? pickedImage = await picker.pickImage(
                      source: ImageSource.gallery, requestFullMetadata: false);
                  if (pickedImage != null) {
                    ref
                        .read(userProvider.notifier)
                        .updateImage(File(pickedImage.path));
                  }
                },
                child: Container(
                  height: 250,
                  width: 250,
                  child: CircleAvatar(
                    foregroundImage: NetworkImage(
                      currentUser.user.profilePic,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text("Tap To Change The Image"),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Enter Your Name"),
                  controller: _nameController,
                ),
              ),
              TextButton(
                  onPressed: () {
                    ref
                        .read(userProvider.notifier)
                        .updateName(_nameController.text);
                  },
                  child: Text("Update")),
              SizedBox(height: 60,),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 1.2,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(FirebaseAuth.instance.signOut());
                      ref.read(userProvider.notifier).logout();
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(fontSize: 18),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
