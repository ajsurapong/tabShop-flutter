import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tab_shopping/controllers/productController.dart';

class TabProduct extends StatelessWidget {
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productController.productList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset(
              'assets/images/${productController.productList[index].name.toLowerCase()}.png'),
          title: Text(productController.productList[index].name),
          subtitle: Text('${productController.productList[index].price} baht'),
          trailing: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // add product to cart
              Get.snackbar(
                  'Adding product', productController.productList[index].name,
                  duration: Duration(seconds: 1));
              productController.addToCart(index);
            },
          ),
        );
      },
    );
  }
}
