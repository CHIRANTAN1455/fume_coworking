import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_widget.dart';

class PopularWorkspacesWidget extends StatelessWidget {
  PopularWorkspacesWidget({super.key});

  final List<Map<String, dynamic>> _workspaces = [
    {
      'emoji': '🪑',
      'name': 'Day Pass',
      'price': '₹499/day',
      'description': 'Flexible hot desk access for a full day',
      'image':
          'https://img.rocket.new/generatedImages/rocket_gen_img_153097c78-1772101053787.png',
      'semanticLabel':
          'Person working on a laptop at a hot desk in a coworking space',
    },
    {
      'emoji': '🏢',
      'name': 'Private Cabin',
      'price': '₹35,000/mo',
      'description': 'Fully enclosed private office for your team',
      'image':
          'https://img.rocket.new/generatedImages/rocket_gen_img_1e581f417-1771238507083.png',
      'semanticLabel':
          'Private office cabin with glass walls, desk, and ergonomic chairs',
    },
    {
      'emoji': '📋',
      'name': 'Meeting Room',
      'price': '₹500/hr',
      'description': 'Professional meeting space for client calls',
      'image':
          'https://img.rocket.new/generatedImages/rocket_gen_img_19feae49f-1773014825401.png',
      'semanticLabel':
          'Conference meeting room with a large table, chairs, and a presentation screen',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _workspaces.length,
        separatorBuilder: (_, __) => SizedBox(width: 3.w),
        itemBuilder: (context, index) {
          final ws = _workspaces[index];
          return Container(
            width: 55.w,
            decoration: BoxDecoration(
              color: const Color(0xFF18181b),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFF3f3f46)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(14),
                  ),
                  child: Stack(
                    children: [
                      CustomImageWidget(
                        imageUrl: ws['image'] as String,
                        width: double.infinity,
                        height: 12.h,
                        fit: BoxFit.cover,
                        semanticLabel: ws['semanticLabel'] as String,
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.w,
                            vertical: 0.4.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFfbbf24),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'Popular',
                            style: TextStyle(
                              color: const Color(0xFF0a0a0a),
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            ws['emoji'] as String,
                            style: const TextStyle(fontSize: 14),
                          ),
                          SizedBox(width: 1.w),
                          Expanded(
                            child: Text(
                              ws['name'] as String,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 0.3.h),
                      Text(
                        ws['price'] as String,
                        style: TextStyle(
                          color: const Color(0xFF1e40af),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 0.8.h),
                      SizedBox(
                        width: double.infinity,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(
                              context,
                              rootNavigator: true,
                            ).pushNamed('/workspaces-screen');
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 0.8.h),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF1e40af), Color(0xFF1e3a8a)],
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                'Book',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
