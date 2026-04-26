import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import './widgets/workspace_card_widget.dart';
import './widgets/workspace_empty_state_widget.dart';
import './widgets/workspace_filter_widget.dart';

class WorkspacesScreen extends StatefulWidget {
  const WorkspacesScreen({super.key});

  @override
  State<WorkspacesScreen> createState() => _WorkspacesScreenState();
}

class _WorkspacesScreenState extends State<WorkspacesScreen>
    with SingleTickerProviderStateMixin {
  int _selectedFilterIndex = 0;
  final List<String> _filters = ['All', 'Hourly', 'Monthly'];

  final List<Map<String, dynamic>> _workspaces = [
    {
      "id": 1,
      "emoji": "🎫",
      "name": "Day Pass",
      "description":
          "Flexible daily access to our premium coworking space. Perfect for freelancers and remote workers.",
      "price": "₹499",
      "unit": "/day",
      "type": "hourly",
      "popular": true,
      "features": [
        "High-Speed WiFi",
        "Coffee & Tea",
        "Locker Access",
        "Print 10 Pages",
      ],
    },
    {
      "id": 2,
      "emoji": "🖥️",
      "name": "Open Dedicated",
      "description":
          "Your own dedicated desk in our open workspace. Ideal for professionals needing a consistent spot.",
      "price": "₹8,000",
      "unit": "/month",
      "type": "monthly",
      "popular": true,
      "features": [
        "Dedicated Desk",
        "Storage Locker",
        "Unlimited Coffee",
        "24/7 Access",
      ],
    },
    {
      "id": 3,
      "emoji": "🗂️",
      "name": "Cubicle",
      "description":
          "Semi-private cubicle workspace offering focus and privacy in a collaborative environment.",
      "price": "₹12,000",
      "unit": "/month",
      "type": "monthly",
      "popular": false,
      "features": [
        "Private Cubicle",
        "Personal Storage",
        "Reception Services",
        "Meeting Credits",
      ],
    },
    {
      "id": 4,
      "emoji": "🏢",
      "name": "Private Cabin",
      "description":
          "Fully enclosed private office for teams or individuals requiring complete privacy.",
      "price": "₹35,000",
      "unit": "/month",
      "type": "monthly",
      "popular": true,
      "features": [
        "Private Office",
        "Team of 4",
        "Dedicated Internet",
        "Branding Options",
      ],
    },
    {
      "id": 5,
      "emoji": "📅",
      "name": "Meeting Room",
      "description":
          "Professional meeting room for client presentations, interviews, and team discussions.",
      "price": "₹500",
      "unit": "/hour",
      "type": "hourly",
      "popular": false,
      "features": [
        "Seats 6 People",
        "Projector & Screen",
        "Whiteboard",
        "Video Conferencing",
      ],
    },
    {
      "id": 6,
      "emoji": "🎙️",
      "name": "Conference Room",
      "description":
          "Large conference room for board meetings, workshops, and corporate events.",
      "price": "₹1,500",
      "unit": "/hour",
      "type": "hourly",
      "popular": false,
      "features": [
        "Seats 20 People",
        "AV Equipment",
        "Catering Available",
        "Dedicated Host",
      ],
    },
    {
      "id": 7,
      "emoji": "📬",
      "name": "Virtual Office",
      "description":
          "Professional business address and mail handling without a physical workspace.",
      "price": "₹2,000",
      "unit": "/month",
      "type": "monthly",
      "popular": false,
      "features": [
        "Business Address",
        "Mail Handling",
        "GST Registration",
        "Call Answering",
      ],
    },
  ];

  List<Map<String, dynamic>> get _filteredWorkspaces {
    if (_selectedFilterIndex == 0) return _workspaces;
    final filterType = _filters[_selectedFilterIndex].toLowerCase();
    return _workspaces
        .where((w) => (w["type"] as String) == filterType)
        .toList();
  }

  void _onFilterChanged(int index) {
    HapticFeedback.selectionClick();
    setState(() => _selectedFilterIndex = index);
  }

  void _onBookTap(Map<String, dynamic> workspace) {
    HapticFeedback.lightImpact();
    Navigator.of(
      context,
      rootNavigator: true,
    ).pushNamed('/workspace-detail-screen', arguments: workspace);
  }

  void _onLongPress(Map<String, dynamic> workspace) {
    HapticFeedback.mediumImpact();
    _showQuickActions(workspace);
  }

  void _showQuickActions(Map<String, dynamic> workspace) {
    final theme = Theme.of(context);
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF27272a),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 10.w,
                height: 0.5.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF3f3f46),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                workspace["name"] as String,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 1.h),
              _quickActionTile(
                Icons.favorite_border_rounded,
                'Add to Favorites',
                theme,
              ),
              _quickActionTile(Icons.share_rounded, 'Share', theme),
              _quickActionTile(Icons.compare_arrows_rounded, 'Compare', theme),
              SizedBox(height: 1.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _quickActionTile(IconData icon, String label, ThemeData theme) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFFfbbf24)),
      title: Text(
        label,
        style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
      ),
      onTap: () => Navigator.pop(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filtered = _filteredWorkspaces;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Workspaces',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.w,
                    vertical: 0.8.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1e40af).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFF1e40af).withValues(alpha: 0.4),
                    ),
                  ),
                  child: Text(
                    '${_workspaces.length} Types',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: const Color(0xFF93c5fd),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 0.5.h),
            Text(
              'Find the perfect workspace for you',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: const Color(0xFFa1a1aa),
              ),
            ),
            SizedBox(height: 2.h),
            // Filter
            WorkspaceFilterWidget(
              filters: _filters,
              selectedIndex: _selectedFilterIndex,
              onFilterChanged: _onFilterChanged,
            ),
            SizedBox(height: 2.h),
            // List
            Expanded(
              child: filtered.isEmpty
                  ? const WorkspaceEmptyStateWidget()
                  : ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: filtered.length,
                      separatorBuilder: (_, __) => SizedBox(height: 1.5.h),
                      itemBuilder: (context, index) {
                        final workspace = filtered[index];
                        return WorkspaceCardWidget(
                          workspace: workspace,
                          onBook: () => _onBookTap(workspace),
                          onLongPress: () => _onLongPress(workspace),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
