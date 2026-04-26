import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_widget.dart';

class QuickActionsWidget extends StatelessWidget {
  QuickActionsWidget({super.key});

  final List<Map<String, dynamic>> _actions = [
    {
      'title': 'Day Pass',
      'subtitle': '₹499/day',
      'icon': 'work_outline',
      'color': const Color(0xFF1e40af),
      'route': '/workspaces-screen',
    },
    {
      'title': 'Book Meeting',
      'subtitle': 'Reserve now',
      'icon': 'meeting_room',
      'color': const Color(0xFF7c3aed),
      'route': '/workspaces-screen',
    },
    {
      'title': 'Virtual Office',
      'subtitle': '₹2000/mo',
      'icon': 'computer',
      'color': const Color(0xFF059669),
      'route': '/workspaces-screen',
    },
    {
      'title': 'Print Docs',
      'subtitle': 'Send to printer',
      'icon': 'print',
      'color': const Color(0xFF0891b2),
      'route': '/send-to-printer-screen',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _actions.length,
        separatorBuilder: (_, __) => SizedBox(width: 3.w),
        itemBuilder: (context, index) {
          final action = _actions[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(
                context,
                rootNavigator: true,
              ).pushNamed(action['route'] as String);
            },
            child: Container(
              width: 28.w,
              padding: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                color: const Color(0xFF18181b),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF3f3f46)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: (action['color'] as Color).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: CustomIconWidget(
                        iconName: action['icon'] as String,
                        color: action['color'] as Color,
                        size: 18,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        action['title'] as String,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        action['subtitle'] as String,
                        style: TextStyle(
                          color: const Color(0xFFa1a1aa),
                          fontSize: 9.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
