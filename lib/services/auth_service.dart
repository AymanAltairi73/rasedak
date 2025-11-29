// خدمة المصادقة - مثال محاكي
// يمكن استبدالها لاحقاً بـ API حقيقي

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
}
