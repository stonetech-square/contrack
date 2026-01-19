import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:contrack/src/features/user_management/data/models/change_role_result.dart';
import 'package:contrack/src/features/user_management/data/models/toggle_status_result.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserManagementRemoteDataSource {
  Future<String> createUser({
    required String fullName,
    required String email,
    required String username,
    required UserRole role,
  });
  Future<bool> updateUser({
    required String userId,
    String? fullName,
    String? email,
    String? username,
  });
  Future<ToggleStatusResult> toggleUserStatus(String userId);
  Future<ChangeRoleResult> changeUserRole(String userId, UserRole role);
}

@LazySingleton(as: UserManagementRemoteDataSource)
class UserManagementRemoteDataSourceImpl
    implements UserManagementRemoteDataSource {
  final SupabaseClient _supabaseClient;

  UserManagementRemoteDataSourceImpl(this._supabaseClient);
  @override
  Future<String> createUser({
    required String fullName,
    required String email,
    required String username,
    required UserRole role,
  }) async {
    final response = await _supabaseClient.functions.invoke(
      'create-user',
      body: {
        'full_name': fullName,
        'email': email,
        'username': username,
        'role': role.name,
      },
    );
    return response.data as String;
  }

  @override
  Future<bool> updateUser({
    required String userId,
    String? fullName,
    String? email,
    String? username,
  }) async {
    final response = await _supabaseClient
        .from('profiles')
        .update({
          if (fullName != null) 'full_name': fullName,
          if (email != null) 'email': email,
          if (username != null) 'username': username,
          'updated_at': DateTime.now().toIso8601String(),
        })
        .eq('id', userId)
        .select();
    return response.isNotEmpty;
  }

  @override
  Future<ToggleStatusResult> toggleUserStatus(String userId) async {
    final response = await _supabaseClient.functions.invoke(
      'toggle-user-status',
      body: {'userId': userId},
    );
    final data = response.data as Map<String, dynamic>;
    return ToggleStatusResult(
      success: data['success'] == true,
      isActive: data['isActive'] == true,
    );
  }

  @override
  Future<ChangeRoleResult> changeUserRole(String userId, UserRole role) async {
    final response = await _supabaseClient.functions.invoke(
      'change-user-role',
      body: {'userId': userId, 'role': role.name},
    );
    final data = response.data as Map<String, dynamic>;
    return ChangeRoleResult(
      success: data['success'] == true,
      role: UserRole.values.firstWhere((e) => e.name == data['role']),
    );
  }
}
