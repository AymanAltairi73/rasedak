import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/validators.dart';
import '../widgets/custom_button.dart';
import '../widgets/form_input.dart';
import '../services/auth_service.dart';
import 'signup_screen.dart';
import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();
  bool _isLoading = false;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadSavedLoginData();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _loadSavedLoginData() async {
    final savedData = await _authService.getSavedLoginData();
    if (savedData['rememberMe'] == true) {
      setState(() {
        _emailController.text = savedData['savedEmail'] ?? '';
        _passwordController.text = savedData['savedPassword'] ?? '';
        _rememberMe = true;
      });
    }
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // محاكاة استدعاء API
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() {
          _isLoading = false;
        });

        // حفظ بيانات تسجيل الدخول
        await _authService.saveLoginState(
          _emailController.text,
          _passwordController.text,
          _rememberMe,
        );

        // الانتقال لشاشة الرئيسية بعد تسجيل الدخول بنجاح
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ),
        );
      }
    }
  }

  void _navigateToSignup() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignupScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.paddingLarge),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  
                  // الشعار
                  Image.asset(
                    AppImages.logo,
                    width: MediaQuery.of(context).size.width * 0.5,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 60),
                  
                  // حقل البريد الإلكتروني
                  FormInput(
                    label: AppStrings.email,
                    hint: 'Saeed@gmail.com',
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
                  const SizedBox(height: 16),
                  
                  // تذكرني ونسيت كلمة المرور
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          // TODO: نسيت كلمة المرور
                        },
                        child: const Text(
                          AppStrings.forgotPassword,
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            AppStrings.remember,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Checkbox(
                            value: _rememberMe,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value ?? false;
                              });
                            },
                            activeColor: AppColors.primary,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // زر تسجيل الدخول
                  CustomButton(
                    text: AppStrings.login,
                    onPressed: _handleLogin,
                    isLoading: _isLoading,
                  ),
                  const SizedBox(height: 24),
                  
                  // زر إنشاء حساب
                  CustomButton(
                    text: AppStrings.signup,
                    onPressed: _navigateToSignup,
                    isOutlined: true,
                  ),
                  const SizedBox(height: 32),
                  
                  // أو من خلال
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: AppColors.border,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          AppStrings.orLoginWith,
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: AppColors.border,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // أزرار تسجيل الدخول بوسائل التواصل
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialButton(
                        'assets/images/google.png',
                        () {
                          // TODO: Google login
                        },
                      ),
                      const SizedBox(width: 16),
                      _buildSocialButton(
                        'assets/images/apple.png',
                        () {
                          // TODO: Apple login
                        },
                      ),
                      const SizedBox(width: 16),
                      _buildSocialButton(
                        'assets/images/facebook.png',
                        () {
                          // TODO: Facebook login
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String iconPath, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.border,
            width: 1,
          ),
        ),
        child: Center(
          child: Icon(
            iconPath.contains('google')
                ? Icons.g_mobiledata
                : iconPath.contains('apple')
                    ? Icons.apple
                    : Icons.facebook,
            size: 32,
            color: iconPath.contains('google')
                ? Colors.red
                : iconPath.contains('apple')
                    ? Colors.black
                    : Colors.blue,
          ),
        ),
      ),
    );
  }
}
