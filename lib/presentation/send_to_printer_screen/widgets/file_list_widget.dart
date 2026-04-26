import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class DocumentFileModel {
  final String name;
  final String size;
  final String format;
  final bool isImage;
  final String? imageUrl;

  const DocumentFileModel({
    required this.name,
    required this.size,
    required this.format,
    this.isImage = false,
    this.imageUrl,
  });
}

class FileListWidget extends StatelessWidget {
  final List<DocumentFileModel> files;
  final void Function(int index) onRemove;

  const FileListWidget({
    super.key,
    required this.files,
    required this.onRemove,
  });

  IconData _getFormatIcon(String format) {
    switch (format.toLowerCase()) {
      case 'pdf':
        return Icons.picture_as_pdf_outlined;
      case 'doc':
      case 'docx':
        return Icons.description_outlined;
      case 'jpg':
      case 'jpeg':
      case 'png':
        return Icons.image_outlined;
      default:
        return Icons.insert_drive_file_outlined;
    }
  }

  Color _getFormatColor(String format) {
    switch (format.toLowerCase()) {
      case 'pdf':
        return const Color(0xFFef4444);
      case 'doc':
      case 'docx':
        return const Color(0xFF3b82f6);
      case 'jpg':
      case 'jpeg':
      case 'png':
        return const Color(0xFF10b981);
      default:
        return const Color(0xFF8b5cf6);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(files.length, (index) {
        final file = files[index];
        return Dismissible(
          key: Key('file_$index'),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 4.w),
            decoration: BoxDecoration(
              color: const Color(0xFFef4444).withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: const Icon(Icons.delete_outline, color: Color(0xFFef4444)),
          ),
          onDismissed: (_) => onRemove(index),
          child: Container(
            margin: EdgeInsets.only(bottom: 1.5.h),
            padding: EdgeInsets.all(3.w),
            decoration: BoxDecoration(
              color: const Color(0xFF18181b),
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: const Color(0xFF3f3f46), width: 1),
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: _getFormatColor(file.format).withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: file.isImage && file.imageUrl != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            file.imageUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Icon(
                              _getFormatIcon(file.format),
                              color: _getFormatColor(file.format),
                              size: 22,
                            ),
                          ),
                        )
                      : Icon(
                          _getFormatIcon(file.format),
                          color: _getFormatColor(file.format),
                          size: 22,
                        ),
                ),
                SizedBox(width: 3.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        file.name,
                        style: GoogleFonts.dmSans(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 0.3.h),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: _getFormatColor(
                                file.format,
                              ).withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text(
                              file.format.toUpperCase(),
                              style: GoogleFonts.dmSans(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w700,
                                color: _getFormatColor(file.format),
                              ),
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            file.size,
                            style: GoogleFonts.dmSans(
                              fontSize: 9.sp,
                              color: const Color(0xFF71717a),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => onRemove(index),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFF27272a),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Color(0xFF71717a),
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
