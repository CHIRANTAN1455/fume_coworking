import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_widget.dart';

class CtaBannerWidget extends StatelessWidget {
  const CtaBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1e40af), Color(0xFF0c1a4e)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ready to Experience Fume?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.3,
            ),
          ),
          SizedBox(height: 0.8.h),
          Text(
            'Join 500+ professionals working smarter across Delhi NCR.',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.75),
              fontSize: 10.sp,
            ),
          ),
          SizedBox(height: 2.h),
          GestureDetector(
            onTap: () {
              Navigator.of(
                context,
                rootNavigator: true,
              ).pushNamed('/workspaces-screen');
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.4.h),
              decoration: BoxDecoration(
                color: const Color(0xFFfbbf24),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Explore Workspaces',
                    style: TextStyle(
                      color: const Color(0xFF0a0a0a),
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 2.w),
                  CustomIconWidget(
                    iconName: 'arrow_forward',
                    color: const Color(0xFF0a0a0a),
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
