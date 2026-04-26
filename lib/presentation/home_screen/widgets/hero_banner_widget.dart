import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_widget.dart';

class HeroBannerWidget extends StatefulWidget {
  const HeroBannerWidget({super.key});

  @override
  State<HeroBannerWidget> createState() => _HeroBannerWidgetState();
}

class _HeroBannerWidgetState extends State<HeroBannerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  int _currentTextIndex = 0;

  final List<String> _texts = [
    'Away From Home',
    'Near You',
    'For Your Team',
    'For Your Startup',
    'Every Workday',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
    _startCycling();
  }

  void _startCycling() {
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      _controller.reverse().then((_) {
        if (!mounted) return;
        setState(() {
          _currentTextIndex = (_currentTextIndex + 1) % _texts.length;
        });
        _controller.forward().then((_) => _startCycling());
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 26.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Color(0xFF000000), Color(0xFF0c1a4e)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // Background image with overlay
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CustomImageWidget(
              imageUrl:
                  'https://images.pexels.com/photos/1181406/pexels-photo-1181406.jpeg?auto=compress&cs=tinysrgb&w=800',
              width: double.infinity,
              height: 26.h,
              fit: BoxFit.cover,
              semanticLabel:
                  'Modern coworking space with open desks, laptops, and professionals working in a bright office environment',
            ),
          ),
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withValues(alpha: 0.75),
                  const Color(0xFF0c1a4e).withValues(alpha: 0.65),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Content
          Padding(
            padding: EdgeInsets.all(4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your Workspace',
                  style: TextStyle(
                    color: const Color(0xFFa1a1aa),
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 0.5.h),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    _texts[_currentTextIndex],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 1.5.h),
                Row(
                  children: [
                    _buildBannerButton(
                      'Book a Tour',
                      const Color(0xFF1e40af),
                      Colors.white,
                      () {},
                    ),
                    SizedBox(width: 3.w),
                    _buildBannerButton(
                      'View Workspaces',
                      Colors.transparent,
                      Colors.white,
                      () {
                        Navigator.of(
                          context,
                          rootNavigator: true,
                        ).pushNamed('/workspaces-screen');
                      },
                      hasBorder: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerButton(
    String label,
    Color bgColor,
    Color textColor,
    VoidCallback onTap, {
    bool hasBorder = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.2.h),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
          border: hasBorder ? Border.all(color: Colors.white54) : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
