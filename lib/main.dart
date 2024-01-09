import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:plantesmedicinales/ui/signin_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyA6Gq9p9BlkMXzaC-dmOGyx2ANB5Pt5YAw",
        appId: "1:52748285224:web:c6b6e79f308b2f44184c1d",
        messagingSenderId: "52748285224",
        projectId: "plantsmedicinales-d381a",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'PlantesMedicinales',
      home: SignIn(),
      debugShowCheckedModeBanner: false,
    );
  }
}
