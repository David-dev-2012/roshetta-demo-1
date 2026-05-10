import 'package:flutter/material.dart';

import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/route_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDonationsPage extends StatelessWidget {
  const MyDonationsPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _donations = const [
    {
      'name': 'Paracetamol 500mg',
      'date': 'Jan 20, 2026',
      'quantity': '10 Items',
      'status': 'Pending',
      'statusColor': Color(0xFFF59E0B),
    },
    {
      'name': 'Vitamin D3',
      'date': 'Jan 22, 2026',
      'quantity': '5 Items',
      'status': 'Accepted',
      'statusColor': Color(0xFF10B981),
    },
    {
      'name': 'Amoxicillin 250mg',
      'date': 'Jan 25, 2026',
      'quantity': '8 Items',
      'status': 'Delivered',
      'statusColor': Color(0xFF3B82F6),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'My Donations',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        leading: const BackButton(),
      ),
      body: Column(
        children: [
          // Stats Row
          Container(
            color: const Color(0xFF2563EB),
            padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 24.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _StatItem(value: '12', label: 'Total'),
                _buildDivider(),
                _StatItem(value: '8', label: 'Delivered'),
                _buildDivider(),
                _StatItem(value: '4', label: 'On the Way'),
              ],
            ),
          ),

          // Thank You Banner
          Container(
            margin: EdgeInsets.all(16.w),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: const Color(0xFF2563EB),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Row(
              children: [
                Icon(Icons.favorite, color: Colors.white, size: 28.sp),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thank You for Your Kindness!',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.sp),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Your donations have helped 11 people access essential medicines.',
                        style: TextStyle(color: Colors.white70, fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Header Row
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Donations',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                ),
                TextButton(
                  onPressed: () => AppNavigation.pushNamed(context, RoutesName.pharmacyDashboard),
                  child: Text(
                    '+ Add New',
                    style: TextStyle(color: const Color(0xFF2563EB), fontWeight: FontWeight.w600, fontSize: 14.sp),
                  ),
                ),
              ],
            ),
          ),

          // List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: _donations.length,
              itemBuilder: (context, index) => _DonationItem(donation: _donations[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() => Container(height: 30.h, width: 1, color: Colors.white30);
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: TextStyle(color: Colors.white, fontSize: 28.sp, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: Colors.white70, fontSize: 13.sp)),
      ],
    );
  }
}

class _DonationItem extends StatelessWidget {
  final Map<String, dynamic> donation;
  const _DonationItem({required this.donation});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(color: const Color(0xFFEFF6FF), borderRadius: BorderRadius.circular(10.r)),
            child: Icon(Icons.medication, color: const Color(0xFF2563EB), size: 22.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(donation['name'], style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp, color: const Color(0xFF1E293B))),
                SizedBox(height: 2.h),
                Text('${donation['quantity']} • ${donation['date']}', style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: (donation['statusColor'] as Color).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              donation['status'],
              style: TextStyle(color: donation['statusColor'] as Color, fontSize: 12.sp, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}