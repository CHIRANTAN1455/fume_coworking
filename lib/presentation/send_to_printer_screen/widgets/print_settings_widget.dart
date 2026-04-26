import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class PrintSettingsWidget extends StatelessWidget {
  final String selectedPrinter;
  final String selectedPaperSize;
  final String selectedOrientation;
  final int copies;
  final bool isColor;
  final void Function(String?) onPrinterChanged;
  final void Function(String?) onPaperSizeChanged;
  final void Function(String?) onOrientationChanged;
  final VoidCallback onIncrementCopies;
  final VoidCallback onDecrementCopies;
  final void Function(bool) onColorToggle;

  const PrintSettingsWidget({
    super.key,
    required this.selectedPrinter,
    required this.selectedPaperSize,
    required this.selectedOrientation,
    required this.copies,
    required this.isColor,
    required this.onPrinterChanged,
    required this.onPaperSizeChanged,
    required this.onOrientationChanged,
    required this.onIncrementCopies,
    required this.onDecrementCopies,
    required this.onColorToggle,
  });

  static const List<String> printers = [
    'Office Printer 1 (Floor 1)',
    'Office Printer 2 (Floor 2)',
    'Color Printer (Reception)',
    'HP LaserJet Pro (Cabin)',
  ];

  static const List<String> paperSizes = ['A4', 'A3', 'Letter', 'Legal'];
  static const List<String> orientations = ['Portrait', 'Landscape'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: const Color(0xFF18181b),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: const Color(0xFF3f3f46), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Print Settings',
            style: GoogleFonts.dmSans(
              fontSize: 13.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 2.h),
          _buildDropdown(
            label: 'Printer',
            value: selectedPrinter,
            items: printers,
            icon: Icons.print_outlined,
            onChanged: onPrinterChanged,
          ),
          SizedBox(height: 1.5.h),
          Row(
            children: [
              Expanded(
                child: _buildDropdown(
                  label: 'Paper Size',
                  value: selectedPaperSize,
                  items: paperSizes,
                  icon: Icons.crop_landscape_outlined,
                  onChanged: onPaperSizeChanged,
                ),
              ),
              SizedBox(width: 3.w),
              Expanded(
                child: _buildDropdown(
                  label: 'Orientation',
                  value: selectedOrientation,
                  items: orientations,
                  icon: Icons.screen_rotation_outlined,
                  onChanged: onOrientationChanged,
                ),
              ),
            ],
          ),
          SizedBox(height: 1.5.h),
          Row(
            children: [
              Expanded(child: _buildCopiesCounter()),
              SizedBox(width: 3.w),
              Expanded(child: _buildColorToggle()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required IconData icon,
    required void Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.dmSans(
            fontSize: 9.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF71717a),
          ),
        ),
        SizedBox(height: 0.5.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0),
          decoration: BoxDecoration(
            color: const Color(0xFF27272a),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: const Color(0xFF3f3f46), width: 1),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              dropdownColor: const Color(0xFF27272a),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF71717a),
                size: 18,
              ),
              style: GoogleFonts.dmSans(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              items: items
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCopiesCounter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Copies',
          style: GoogleFonts.dmSans(
            fontSize: 9.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF71717a),
          ),
        ),
        SizedBox(height: 0.5.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          decoration: BoxDecoration(
            color: const Color(0xFF27272a),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: const Color(0xFF3f3f46), width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onDecrementCopies,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3f3f46),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
              Text(
                '$copies',
                style: GoogleFonts.dmSans(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: onIncrementCopies,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1e40af),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 16),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildColorToggle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Print Mode',
          style: GoogleFonts.dmSans(
            fontSize: 9.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF71717a),
          ),
        ),
        SizedBox(height: 0.5.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
          decoration: BoxDecoration(
            color: const Color(0xFF27272a),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: const Color(0xFF3f3f46), width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isColor ? 'Color' : 'B&W',
                style: GoogleFonts.dmSans(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: isColor
                      ? const Color(0xFFfbbf24)
                      : const Color(0xFFa1a1aa),
                ),
              ),
              Switch(
                value: isColor,
                onChanged: onColorToggle,
                activeThumbColor: const Color(0xFFfbbf24),
                activeTrackColor: const Color(
                  0xFFfbbf24,
                ).withValues(alpha: 0.3),
                inactiveThumbColor: const Color(0xFF71717a),
                inactiveTrackColor: const Color(0xFF3f3f46),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
