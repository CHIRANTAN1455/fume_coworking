import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class PrintSuccessWidget extends StatelessWidget {
  final String jobId;
  final String estimatedTime;
  final VoidCallback onTrackStatus;
  final VoidCallback onDone;

  const PrintSuccessWidget({
    super.key,
    required this.jobId,
    required this.estimatedTime,
    required this.onTrackStatus,
    required this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        color: const Color(0xFF18181b),
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: const Color(0xFF10b981).withValues(alpha: 0.4),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: const Color(0xFF10b981).withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle_outline,
              color: Color(0xFF10b981),
              size: 40,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            'Print Job Submitted!',
            style: GoogleFonts.dmSans(
              fontSize: 16.sp,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 0.8.h),
          Text(
            'Your documents are queued for printing.',
            style: GoogleFonts.dmSans(
              fontSize: 10.sp,
              color: const Color(0xFF71717a),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 2.h),
          Container(
            padding: EdgeInsets.all(3.w),
            decoration: BoxDecoration(
              color: const Color(0xFF27272a),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              children: [
                _buildInfoRow(
                  Icons.confirmation_number_outlined,
                  'Job ID',
                  jobId,
                  const Color(0xFF60a5fa),
                ),
                SizedBox(height: 1.h),
                _buildInfoRow(
                  Icons.access_time_outlined,
                  'Est. Completion',
                  estimatedTime,
                  const Color(0xFFfbbf24),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onTrackStatus,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF60a5fa),
                    side: const BorderSide(
                      color: Color(0xFF1e40af),
                      width: 1.5,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Track Status',
                    style: GoogleFonts.dmSans(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 3.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: onDone,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF10b981),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Done',
                    style: GoogleFonts.dmSans(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    IconData icon,
    String label,
    String value,
    Color iconColor,
  ) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 16),
        SizedBox(width: 2.w),
        Text(
          '$label: ',
          style: GoogleFonts.dmSans(
            fontSize: 10.sp,
            color: const Color(0xFF71717a),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.dmSans(
              fontSize: 10.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
