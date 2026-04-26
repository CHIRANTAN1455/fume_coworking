import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final Map<String, dynamic> userData;
  final VoidCallback onAvatarTap;

  const ProfileHeaderWidget({
    super.key,
    required this.userData,
    required this.onAvatarTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final String membershipStatus =
        userData['membershipStatus'] as String? ?? 'Basic';
    final bool isPremium = membershipStatus == 'Premium';

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 4.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.surfaceDark,
            AppTheme.secondaryColor.withValues(alpha: 0.15),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Column(
        children: [
          // Avatar
          GestureDetector(
            onLongPress: onAvatarTap,
            onTap: onAvatarTap,
            child: Stack(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isPremium
                          ? AppTheme.accentColor
                          : AppTheme.secondaryColor,
                      width: 2.5,
                    ),
                  ),
                  child: ClipOval(
                    child: CustomImageWidget(
                      imageUrl: userData['avatar'] as String? ?? '',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      semanticLabel:
                          userData['avatarSemanticLabel'] as String? ??
                          'User profile photo',
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      color: AppTheme.secondaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppTheme.surfaceDark, width: 2),
                    ),
                    child: CustomIconWidget(
                      iconName: 'camera_alt',
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 1.5.h),

          // Name
          Text(
            userData['name'] as String? ?? 'User',
            style: theme.textTheme.titleLarge?.copyWith(
              color: AppTheme.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 0.5.h),

          // Email
          Text(
            userData['email'] as String? ?? '',
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppTheme.textSecondary,
            ),
          ),
          SizedBox(height: 1.5.h),

          // Membership badge + Member ID row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
                decoration: BoxDecoration(
                  color: isPremium
                      ? AppTheme.accentColor.withValues(alpha: 0.15)
                      : AppTheme.secondaryColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isPremium
                        ? AppTheme.accentColor
                        : AppTheme.secondaryColor,
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomIconWidget(
                      iconName: isPremium ? 'star' : 'person',
                      color: isPremium
                          ? AppTheme.accentColor
                          : AppTheme.secondaryColor,
                      size: 14,
                    ),
                    SizedBox(width: 1.w),
                    Text(
                      membershipStatus,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: isPremium
                            ? AppTheme.accentColor
                            : AppTheme.secondaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 3.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
                decoration: BoxDecoration(
                  color: AppTheme.cardDark,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppTheme.borderColor),
                ),
                child: Text(
                  userData['memberId'] as String? ?? '',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: AppTheme.textSecondary,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),

          Text(
            'Member since ${userData['joinDate'] as String? ?? ''}',
            style: theme.textTheme.labelSmall?.copyWith(
              color: AppTheme.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
