import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import './widgets/cost_calculator_widget.dart';
import './widgets/file_list_widget.dart';
import './widgets/print_settings_widget.dart';
import './widgets/print_success_widget.dart';
import './widgets/upload_progress_widget.dart';
import './widgets/upload_zone_widget.dart';

class SendToPrinterScreen extends StatefulWidget {
  const SendToPrinterScreen({super.key});

  @override
  State<SendToPrinterScreen> createState() => _SendToPrinterScreenState();
}

class _SendToPrinterScreenState extends State<SendToPrinterScreen> {
  final List<DocumentFileModel> _files = [];

  // Print settings
  String _selectedPrinter = PrintSettingsWidget.printers.first;
  String _selectedPaperSize = 'A4';
  String _selectedOrientation = 'Portrait';
  int _copies = 1;
  bool _isColor = false;

  // Upload progress state
  bool _isUploading = false;
  double _uploadProgress = 0.0;
  String _uploadingFileName = '';
  Timer? _uploadTimer;

  // Print submission state
  bool _isSending = false;
  bool _isSuccess = false;
  String _printJobId = '';
  String _estimatedTime = '';

  // Mock file data to simulate file selection
  static const List<Map<String, dynamic>> _mockFiles = [
    {
      'name': 'Project_Proposal_2024.pdf',
      'size': '2.4 MB',
      'format': 'pdf',
      'isImage': false,
    },
    {
      'name': 'Meeting_Notes.docx',
      'size': '156 KB',
      'format': 'docx',
      'isImage': false,
    },
    {
      'name': 'Design_Mockup.png',
      'size': '1.8 MB',
      'format': 'png',
      'isImage': true,
      'imageUrl':
          'https://images.unsplash.com/photo-1558655146-9f40138edfeb?w=200&q=80',
    },
    {
      'name': 'Invoice_March.pdf',
      'size': '89 KB',
      'format': 'pdf',
      'isImage': false,
    },
    {
      'name': 'Team_Photo.jpg',
      'size': '3.1 MB',
      'format': 'jpg',
      'isImage': true,
      'imageUrl':
          'https://images.pexels.com/photos/3184418/pexels-photo-3184418.jpeg?w=200',
    },
  ];

  int get _pageCount => _files.isEmpty ? 0 : _files.length * 2;

  void _simulateFileUpload() {
    if (_files.length >= _mockFiles.length) {
      _showSnackBar('Maximum files reached for demo');
      return;
    }

    final mockFile = _mockFiles[_files.length];
    setState(() {
      _isUploading = true;
      _uploadProgress = 0.0;
      _uploadingFileName = mockFile['name'] as String;
    });

    _uploadTimer = Timer.periodic(const Duration(milliseconds: 80), (timer) {
      setState(() {
        _uploadProgress += 0.05;
        if (_uploadProgress >= 1.0) {
          _uploadProgress = 1.0;
          timer.cancel();
          _isUploading = false;
          _files.add(
            DocumentFileModel(
              name: mockFile['name'] as String,
              size: mockFile['size'] as String,
              format: mockFile['format'] as String,
              isImage: mockFile['isImage'] as bool,
              imageUrl: mockFile['imageUrl'] as String?,
            ),
          );
        }
      });
    });
  }

  void _cancelUpload() {
    _uploadTimer?.cancel();
    setState(() {
      _isUploading = false;
      _uploadProgress = 0.0;
    });
  }

  void _removeFile(int index) {
    setState(() {
      _files.removeAt(index);
    });
  }

  Future<void> _sendToPrint() async {
    if (_files.isEmpty) {
      _showSnackBar('Please add at least one file to print');
      return;
    }

    setState(() => _isSending = true);

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    final jobId =
        'FMC-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';
    final now = DateTime.now();
    final eta = now.add(const Duration(minutes: 15));
    final etaStr =
        '${eta.hour.toString().padLeft(2, '0')}:${eta.minute.toString().padLeft(2, '0')} today';

    setState(() {
      _isSending = false;
      _isSuccess = true;
      _printJobId = jobId;
      _estimatedTime = etaStr;
    });
  }

  void _resetScreen() {
    setState(() {
      _files.clear();
      _isSuccess = false;
      _printJobId = '';
      _estimatedTime = '';
      _copies = 1;
      _isColor = false;
      _selectedPrinter = PrintSettingsWidget.printers.first;
      _selectedPaperSize = 'A4';
      _selectedOrientation = 'Portrait';
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: GoogleFonts.dmSans(fontSize: 11.sp)),
        backgroundColor: const Color(0xFF27272a),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(4.w),
      ),
    );
  }

  @override
  void dispose() {
    _uploadTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0a0a0a),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: _isSuccess ? _buildSuccessView() : _buildMainContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
      decoration: const BoxDecoration(
        color: Color(0xFF0a0a0a),
        border: Border(bottom: BorderSide(color: Color(0xFF18181b), width: 1)),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF18181b),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: const Color(0xFF3f3f46), width: 1),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
          SizedBox(width: 3.w),
          Expanded(
            child: Text(
              'Send to Printer',
              style: GoogleFonts.dmSans(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.8.h),
            decoration: BoxDecoration(
              color: const Color(0xFF1e40af).withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: const Color(0xFF1e40af).withValues(alpha: 0.4),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.print_outlined,
                  color: Color(0xFF60a5fa),
                  size: 14,
                ),
                SizedBox(width: 1.w),
                Text(
                  '${_files.length} file${_files.length != 1 ? 's' : ''}',
                  style: GoogleFonts.dmSans(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF60a5fa),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Upload zone
          UploadZoneWidget(onTap: _simulateFileUpload),
          SizedBox(height: 2.h),

          // Upload progress
          if (_isUploading) ...[
            UploadProgressWidget(
              progress: _uploadProgress,
              fileName: _uploadingFileName,
              onCancel: _cancelUpload,
            ),
            SizedBox(height: 2.h),
          ],

          // File list
          if (_files.isNotEmpty) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Selected Files',
                  style: GoogleFonts.dmSans(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${_files.length} file${_files.length != 1 ? 's' : ''}',
                  style: GoogleFonts.dmSans(
                    fontSize: 10.sp,
                    color: const Color(0xFF71717a),
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            FileListWidget(files: _files, onRemove: _removeFile),
            SizedBox(height: 2.h),
          ],

          // Print settings
          PrintSettingsWidget(
            selectedPrinter: _selectedPrinter,
            selectedPaperSize: _selectedPaperSize,
            selectedOrientation: _selectedOrientation,
            copies: _copies,
            isColor: _isColor,
            onPrinterChanged: (v) =>
                setState(() => _selectedPrinter = v ?? _selectedPrinter),
            onPaperSizeChanged: (v) =>
                setState(() => _selectedPaperSize = v ?? _selectedPaperSize),
            onOrientationChanged: (v) => setState(
              () => _selectedOrientation = v ?? _selectedOrientation,
            ),
            onIncrementCopies: () =>
                setState(() => _copies = (_copies + 1).clamp(1, 99)),
            onDecrementCopies: () =>
                setState(() => _copies = (_copies - 1).clamp(1, 99)),
            onColorToggle: (v) => setState(() => _isColor = v),
          ),
          SizedBox(height: 2.h),

          // Cost calculator
          CostCalculatorWidget(
            pageCount: _pageCount,
            copies: _copies,
            isColor: _isColor,
          ),
          SizedBox(height: 3.h),

          // Bottom action buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _isUploading ? null : _simulateFileUpload,
                  icon: const Icon(Icons.add, size: 18),
                  label: Text(
                    'Add More Files',
                    style: GoogleFonts.dmSans(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF60a5fa),
                    side: const BorderSide(
                      color: Color(0xFF1e40af),
                      width: 1.5,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 3.w),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: _isSending ? null : _sendToPrint,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1e40af),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: const Color(
                      0xFF1e40af,
                    ).withValues(alpha: 0.5),
                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: _isSending
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              'Sending...',
                              style: GoogleFonts.dmSans(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.print, size: 18),
                            SizedBox(width: 2.w),
                            Text(
                              'Send to Print',
                              style: GoogleFonts.dmSans(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }

  Widget _buildSuccessView() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      child: PrintSuccessWidget(
        jobId: _printJobId,
        estimatedTime: _estimatedTime,
        onTrackStatus: () {
          _showSnackBar('Tracking feature coming soon!');
        },
        onDone: _resetScreen,
      ),
    );
  }
}
