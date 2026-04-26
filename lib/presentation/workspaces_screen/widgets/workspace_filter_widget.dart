import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WorkspaceFilterWidget extends StatelessWidget {
  final List<String> filters;
  final int selectedIndex;
  final ValueChanged<int> onFilterChanged;

  const WorkspaceFilterWidget({
    super.key,
    required this.filters,
    required this.selectedIndex,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.5.h,
      decoration: BoxDecoration(
        color: const Color(0xFF27272a),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF3f3f46)),
      ),
      child: Row(
        children: List.generate(filters.length, (index) {
          final isSelected = selectedIndex == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => onFilterChanged(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF1e40af)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  filters[index],
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected ? Colors.white : const Color(0xFFa1a1aa),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
