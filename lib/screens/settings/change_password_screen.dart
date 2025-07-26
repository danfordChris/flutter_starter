// change_password_screen.dart
import 'package:changisha/constants/app_colors.dart';
import 'package:changisha/constants/app_text_style.dart';
import 'package:changisha/services/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _isDarkMode = SessionManager.instance.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),

        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedArrowLeft02,
            color: AppColors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _submitForm,
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedChef,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildPasswordField(
                  context,
                  controller: _currentPasswordController,
                  label: 'Current Password',
                  obscureText: _obscureCurrentPassword,
                  onToggleVisibility: () => setState(() {
                    _obscureCurrentPassword = !_obscureCurrentPassword;
                  }),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your current password';
                    }
                    // Add additional validation if needed
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildPasswordField(
                  context,
                  controller: _newPasswordController,
                  label: 'New Password',
                  obscureText: _obscureNewPassword,
                  onToggleVisibility: () => setState(() {
                    _obscureNewPassword = !_obscureNewPassword;
                  }),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a new password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildPasswordField(
                  context,
                  controller: _confirmPasswordController,
                  label: 'Confirm New Password',
                  obscureText: _obscureConfirmPassword,
                  onToggleVisibility: () => setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  }),
                  validator: (value) {
                    if (value != _newPasswordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField(
    BuildContext context, {
    required TextEditingController controller,
    required String label,
    required bool obscureText,
    required VoidCallback onToggleVisibility,
    required String? Function(String?) validator,
  }) {
    final _isDarkMode = SessionManager.instance.isDarkMode;

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTextStyle.subtext1(
          _isDarkMode ? AppColors.grey8 : AppColors.blackSubtext,
        ),
        filled: true,
        fillColor: _isDarkMode
            ? Colors.grey.shade800.withOpacity(0.6)
            : Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: onToggleVisibility,
        ),
      ),
      style: AppTextStyle.subtext4(
        _isDarkMode ? AppColors.white : AppColors.blackText,
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Here you would typically call your API to change the password
      // For example:
      // AuthService.changePassword(
      //   currentPassword: _currentPasswordController.text,
      //   newPassword: _newPasswordController.text,
      // );

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password changed successfully')),
      );

      // Navigate back
      Navigator.pop(context);
    }
  }
}
