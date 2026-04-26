import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CostCalculatorWidget extends StatelessWidget {
  final int pageCount;
  final int copies;
  final bool isColor;

  const CostCalculatorWidget({
    super.key,
    required this.pageCount,
    required this.copies,
    required this.isColor,
  });

  int get _pricePerPage => isColor ? 5 : 2;
  int get _totalCost => pageCount * copies * _pricePerPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1e40af).withValues(alpha: 0.2),
            const Color(0xFF1e3a8a).withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: const Color(0xFF1e40af).withValues(alpha: 0.4),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.calculate_outlined,
                color: Color(0xFF60a5fa),
                size: 18,
              ),
              SizedBox(width: 2.w),
              Text(
                'Cost Estimate',
                style: GoogleFonts.dmSans(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 1.5.h),
          _buildRow('Pages', '$pageCount'),
          _buildRow('Copies', '$copies'),
          _buildRow(
            'Rate',
            '₹$_pricePerPage/page (${isColor ? "Color" : "B&W"})',
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Divider(
              color: const Color(0xFF3f3f46).withValues(alpha: 0.5),
              height: 1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: GoogleFonts.dmSans(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                '₹$_totalCost',
                style: GoogleFonts.dmSans(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFFfbbf24),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.dmSans(
              fontSize: 10.sp,
              color: const Color(0xFF71717a),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.dmSans(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFa1a1aa),
            ),
          ),
        ],
      ),
    );
  }
}
