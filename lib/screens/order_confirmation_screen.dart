import 'package:flutter/material.dart';
import 'dart:io';
import '../utils/constants.dart';

class OrderConfirmationScreen extends StatelessWidget {
  final String sellerName;
  final String phone;
  final String category;
  final String price;
  final String quantity;
  final String description;
  final List<File?> images;

  const OrderConfirmationScreen({
    super.key,
    required this.sellerName,
    required this.phone,
    required this.category,
    required this.price,
    required this.quantity,
    required this.description,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  AppStrings.welcome,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(AppSizes.paddingLarge),
                  child: Column(
                    children: [
                      // صورة البروفايل
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary.withOpacity(0.3),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // معلومات البائع
                      _buildInfoRow(
                        AppStrings.sellerName,
                        'مرعي فرج الزينوبي',
                      ),
                      const SizedBox(height: 16),
                      
                      _buildInfoRow(
                        AppStrings.personalAccount,
                        AppStrings.link,
                      ),
                      const SizedBox(height: 16),
                      
                      // أرقام التواصل
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            AppStrings.contactNumbers,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '77........',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              Text(
                                '77........',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              Text(
                                '77........',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      
                      // صور السمك
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            AppStrings.fishImages,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: AppColors.border,
                                width: 1,
                              ),
                            ),
                            child: GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              children: List.generate(4, (index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: AppColors.border,
                                      width: 2,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  child: images.length > index
                                      ? const Center(
                                          child: Icon(
                                            Icons.image,
                                            color: AppColors.primary,
                                            size: 40,
                                          ),
                                        )
                                      : Container(),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      
                      // تفاصيل الطلب
                      _buildInfoRow(
                        AppStrings.fishType,
                        category.isEmpty ? 'التونة' : category,
                      ),
                      const SizedBox(height: 16),
                      
                      _buildInfoRow(
                        AppStrings.pricePerKilo,
                        '${price.isEmpty ? "8000" : price} ${AppStrings.riyal}',
                      ),
                      const SizedBox(height: 16),
                      
                      _buildInfoRow(
                        AppStrings.availableQuantity,
                        '${quantity.isEmpty ? "3" : quantity} ${AppStrings.kilo}',
                      ),
                      const SizedBox(height: 16),
                      
                      _buildInfoRow(
                        AppStrings.description,
                        description.isEmpty ? 'طازج' : description,
                      ),
                      const SizedBox(height: 32),
                      
                      // أزرار التأكيد والإلغاء
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 56,
                              child: ElevatedButton(
                                onPressed: () {
                                  // TODO: confirm order
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('تم تأكيد الطلب بنجاح'),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                                  ),
                                ),
                                child: const Text(
                                  AppStrings.confirmOrder,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: SizedBox(
                              height: 56,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                                  ),
                                ),
                                child: const Text(
                                  AppStrings.cancel,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
