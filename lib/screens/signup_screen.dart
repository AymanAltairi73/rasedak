import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/validators.dart';
import '../widgets/custom_button.dart';
import '../widgets/form_input.dart';
import 'email_verify_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignup() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // TODO: implement API call
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() {
          _isLoading = false;
        });

        // الانتقال لشاشة التحقق من البريد
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EmailVerifyScreen(
              email: _emailController.text,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.paddingLarge),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // العنوان
                  const Text(
                    'إنشاء حساب جديد',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // الوصف
                  Text(
                    'ادخل البيانات المطلوبة بالأسفل',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 40),
                  
                  // حقل الاسم الكامل
                  FormInput(
                    label: AppStrings.fullName,
                    hint: 'ادخل اسمك الكامل',
                    controller: _nameController,
                    validator: Validators.validateRequired,
                  ),
                  const SizedBox(height: 20),
                  
                  // حقل البريد الإلكتروني
                  FormInput(
                    label: AppStrings.email,
                    hint: 'ادخل بريدك الإلكتروني',
                    controller: _emailController,
                    validator: Validators.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  
                  // حقل كلمة المرور
                  FormInput(
                    label: AppStrings.password,
                    hint: '••••••••••••',
                    controller: _passwordController,
                    validator: Validators.validatePassword,
                    isPassword: true,
                  ),
                  const SizedBox(height: 20),
                  
                  // حقل تأكيد كلمة المرور
                  FormInput(
                    label: AppStrings.confirmPassword,
                    hint: '••••••••••••',
                    controller: _confirmPasswordController,
                    validator: (value) => Validators.validateConfirmPassword(
                      value,
                      _passwordController.text,
                    ),
                    isPassword: true,
                  ),
                  const SizedBox(height: 40),
                  
                  // زر إنشاء الحساب
                  CustomButton(
                    text: AppStrings.signup,
                    onPressed: _handleSignup,
                    isLoading: _isLoading,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
