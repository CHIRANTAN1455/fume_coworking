import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class UploadProgressWidget extends StatelessWidget {
  final double progress;
  final String fileName;
  final VoidCallback onCancel;

  const UploadProgressWidget({
    super.key,
    required this.progress,
    required this.fileName,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: const Color(0xFF18181b),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: const Color(0xFF3f3f46), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.upload_file_outlined,
                color: Color(0xFF60a5fa),
                size: 18,
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Text(
                  fileName,
                  style: GoogleFonts.dmSans(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                onTap: onCancel,
                child: Text(
                  'Cancel',
                  style: GoogleFonts.dmSans(
                    fontSize: 9.sp,
                    color: const Color(0xFFef4444),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: const Color(0xFF3f3f46),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xFF1e40af),
                    ),
                    minHeight: 6,
                  ),
                ),
              ),
              SizedBox(width: 3.w),
              Text(
                '${(progress * 100).toInt()}%',
                style: GoogleFonts.dmSans(
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF60a5fa),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
