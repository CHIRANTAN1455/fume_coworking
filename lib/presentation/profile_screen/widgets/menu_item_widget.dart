import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

class MenuItemWidget extends StatelessWidget {
  final String iconName;
  final String label;
  final int badgeCount;
  final bool isDestructive;
  final VoidCallback onTap;

  const MenuItemWidget({
    super.key,
    required this.iconName,
    required this.label,
    this.badgeCount = 0,
    this.isDestructive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color iconColor = isDestructive
        ? AppTheme.errorColor
        : AppTheme.secondaryColor;
    final Color textColor = isDestructive
        ? AppTheme.errorColor
        : AppTheme.textPrimary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.8.h),
        decoration: BoxDecoration(
          color: AppTheme.cardDark,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDestructive
                ? AppTheme.errorColor.withValues(alpha: 0.3)
                : AppTheme.borderColor,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: CustomIconWidget(
                  iconName: iconName,
                  color: iconColor,
                  size: 20,
                ),
              ),
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: Text(
                label,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            badgeCount > 0
                ? Container(
                    margin: EdgeInsets.only(right: 2.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                      vertical: 0.3.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '$badgeCount',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            CustomIconWidget(
              iconName: 'chevron_right',
              color: isDestructive
                  ? AppTheme.errorColor.withValues(alpha: 0.6)
                  : AppTheme.textMuted,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
