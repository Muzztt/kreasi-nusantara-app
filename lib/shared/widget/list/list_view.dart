// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kreasi_nusantara/env.dart';
import 'package:kreasi_nusantara/shared/util/dio_interceptors/dio_interceptors.dart';
import 'package:kreasi_nusantara/shared/util/log/log.dart';

class QListView extends StatefulWidget {
  final String endpoint;
  final bool shrinkWrap;
  final Widget Function(List items)? itemsBuilder;
  final Widget Function(Map item, int)? itemBuilder;
  final Widget Function()? emptyBuilder;

  const QListView({
    super.key,
    required this.endpoint,
    this.itemsBuilder,
    this.itemBuilder,
    this.emptyBuilder,
    this.shrinkWrap = false,
  });

  @override
  State<QListView> createState() => _QListViewState();
}

class _QListViewState extends State<QListView> {
  bool loading = true;
  List items = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    loading = true;
    setState(() {});

    var response = await dio.get(
      widget.endpoint,
    );
    Map obj = response.data;
    items = obj["data"] ?? [];
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (widget.itemsBuilder != null) {
      return widget.itemsBuilder!(items);
    }

    if (widget.emptyBuilder != null && items.isEmpty) {
      return widget.emptyBuilder!();
    }

    return ListView.builder(
      itemCount: items.length,
      shrinkWrap: widget.shrinkWrap,
      physics: const ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          printo("--------------------");
          (items[index] as Map).forEach((key, value) {
            printo("$key: ${items[index][key]}");
          });

          printo("--------------------");
        }
        return widget.itemBuilder!(items[index], index);
      },
    );
  }
}

/*
//#TEMPLATE dio_list
QListView(
  endpoint: "articles",
  itemBuilder: (item, index) {
    // Your list item here
  }
),
//#END
*/