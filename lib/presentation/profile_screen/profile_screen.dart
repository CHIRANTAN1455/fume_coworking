import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/app_export.dart';
import './widgets/booking_preview_widget.dart';
import './widgets/menu_item_widget.dart';
import './widgets/profile_header_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isRefreshing = false;

  final Map<String, dynamic> _userData = {
    "name": "Arjun Sharma",
    "email": "arjun.sharma@example.com",
    "phone": "+91 98765 43210",
    "membershipStatus": "Premium",
    "memberId": "FUME-2024-00142",
    "avatar":
        "https://img.rocket.new/generatedImages/rocket_gen_img_1053bff46-1763295649015.png",
    "avatarSemanticLabel":
        "Professional headshot of Indian man with short black hair wearing a navy blue shirt",
    "upcomingBookings": 2,
    "joinDate": "January 2024",
  };

  final Map<String, dynamic> _nextBooking = {
    "workspace": "Private Cabin",
    "location": "Delhi - Netaji Subhash Palace",
    "date": "14 Mar 2026",
    "time": "10:00 AM - 6:00 PM",
    "status": "Upcoming",
  };

  Future<void> _onRefresh() async {
    setState(() => _isRefreshing = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isRefreshing = false);
  }

  void _showAvatarOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.cardDark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => _AvatarOptionsSheet(),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.cardDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(
          'Logout',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(color: AppTheme.textPrimary),
        ),
        content: Text(
          'Are you sure you want to logout?',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppTheme.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logged out successfully')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.errorColor,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          color: AppTheme.secondaryColor,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Title
                Text(
                  'My Profile',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 2.h),

                // Profile Header
                ProfileHeaderWidget(
                  userData: _userData,
                  onAvatarTap: _showAvatarOptions,
                ),
                SizedBox(height: 2.h),

                // Upcoming Booking Preview
                BookingPreviewWidget(
                  nextBooking: _nextBooking,
                  upcomingCount: _userData['upcomingBookings'] as int? ?? 0,
                  onViewAll: () {
                    Navigator.of(
                      context,
                      rootNavigator: true,
                    ).pushNamed('/home-screen');
                  },
                ),
                SizedBox(height: 2.h),

                // Menu Items
                Text(
                  'Account',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: AppTheme.textSecondary,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 1.h),

                MenuItemWidget(
                  iconName: 'calendar_today',
                  label: 'My Bookings',
                  badgeCount: _userData['upcomingBookings'] as int? ?? 0,
                  onTap: () {
                    Navigator.of(
                      context,
                      rootNavigator: true,
                    ).pushNamed('/workspaces-screen');
                  },
                ),
                MenuItemWidget(
                  iconName: 'payment',
                  label: 'Payment History',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Payment History coming soon'),
                      ),
                    );
                  },
                ),
                SizedBox(height: 2.h),

                Text(
                  'Help & Settings',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: AppTheme.textSecondary,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 1.h),

                MenuItemWidget(
                  iconName: 'support_agent',
                  label: 'Support',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Support page coming soon')),
                    );
                  },
                ),
                MenuItemWidget(
                  iconName: 'settings',
                  label: 'Settings',
                  onTap: () {
                    _showSettingsSheet(context);
                  },
                ),
                SizedBox(height: 2.h),

                MenuItemWidget(
                  iconName: 'logout',
                  label: 'Logout',
                  isDestructive: true,
                  onTap: _showLogoutDialog,
                ),
                SizedBox(height: 2.h),

                // App version
                Center(
                  child: Text(
                    'Fume Coworking v1.0.0',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: AppTheme.textMuted,
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSettingsSheet(BuildContext context) {
    bool biometricEnabled = false;
    bool notificationsEnabled = true;

    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.cardDark,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setModalState) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 10.w,
                  height: 0.5.h,
                  decoration: BoxDecoration(
                    color: AppTheme.borderColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                'Settings',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: AppTheme.textPrimary),
              ),
              SizedBox(height: 2.h),
              _SettingsTile(
                title: 'Push Notifications',
                subtitle: 'Booking alerts and updates',
                value: notificationsEnabled,
                onChanged: (v) =>
                    setModalState(() => notificationsEnabled = v),
              ),
              _SettingsTile(
                title: 'Biometric Authentication',
                subtitle: 'Use fingerprint or Face ID',
                value: biometricEnabled,
                onChanged: (v) => setModalState(() => biometricEnabled = v),
              ),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _AvatarOptionsSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 10.w,
              height: 0.5.h,
              decoration: BoxDecoration(
                color: AppTheme.borderColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            'Update Profile Photo',
            style: theme.textTheme.titleMedium?.copyWith(
              color: AppTheme.textPrimary,
            ),
          ),
          SizedBox(height: 2.h),
          _OptionTile(
            iconName: 'camera_alt',
            label: 'Take Photo',
            onTap: () => Navigator.pop(context),
          ),
          _OptionTile(
            iconName: 'photo_library',
            label: 'Choose from Library',
            onTap: () => Navigator.pop(context),
          ),
          _OptionTile(
            iconName: 'delete_outline',
            label: 'Remove Photo',
            isDestructive: true,
            onTap: () => Navigator.pop(context),
          ),
          SizedBox(height: 1.h),
        ],
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  final String iconName;
  final String label;
  final bool isDestructive;
  final VoidCallback onTap;

  const _OptionTile({
    required this.iconName,
    required this.label,
    this.isDestructive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isDestructive ? AppTheme.errorColor : AppTheme.textPrimary;
    return ListTile(
      leading: CustomIconWidget(iconName: iconName, color: color, size: 22),
      title: Text(
        label,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: color),
      ),
      onTap: onTap,
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SettingsTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: AppTheme.textPrimary,
                  ),
                ),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Switch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}
