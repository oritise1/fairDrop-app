import 'package:flutter/material.dart';
import '../theme/brand_theme.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("My Orders"),
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          labelColor: FairDropColors.primaryOrange,
          unselectedLabelColor: Colors.grey,
          indicatorColor: FairDropColors.primaryOrange,
          tabs: const [
            Tab(text: "Active"),
            Tab(text: "History"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildActiveOrders(),
          _buildOrderHistory(),
        ],
      ),
    );
  }

  Widget _buildActiveOrders() {
    // Example of an active order
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildOrderCard(
          vendorName: "Mama Put's Kitchen",
          items: "1x Special Amala & Ewedu, 2x Beef",
          price: "₦2,100",
          status: "Arriving in 12 mins",
          isActive: true,
        ),
      ],
    );
  }

  Widget _buildOrderHistory() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildOrderCard(
          vendorName: "Gateway Grills",
          items: "1x Smokey Jollof Rice, 1x Chicken",
          price: "₦3,500",
          status: "Delivered • Oct 24",
          isActive: false,
        ),
        _buildOrderCard(
          vendorName: "Iya Basira",
          items: "2x Pounded Yam, 1x Egusi Soup",
          price: "₦4,200",
          status: "Delivered • Oct 20",
          isActive: false,
        ),
      ],
    );
  }

  Widget _buildOrderCard({
    required String vendorName,
    required String items,
    required String price,
    required String status,
    required bool isActive,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vendorName,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                price,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            items,
            style: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    isActive ? Icons.pedal_bike_rounded : Icons.check_circle_outline_rounded,
                    size: 18,
                    color: isActive ? FairDropColors.primaryOrange : FairDropColors.secondaryGreen,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    status,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: isActive ? FairDropColors.primaryOrange : FairDropColors.secondaryGreen,
                    ),
                  ),
                ],
              ),
              if (!isActive)
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    foregroundColor: FairDropColors.primaryOrange,
                  ),
                  child: const Text("Reorder"),
                ),
            ],
          ),
        ],
      ),
    );
  }
}