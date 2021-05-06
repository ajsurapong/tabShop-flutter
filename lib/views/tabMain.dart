import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tab_shopping/controllers/productController.dart';
import 'package:tab_shopping/views/tabCart.dart';
import 'package:tab_shopping/views/tabProduct.dart';

class TabMain extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Shopping'),
        ),
        bottomNavigationBar: Container(
          color: Colors.blue,
          child: TabBar(tabs: [
            Tab(
              text: 'Product',
            ),
            Tab(
              text: 'Cart',
            ),
          ]),
        ),
        body: TabBarView(children: [
          TabProduct(),
          TabCart(),
        ]),
      ),
    );
  }
}
