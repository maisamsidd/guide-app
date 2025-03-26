import 'package:flutter/material.dart';
import 'package:guide_app/VIews/Authentication/login_page.dart';
import 'package:guide_app/VIews/HomePage/home_page.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGateway extends StatelessWidget {
  const AuthGateway({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          }

          final session = snapshot.hasData ? snapshot.data!.session : null;
          if (session != null) {
            print(session.toString());
            return const HomePage();
          } else {
            return const LoginPage();
          }
        });
  }
}
