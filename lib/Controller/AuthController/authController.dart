import 'package:guide_app/Model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final _supabase = Supabase.instance.client;

  Future<AuthResponse> signIn(String email, String password) async {
    return await _supabase.auth
        .signInWithPassword(email: email, password: password);
  }

  Future<AuthResponse> signUp(String email, String password) async {
    return await _supabase.auth.signUp(email: email, password: password);
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  Future<UserModel> getUser() async {
    final user = _supabase.auth.currentUser!;
    return UserModel.fromMap(
      await _supabase.from('users').select().eq('id', user.id).single(),
    );
  }
}
