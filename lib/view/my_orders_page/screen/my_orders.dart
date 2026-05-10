import 'package:flutter/material.dart';

import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/route_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _orders = const [
    {
      'id': '#12345',
      'date': 'Jan 26, 2026',
      'amount': '\$30.47',
      'itemsCount': '5 Items',
      'status': 'On Transit',
      'statusColor': Color(0xFFF59E0B),
      'canReorder': false,
    },
    {
      'id': '#12344',
      'date': 'Jan 25, 2026',
      'amount': '\$45.99',
      'itemsCount': '3 Items',
      'status': 'Delivered',
      'statusColor': Color(0xFF10B981),
      'canReorder': true,
    },
    {
      'id': '#12343',
      'date': 'Jan 22, 2026',
      'amount': '\$22.5',
      'itemsCount': '2 Items',
      'status': 'Delivered',
      'statusColor': Color(0xFF10B981),
      'canReorder': true,
    },
    {
      'id': '#12342',
      'date': 'Jan 15, 2026',
      'amount': '\$38.75',
      'itemsCount': '1 Item',
      'status': 'Cancelled',
      'statusColor': Color(0xFFEF4444),
      'canReorder': false,
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
          'My Orders',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        leading: const BackButton(),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.w),
        itemCount: _orders.length,
        itemBuilder: (context, index) => _OrderCard(order: _orders[index]),
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final Map<String, dynamic> order;
  const _OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    final Color statusColor = order['statusColor'] as Color;
    final bool canReorder = order['canReorder'] as bool;

    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Padding(
        padding: EdgeInsets.all(14.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order ${order['id']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp, color: const Color(0xFF1E293B))),
                    SizedBox(height: 2.h),
                    Text(order['date'], style: TextStyle(fontSize: 12.sp, color: const Color(0xFF94A3B8))),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(order['amount'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp, color: const Color(0xFF1E293B))),
                    SizedBox(height: 2.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(order['status'], style: TextStyle(color: statusColor, fontSize: 11.sp, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Icons.shopping_bag_outlined, size: 14.sp, color: const Color(0xFF94A3B8)),
                SizedBox(width: 4.w),
                Text(order['itemsCount'], style: TextStyle(fontSize: 12.sp, color: const Color(0xFF94A3B8))),
              ],
            ),
            SizedBox(height: 10.h),
            const Divider(height: 1, color: Color(0xFFF1F5F9)),
            SizedBox(height: 10.h),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => AppNavigation.pushNamed(context, RoutesName.detailsPage),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF2563EB)),
                      padding: EdgeInsets.symmetric(vertical: 9.h),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                    ),
                    child: Text('View Details', style: TextStyle(color: const Color(0xFF2563EB), fontSize: 13.sp, fontWeight: FontWeight.w600)),
                  ),
                ),
                if (canReorder) ...[
                  SizedBox(width: 10.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => AppNavigation.pushNamed(context, RoutesName.cart),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2563EB),
                        padding: EdgeInsets.symmetric(vertical: 9.h),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                      ),
                      child: Text('Reorder', style: TextStyle(color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}