import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tab_shopping/controllers/productController.dart';

class TabCart extends StatelessWidget {
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: productController.cartList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.asset(
                    'assets/images/${productController.cartList[index].name.toLowerCase()}.png'),
                title: Text(productController.cartList[index].name),
                subtitle: Text(
                    '${productController.cartList[index].price} baht x ${productController.cartList[index].amount} unit(s)'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // remove a unit of product
                    Get.snackbar(
                      'Removing product',
                      productController.cartList[index].name,
                      duration: Duration(seconds: 1),
                    );
                    productController.deleteProduct(index);
                  },
                ),
              );
            },
          ),
          SizedBox(
            height: 16,
          ),
          Text('Total price = ${productController.totalPrice} baht'),
        ],
      ),
    );
  }
}
