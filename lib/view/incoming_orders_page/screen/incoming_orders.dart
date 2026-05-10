import 'package:flutter/material.dart';

import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/route_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncomingOrdersPage extends StatefulWidget {
  const IncomingOrdersPage({Key? key}) : super(key: key);

  @override
  State<IncomingOrdersPage> createState() => _IncomingOrdersPageState();
}

class _IncomingOrdersPageState extends State<IncomingOrdersPage> {
  int _selectedTab = 0;
  final List<String> _tabs = ['Pending', 'Processing', 'Ready'];

  final List<Map<String, dynamic>> _orders = [
    {
      'id': '#12345',
      'name': 'John Doe',
      'phone': '+1 234-567-8901',
      'amount': '\$30.47',
      'time': '10 mins ago',
      'items': '3 Items',
    },
    {
      'id': '#12342',
      'name': 'Arya Williams',
      'phone': '+1 234-567-8904',
      'amount': '\$18.75',
      'time': '2 hours ago',
      'items': '1 Items',
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
          'Incoming Orders',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        leading: const BackButton(),
      ),
      body: Column(
        children: [
          // Tab Bar
          Container(
            color: const Color(0xFF2563EB),
            padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
            child: Row(
              children: List.generate(_tabs.length, (i) {
                final isSelected = i == _selectedTab;
                return GestureDetector(
                  onTap: () => setState(() => _selectedTab = i),
                  child: Container(
                    margin: EdgeInsets.only(right: 8.w),
                    padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      _tabs[i],
                      style: TextStyle(
                        color: isSelected ? const Color(0xFF2563EB) : Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          // Orders List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: _orders.length,
              itemBuilder: (context, index) => _OrderCard(order: _orders[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final Map<String, dynamic> order;
  const _OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Padding(
        padding: EdgeInsets.all(14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order ${order['id']}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp, color: const Color(0xFF1E293B)),
                ),
                Text(
                  order['amount'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp, color: const Color(0xFF2563EB)),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Text(order['name'], style: TextStyle(fontSize: 13.sp, color: const Color(0xFF64748B))),
            Text(order['phone'], style: TextStyle(fontSize: 13.sp, color: const Color(0xFF64748B))),
            SizedBox(height: 4.h),
            Row(
              children: [
                Icon(Icons.access_time, size: 13.sp, color: Colors.grey),
                SizedBox(width: 4.w),
                Text(order['time'], style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                SizedBox(width: 12.w),
                Icon(Icons.inventory_2_outlined, size: 13.sp, color: Colors.grey),
                SizedBox(width: 4.w),
                Text(order['items'], style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => AppNavigation.pushNamed(context, RoutesName.scan),
                    icon: Icon(Icons.check_circle_outline, color: Colors.white, size: 16.sp),
                    label: Text('Accept & Add Receiver', style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2563EB),
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                OutlinedButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.close, color: const Color(0xFFEF4444), size: 16.sp),
                  label: Text('Reject', style: TextStyle(color: const Color(0xFFEF4444), fontSize: 12.sp)),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFEF4444)),
                    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}