import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_booking/Screen/home.dart';
import 'package:travel_booking/Screen/login.dart';
import 'package:travel_booking/provider/user_provider.dart';
import 'package:travel_booking/widgets/bottom_navigation_travelkuy.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child:MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return MaterialApp(
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              ref.read(userProvider.notifier).login(snapshot.data!.email!);
              return HomeScreen();
            }
            return const SignIn();
          }),
      debugShowCheckedModeBanner: false,
      title: "Travel App",
      // routes: {"/": (context) => SignIn()},
    );
  }
}
