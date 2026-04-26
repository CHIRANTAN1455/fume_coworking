import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_icon_widget.dart';
import './widgets/amenities_preview_widget.dart';
import './widgets/cta_banner_widget.dart';
import './widgets/hero_banner_widget.dart';
import './widgets/locations_preview_widget.dart';
import './widgets/popular_workspaces_widget.dart';
import './widgets/quick_actions_widget.dart';

class HomeScreenInitialPage extends StatefulWidget {
  const HomeScreenInitialPage({super.key});

  @override
  State<HomeScreenInitialPage> createState() => _HomeScreenInitialPageState();
}

class _HomeScreenInitialPageState extends State<HomeScreenInitialPage> {
  String _selectedLocation = 'Delhi';
  bool _isRefreshing = false;

  final List<String> _locations = ['Delhi', 'Gurgaon'];

  Future<void> _onRefresh() async {
    setState(() => _isRefreshing = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isRefreshing = false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFF0a0a0a),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            color: const Color(0xFF1e40af),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: _buildHeader(theme)),
                SliverToBoxAdapter(child: SizedBox(height: 2.h)),
                SliverToBoxAdapter(child: HeroBannerWidget()),
                SliverToBoxAdapter(child: SizedBox(height: 2.h)),
                SliverToBoxAdapter(
                  child: _buildSectionTitle('Quick Actions', theme),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 1.h)),
                SliverToBoxAdapter(child: QuickActionsWidget()),
                SliverToBoxAdapter(child: SizedBox(height: 2.h)),
                SliverToBoxAdapter(
                  child: _buildSectionTitle('Our Locations', theme),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 1.h)),
                SliverToBoxAdapter(child: LocationsPreviewWidget()),
                SliverToBoxAdapter(child: SizedBox(height: 2.h)),
                SliverToBoxAdapter(
                  child: _buildSectionTitle('Popular Workspaces', theme),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 1.h)),
                SliverToBoxAdapter(child: PopularWorkspacesWidget()),
                SliverToBoxAdapter(child: SizedBox(height: 2.h)),
                SliverToBoxAdapter(
                  child: _buildSectionTitle('Amenities', theme),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 1.h)),
                SliverToBoxAdapter(child: AmenitiesPreviewWidget()),
                SliverToBoxAdapter(child: SizedBox(height: 2.h)),
                SliverToBoxAdapter(child: CtaBannerWidget()),
                SliverToBoxAdapter(child: SizedBox(height: 2.h)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Row(
      children: [
        // Logo
        Expanded(
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1e40af), Color(0xFF1e3a8a)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'F',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 2.w),
              Text(
                'Fume',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        ),
        // Location Selector
        GestureDetector(
          onTap: _showLocationPicker,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            decoration: BoxDecoration(
              color: const Color(0xFF18181b),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF3f3f46)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomIconWidget(
                  iconName: 'location_on',
                  color: const Color(0xFF1e40af),
                  size: 14,
                ),
                SizedBox(width: 1.w),
                Text(
                  _selectedLocation,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 1.w),
                CustomIconWidget(
                  iconName: 'keyboard_arrow_down',
                  color: const Color(0xFFa1a1aa),
                  size: 14,
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 3.w),
        // Notification Bell
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF18181b),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF3f3f46)),
            ),
            child: Center(
              child: CustomIconWidget(
                iconName: 'notifications_outlined',
                color: const Color(0xFFa1a1aa),
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, ThemeData theme) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 15.sp,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.3,
      ),
    );
  }

  void _showLocationPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF18181b),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Location',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 2.h),
            ..._locations.map(
              (loc) => ListTile(
                leading: CustomIconWidget(
                  iconName: 'location_on',
                  color: _selectedLocation == loc
                      ? const Color(0xFF1e40af)
                      : const Color(0xFFa1a1aa),
                  size: 20,
                ),
                title: Text(
                  loc,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: _selectedLocation == loc
                        ? FontWeight.w600
                        : FontWeight.w400,
                  ),
                ),
                trailing: _selectedLocation == loc
                    ? CustomIconWidget(
                        iconName: 'check_circle',
                        color: const Color(0xFF1e40af),
                        size: 20,
                      )
                    : null,
                onTap: () {
                  setState(() => _selectedLocation = loc);
                  Navigator.pop(ctx);
                },
              ),
            ),
            SizedBox(height: 1.h),
          ],
        ),
      ),
    );
  }
}
