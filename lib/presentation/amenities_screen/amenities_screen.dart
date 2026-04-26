import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AmenitiesScreen extends StatelessWidget {
  const AmenitiesScreen({super.key});

  static const List<Map<String, dynamic>> _amenities = [
    {
      'icon': Icons.wifi,
      'emoji': '📶',
      'title': 'High-speed WiFi',
      'description':
          'Fiber-backed internet across all work areas and meeting rooms.',
      'iconColor': Color(0xFF1e40af),
      'bgColor': Color(0xFFdbeafe),
    },
    {
      'icon': Icons.coffee,
      'emoji': '☕',
      'title': 'Coffee & Beverages',
      'description': 'Complimentary coffee, tea, and water available all day.',
      'iconColor': Color(0xFF92400e),
      'bgColor': Color(0xFFfef3c7),
    },
    {
      'icon': Icons.chair_alt,
      'emoji': '🪑',
      'title': 'Flexible Workspaces',
      'description':
          'Hot desks, dedicated desks, cabins, and meeting rooms on demand.',
      'iconColor': Color(0xFF7c3aed),
      'bgColor': Color(0xFFede9fe),
    },
    {
      'icon': Icons.receipt_long,
      'emoji': '💳',
      'title': 'Transparent Pricing',
      'description': 'Simple plans with no hidden fees or lock-ins.',
      'iconColor': Color(0xFF065f46),
      'bgColor': Color(0xFFd1fae5),
    },
    {
      'icon': Icons.lock,
      'emoji': '🔒',
      'title': 'Secure Access',
      'description': '24/7 access with CCTV monitoring and secure entry.',
      'iconColor': Color(0xFF92400e),
      'bgColor': Color(0xFFfef3c7),
    },
    {
      'icon': Icons.support_agent,
      'emoji': '🙋',
      'title': 'On-site Support',
      'description':
          'Reception and community team to help you and your guests.',
      'iconColor': Color(0xFFdc2626),
      'bgColor': Color(0xFFfee2e2),
    },
    {
      'icon': Icons.print,
      'emoji': '🖨️',
      'title': 'Amenities & Pantry',
      'description': 'Printer, lockers, pantry, and other essentials included.',
      'iconColor': Color(0xFF0891b2),
      'bgColor': Color(0xFFcffafe),
    },
    {
      'icon': Icons.groups,
      'emoji': '🤝',
      'title': 'Built for Teams',
      'description':
          'Scalable spaces designed for founders, freelancers, and teams.',
      'iconColor': Color(0xFFd97706),
      'bgColor': Color(0xFFfef3c7),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F5),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildHeroBanner()),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _AmenityCard(amenity: _amenities[index]),
                childCount: _amenities.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 3.w,
                mainAxisSpacing: 2.h,
                childAspectRatio: 1.1,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 2.h)),
        ],
      ),
    );
  }

  Widget _buildHeroBanner() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0a0f2e), Color(0xFF0d1b4b), Color(0xFF0f2460)],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          child: Column(
            children: [
              Text(
                'Amenities',
                style: GoogleFonts.inter(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: -0.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 1.h),
              Text(
                'Everything you need for a productive\nand comfortable workday',
                style: GoogleFonts.inter(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFa5b4fc),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 3.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _AmenityCard extends StatelessWidget {
  final Map<String, dynamic> amenity;

  const _AmenityCard({required this.amenity});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border(
          left: BorderSide(
            color: (amenity['iconColor'] as Color).withValues(alpha: 0.4),
            width: 3,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(3.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: amenity['bgColor'] as Color,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Icon(
                  amenity['icon'] as IconData,
                  color: amenity['iconColor'] as Color,
                  size: 20,
                ),
              ),
            ),
            SizedBox(height: 1.2.h),
            Text(
              amenity['title'] as String,
              style: GoogleFonts.inter(
                fontSize: 11.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF18181b),
                height: 1.2,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 0.6.h),
            Text(
              amenity['description'] as String,
              style: GoogleFonts.inter(
                fontSize: 9.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF71717a),
                height: 1.4,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
