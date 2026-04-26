import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

class LocationsPreviewWidget extends StatelessWidget {
  LocationsPreviewWidget({super.key});

  final List<Map<String, dynamic>> _locations = [
    {
      'name': 'Delhi',
      'address': 'Netaji Subhash Palace, Delhi',
      'seats': 250,
      'image':
          'https://img.rocket.new/generatedImages/rocket_gen_img_1e581f417-1771238507083.png',
      'semanticLabel':
          'Modern coworking office space in Delhi with open workstations and glass partitions',
      'features': [
        'High-Speed WiFi',
        'Meeting Rooms',
        '24/7 Access',
        'Parking',
        'Coffee Bar',
      ],
      'badge': 'Metro Connected',
    },
    {
      'name': 'Gurgaon',
      'address': 'Udyog Vihar Phase 4, Gurgaon',
      'seats': 250,
      'image':
          'https://img.rocket.new/generatedImages/rocket_gen_img_125262cc4-1772375423837.png',
      'semanticLabel':
          'Premium coworking space in Gurgaon with collaborative work areas and modern furniture',
      'features': [
        'Fiber Internet',
        'Conference Rooms',
        'Dedicated Desks',
        'Cafeteria',
        'Security',
      ],
      'badge': 'Corporate Hub',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _locations
          .map(
            (loc) => Padding(
              padding: EdgeInsets.only(bottom: 2.h),
              child: _LocationCard(location: loc),
            ),
          )
          .toList(),
    );
  }
}

class _LocationCard extends StatefulWidget {
  final Map<String, dynamic> location;
  const _LocationCard({required this.location});

  @override
  State<_LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<_LocationCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final loc = widget.location;
    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: Container(
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
                    imageUrl: loc['image'] as String,
                    width: double.infinity,
                    height: 18.h,
                    fit: BoxFit.cover,
                    semanticLabel: loc['semanticLabel'] as String,
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.w,
                        vertical: 0.5.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1e40af),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        loc['badge'] as String,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          loc['name'] as String,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.w,
                          vertical: 0.4.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF27272a),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          '${loc['seats']} seats',
                          style: TextStyle(
                            color: const Color(0xFFa1a1aa),
                            fontSize: 9.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.5.h),
                  Row(
                    children: [
                      CustomIconWidget(
                        iconName: 'location_on',
                        color: const Color(0xFF1e40af),
                        size: 14,
                      ),
                      SizedBox(width: 1.w),
                      Expanded(
                        child: Text(
                          loc['address'] as String,
                          style: TextStyle(
                            color: const Color(0xFFa1a1aa),
                            fontSize: 10.sp,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      CustomIconWidget(
                        iconName: _expanded
                            ? 'keyboard_arrow_up'
                            : 'keyboard_arrow_down',
                        color: const Color(0xFFa1a1aa),
                        size: 18,
                      ),
                    ],
                  ),
                  if (_expanded) ...[
                    SizedBox(height: 1.5.h),
                    const Divider(color: Color(0xFF3f3f46)),
                    SizedBox(height: 1.h),
                    Text(
                      'Features',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 0.8.h),
                    ...(loc['features'] as List<String>).map(
                      (f) => Padding(
                        padding: EdgeInsets.only(bottom: 0.5.h),
                        child: Row(
                          children: [
                            CustomIconWidget(
                              iconName: 'check_circle',
                              color: const Color(0xFF1e40af),
                              size: 14,
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              f,
                              style: TextStyle(
                                color: const Color(0xFFa1a1aa),
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
