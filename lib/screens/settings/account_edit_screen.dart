// account_edit_screen.dart
import 'package:changisha/constants/app_colors.dart';
import 'package:changisha/constants/app_text_style.dart';
import 'package:changisha/services/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class AccountEditScreen extends StatefulWidget {
  final Map<String, String> initialData;

  const AccountEditScreen({Key? key, required this.initialData})
    : super(key: key);

  @override
  State<AccountEditScreen> createState() => _AccountEditScreenState();
}

class _AccountEditScreenState extends State<AccountEditScreen> {
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _usernameController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.initialData['email']);
    _phoneController = TextEditingController(text: widget.initialData['phone']);
    _usernameController = TextEditingController(
      text: widget.initialData['username'],
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _isDarkMode = SessionManager.instance.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Account'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedArrowLeft02,
            color: AppColors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _saveChanges,
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedChef,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildEditableField(
                context,
                icon: Icons.email,
                label: 'Email Address',
                controller: _emailController,
              ),
              const SizedBox(height: 16),
              _buildEditableField(
                context,
                icon: Icons.phone,
                label: 'Phone Number',
                controller: _phoneController,
              ),
              const SizedBox(height: 16),
              _buildEditableField(
                context,
                icon: Icons.person_outline,
                label: 'Username',
                controller: _usernameController,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField(
    BuildContext context, {
    required IconData icon,
    required String label,
    required TextEditingController controller,
  }) {
    final _isDarkMode = SessionManager.instance.isDarkMode;

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Theme.of(context).primaryColor),
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
      ),
      style: AppTextStyle.subtext4(
        _isDarkMode ? AppColors.white : AppColors.blackText,
      ),
    );
  }

  void _saveChanges() {
    // Here you would typically save the changes to your backend/database
    final updatedData = {
      'email': _emailController.text,
      'phone': _phoneController.text,
      'username': _usernameController.text,
    };

    // Return the updated data to the previous screen
    Navigator.pop(context, updatedData);
  }
}
