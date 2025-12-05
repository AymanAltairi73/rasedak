import 'dart:io';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class OrderService {
  static const String _ordersKey = 'user_orders';

  // حفظ طلب جديد
  Future<void> saveOrder({
    required String sellerName,
    required String phone,
    required String category,
    required String price,
    required String quantity,
    required String description,
    required List<File?> images,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    
    // الحصول على الطلبات الموجودة
    final ordersJson = prefs.getStringList(_ordersKey) ?? [];
    
    // إنشاء طلب جديد
    final newOrder = {
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'sellerName': sellerName,
      'phone': phone,
      'category': category,
      'price': price,
      'quantity': quantity,
      'description': description,
      'imageCount': images.where((img) => img != null).length,
      'timestamp': DateTime.now().toIso8601String(),
    };
    
    // إضافة الطلب الجديد
    ordersJson.add(jsonEncode(newOrder));
    
    // حفظ الطلبات
    await prefs.setStringList(_ordersKey, ordersJson);
  }

  // الحصول على جميع الطلبات
  Future<List<Map<String, dynamic>>> getOrders() async {
    final prefs = await SharedPreferences.getInstance();
    final ordersJson = prefs.getStringList(_ordersKey) ?? [];
    
    return ordersJson
        .map((json) => jsonDecode(json) as Map<String, dynamic>)
        .toList()
        .reversed
        .toList(); // عكس الترتيب لعرض الأحدث أولاً
  }

  // حذف طلب
  Future<void> deleteOrder(String orderId) async {
    final prefs = await SharedPreferences.getInstance();
    final ordersJson = prefs.getStringList(_ordersKey) ?? [];
    
    ordersJson.removeWhere((json) {
      final order = jsonDecode(json) as Map<String, dynamic>;
      return order['id'] == orderId;
    });
    
    await prefs.setStringList(_ordersKey, ordersJson);
  }

  // مسح جميع الطلبات
  Future<void> clearAllOrders() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_ordersKey);
  }
}
