import 'package:flutter/material.dart';

// ألوان التطبيق
class AppColors {
  static const Color primary = Color(0xFF7B7BA8);
  static const Color secondary = Color(0xFFE89B8A);
  static const Color background = Colors.white;
  static const Color textPrimary = Color(0xFF2C3E50);
  static const Color textSecondary = Color(0xFF95A5A6);
  static const Color border = Color(0xFFE0E0E0);
}

// مسارات الصور
class AppImages {
  static const String splashLogo = 'assets/images/splash-logo.png';
  static const String splash = 'assets/images/splash.png';
  static const String onboarding1 = 'assets/images/Onboarding1.png';
  static const String onboarding2 = 'assets/images/Onboarding2.png';
  static const String onboarding3 = 'assets/images/Onboarding3.png';
  static const String logo = 'assets/images/logo.png';
  static const String signupSuccessLogo = 'assets/images/SignUpSucessfulLogo.png';
  static const String fishCard = 'assets/images/fishCard.png';
}

// نصوص التطبيق
class AppStrings {
  // Onboarding
  static const String onboarding1Title = 'لنكتشف أنواع جديدة\nمن الأسماك';
  static const String onboarding1Desc = 'أنواع كثيرة من الأسماك الطازجة يومياً بأذواق مختلفة';
  
  static const String onboarding2Title = 'لنكتشف أنواع جديدة\nمن الأسماك';
  static const String onboarding2Desc = 'أنواع كثيرة من الأسماك الطازجة يومياً بأذواق مختلفة';
  
  static const String onboarding3Title = 'لنكتشف أنواع جديدة\nمن الأسماك';
  static const String onboarding3Desc = 'أنواع كثيرة من الأسماك الطازجة يومياً بأذواق مختلفة';
  
  static const String skip = 'تخطي';
  static const String next = 'التالي';
  static const String start = 'ابدأ الآن';
  
  // Auth
  static const String login = 'تسجيل الدخول';
  static const String signup = 'إنشاء حساب';
  static const String email = 'البريد الإلكتروني';
  static const String password = 'كلمة المرور';
  static const String confirmPassword = 'تأكيد كلمة المرور';
  static const String fullName = 'الاسم الكامل';
  static const String forgotPassword = 'نسيت كلمة المرور';
  static const String dontHaveAccount = 'ليس لديك حساب؟';
  static const String alreadyHaveAccount = 'لديك حساب بالفعل؟';
  static const String createNewAccount = 'إنشاء حساب جديد';
  static const String orLoginWith = 'أو من خلال';
  static const String remember = 'تذكرني';
  
  // Validation
  static const String fieldRequired = 'هذا الحقل مطلوب';
  static const String invalidEmail = 'البريد الإلكتروني غير صحيح';
  static const String passwordTooShort = 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
  static const String passwordsNotMatch = 'كلمات المرور غير متطابقة';
  
  // Email Verify
  static const String emailVerifyTitle = 'التحقق من الحساب';
  static const String emailVerifyDesc = 'ادخل الرمز التعريفي المرسل إلى البريد الإلكتروني';
  static const String verify = 'إرسال';
  static const String resendCode = 'أعد إرسال الرمز التعريفي';
  static const String invalidCode = 'الرمز غير صحيح';
  static const String codeLength = 'يجب إدخال 5 أرقام';
  
  // Signup Success
  static const String signupSuccessTitle = 'تم إنشاء الحساب بنجاح';
  static const String signupSuccessDesc = 'يمكنك تصفح التطبيق والاطلاع على آخر العروض والخصومات';
  static const String goToApp = 'ابدأ الآن';
  
  // Home
  static const String welcome = 'مرحبا بك !';
  static const String orderNow = 'اطلب الآن';
  
  // New Order
  static const String newOrder = 'عرض منتج جديد';
  static const String newOrderDesc = 'ادخل البيانات المطلوبة بالأسفل';
  static const String fullNameLabel = 'الأسم الكامل';
  static const String fullNameHint = 'ادخل اسمك الكامل';
  static const String phoneLabel = 'أرقام التواصل';
  static const String phoneHint = 'ادخل أرقام التواصل';
  static const String categoryLabel = 'الصنف';
  static const String categoryHint = 'نباض';
  static const String priceLabel = 'سعر الكيلو';
  static const String priceHint = 'ادخل السعر';
  static const String quantityLabel = 'الكمية المتوفرة';
  static const String quantityHint = 'ادخل الكمية';
  static const String descriptionLabel = 'الوصف';
  static const String descriptionHint = 'طازج';
  static const String addFishImages = 'أضافة صور السمك';
  static const String confirm = 'تأكيد';
  
  // Order Confirmation
  static const String sellerName = 'أسم البائع:';
  static const String personalAccount = 'الحساب الشخصي:';
  static const String contactNumbers = 'أرقام التواصل:';
  static const String fishImages = 'صور السمك';
  static const String fishType = 'نوع السمك:';
  static const String pricePerKilo = 'سعر الكيلو:';
  static const String availableQuantity = 'الكمية المتوفرة:';
  static const String description = 'الوصف:';
  static const String cancel = 'الغاء';
  static const String confirmOrder = 'تأكيد';
  static const String riyal = 'ريال';
  static const String kilo = 'كيلو';
  static const String link = 'رابط';
  
  // Profile
  static const String myProfile = 'الملف الشخصي';
  static const String myOrders = 'طلباتي';
  static const String myOrdersDesc = 'لديك : طلبات جاري تنفيذها';
  static const String contactInfo = 'أرقام التواصل';
  static const String contactInfoDesc = 'يمكنك تعديل أرقام التواصل الخاصة بك';
  static const String settings = 'الإعدادات';
  static const String settingsDesc = 'يمكنك تعديل بياناتك الشخصية';
}

// أحجام ومسافات
class AppSizes {
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;
  
  static const double borderRadius = 12.0;
  static const double buttonHeight = 56.0;
  static const double inputHeight = 56.0;
}
