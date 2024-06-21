import 'package:flutter/material.dart';

class CustomTabNavigation extends StatelessWidget {
  final List<String> headers;
  final List<Widget> children;

  const CustomTabNavigation({
    super.key,
    required this.headers,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: headers.length,
      child: Column(
        children: [
          TabBar(
            tabs: headers.map((header) => Tab(text: header)).toList(),
          ),
          SizedBox(
            height: 300, // Tinggi konten tab
            child: TabBarView(
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
