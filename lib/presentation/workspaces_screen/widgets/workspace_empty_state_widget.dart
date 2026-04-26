import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_widget.dart';

class WorkspaceEmptyStateWidget extends StatelessWidget {
  const WorkspaceEmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 20.w,
            height: 20.w,
            decoration: BoxDecoration(
              color: const Color(0xFF27272a),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF3f3f46)),
            ),
            alignment: Alignment.center,
            child: CustomIconWidget(
              iconName: 'search_off_rounded',
              color: const Color(0xFF71717a),
              size: 32,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            'No workspaces match your filter',
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 1.h),
          Text(
            'Try selecting a different filter option\nto explore available workspaces.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: const Color(0xFFa1a1aa),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
