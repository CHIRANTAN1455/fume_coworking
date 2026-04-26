import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_widget.dart';

class AmenitiesPreviewWidget extends StatelessWidget {
  AmenitiesPreviewWidget({super.key});

  final List<Map<String, dynamic>> _amenities = [
    {'icon': 'wifi', 'label': 'WiFi', 'color': const Color(0xFF1e40af)},
    {'icon': 'coffee', 'label': 'Coffee', 'color': const Color(0xFFd97706)},
    {
      'icon': 'meeting_room',
      'label': 'Meeting Rooms',
      'color': const Color(0xFF7c3aed),
    },
    {
      'icon': 'access_time',
      'label': '24/7 Access',
      'color': const Color(0xFF059669),
    },
    {
      'icon': 'local_parking',
      'label': 'Parking',
      'color': const Color(0xFF0891b2),
    },
    {'icon': 'print', 'label': 'Printer', 'color': const Color(0xFFdc2626)},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 3.w,
        mainAxisSpacing: 1.5.h,
        childAspectRatio: 1.4,
      ),
      itemCount: _amenities.length,
      itemBuilder: (context, index) {
        final amenity = _amenities[index];
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF18181b),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF3f3f46)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: (amenity['color'] as Color).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: CustomIconWidget(
                    iconName: amenity['icon'] as String,
                    color: amenity['color'] as Color,
                    size: 18,
                  ),
                ),
              ),
              SizedBox(height: 0.5.h),
              Text(
                amenity['label'] as String,
                style: TextStyle(
                  color: const Color(0xFFa1a1aa),
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }
}
