import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/history_controller.dart';
import '../widgets/product_item.dart';
import '../widgets/ticket_item.dart';

class HistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
      init:
          HistoryController(), // Tambahkan inisialisasi controller jika diperlukan
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Riwayat Pembelian',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
          ),
          body: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        'Produk',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Tiket',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _buildProductList(controller),
                      _buildTicketList(controller),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProductList(HistoryController controller) {
    final products = controller.products;
    if (products.isEmpty) {
      return Center(
        child: Text('No products available'),
      );
    }
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductItem(product: product);
      },
    );
  }

  Widget _buildTicketList(HistoryController controller) {
    final tickets = controller.tickets;
    if (tickets.isEmpty) {
      return Center(
        child: Text('No tickets available'),
      );
    }
    return ListView.builder(
      itemCount: tickets.length,
      itemBuilder: (context, index) {
        final ticket = tickets[index];
        return TicketItem(ticket: ticket);
      },
    );
  }
}
