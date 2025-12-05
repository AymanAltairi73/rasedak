// خدمة المصادقة - مثال محاكي
// يمكن استبدالها لاحقاً بـ API حقيقي

import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // محاكاة تسجيل الدخول
  Future<Map<String, dynamic>> login(String email, String password) async {
    // محاكاة تأخير الشبكة
    await Future.delayed(const Duration(seconds: 2));
    
    // محاكاة استجابة ناجحة
    return {
      'success': true,
      'message': 'تم تسجيل الدخول بنجاح',
      'user': {
        'id': '1',
        'name': 'مستخدم تجريبي',
        'email': email,
      },
    };
  }

  // محاكاة إنشاء حساب
  Future<Map<String, dynamic>> signup(
    String name,
    String email,
    String password,
  ) async {
    // محاكاة تأخير الشبكة
    await Future.delayed(const Duration(seconds: 2));
    
    // محاكاة استجابة ناجحة
    return {
      'success': true,
      'message': 'تم إنشاء الحساب بنجاح',
      'user': {
        'id': '1',
        'name': name,
        'email': email,
      },
    };
  }

  // محاكاة تسجيل الخروج
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  // محاكاة التحقق من حالة تسجيل الدخول
  Future<bool> isLoggedIn() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return false;
  }

  // محاكاة التحقق من رمز البريد الإلكتروني
  Future<Map<String, dynamic>> verifyEmail(String code) async {
    // TODO: implement API call
    await Future.delayed(const Duration(seconds: 2));
    
    // محاكاة: الرمز الصحيح هو "00746"
    if (code == "00746") {
      return {
        'success': true,
        'message': 'تم التحقق بنجاح',
      };
    } else {
      return {
        'success': false,
        'message': 'الرمز غير صحيح',
      };
    }
  }

  // محاكاة إعادة إرسال رمز التحقق
  Future<Map<String, dynamic>> resendVerificationCode(String email) async {
    // TODO: implement API call
    await Future.delayed(const Duration(seconds: 1));
    
    return {
      'success': true,
      'message': 'تم إرسال الرمز بنجاح',
    };
  }

  // حفظ بيانات تسجيل الدخول
  Future<void> saveLoginState(String email, String password, bool rememberMe) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('userEmail', email);
    if (rememberMe) {
      await prefs.setString('savedEmail', email);
      await prefs.setString('savedPassword', password);
      await prefs.setBool('rememberMe', true);
    } else {
      await prefs.remove('savedEmail');
      await prefs.remove('savedPassword');
      await prefs.setBool('rememberMe', false);
    }
  }

  // استرجاع بيانات تسجيل الدخول المحفوظة
  Future<Map<String, dynamic>> getSavedLoginData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'rememberMe': prefs.getBool('rememberMe') ?? false,
      'savedEmail': prefs.getString('savedEmail') ?? '',
      'savedPassword': prefs.getString('savedPassword') ?? '',
    };
  }

  // التحقق من حالة تسجيل الدخول المحفوظة
  Future<bool> checkSavedLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  // تسجيل الخروج وحذف البيانات
  Future<void> logoutAndClear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    await prefs.remove('userEmail');
    // لا نحذف البيانات المحفوظة إذا كان rememberMe مفعل
  }
}
