import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_widget.dart';

class WorkspaceCardWidget extends StatelessWidget {
  final Map<String, dynamic> workspace;
  final VoidCallback onBook;
  final VoidCallback onLongPress;

  const WorkspaceCardWidget({
    super.key,
    required this.workspace,
    required this.onBook,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isPopular = workspace["popular"] as bool;
    final List<dynamic> features = workspace["features"] as List<dynamic>;

    return GestureDetector(
      onLongPress: onLongPress,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF27272a),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isPopular
                ? const Color(0xFFfbbf24).withValues(alpha: 0.4)
                : const Color(0xFF3f3f46),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Emoji icon
                  Container(
                    width: 12.w,
                    height: 12.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1e40af).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF1e40af).withValues(alpha: 0.3),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      workspace["emoji"] as String,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                  SizedBox(width: 3.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                workspace["name"] as String,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (isPopular) ...[
                              SizedBox(width: 2.w),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 2.w,
                                  vertical: 0.4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(
                                    0xFFfbbf24,
                                  ).withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: const Color(
                                      0xFFfbbf24,
                                    ).withValues(alpha: 0.5),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomIconWidget(
                                      iconName: 'star',
                                      color: const Color(0xFFfbbf24),
                                      size: 10,
                                    ),
                                    SizedBox(width: 1.w),
                                    Text(
                                      'Popular',
                                      style: TextStyle(
                                        fontSize: 9.sp,
                                        color: const Color(0xFFfbbf24),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                        SizedBox(height: 0.5.h),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: workspace["price"] as String,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: const Color(0xFF93c5fd),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: workspace["unit"] as String,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: const Color(0xFFa1a1aa),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.5.h),
              // Description
              Text(
                workspace["description"] as String,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: const Color(0xFFa1a1aa),
                  height: 1.5,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 1.5.h),
              // Features
              Wrap(
                spacing: 2.w,
                runSpacing: 0.8.h,
                children: features.map((f) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.5.w,
                      vertical: 0.5.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF18181b),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: const Color(0xFF3f3f46)),
                    ),
                    child: Text(
                      f as String,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: const Color(0xFFa1a1aa),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 2.h),
              // Book button
              SizedBox(
                width: double.infinity,
                height: 5.5.h,
                child: ElevatedButton(
                  onPressed: onBook,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1e40af),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Book Now',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      CustomIconWidget(
                        iconName: 'arrow_forward_rounded',
                        color: Colors.white,
                        size: 16,
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
}
