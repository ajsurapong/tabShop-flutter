import 'package:tab_shopping/models/product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  // List of products in shop, static
  var productList = <Product>[];
  // List of products in cart, dynamic
  var cartList = <Product>[].obs;
  var totalPrice = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    // if no products
    if (productList.isEmpty) {
      productList.add(Product(name: 'Shirt', price: 220));
      productList.add(Product(name: 'Shoe', price: 550));
    }
  }

  // method to add product to cart
  void addToCart(int index) {
    // is the cart empty?
    if (cartList.isEmpty) {
      cartList.add(productList[index]);
      cartList[0].amount = 1;
      totalPrice.value += cartList[0].price;
      return;
    }

    // the product exists in cart or not?
    int i = 0;
    for (i = 0; i < cartList.length; i++) {
      if (cartList[i].name == productList[index].name) {
        // product exists in cart
        cartList[i].amount++;
        totalPrice.value += cartList[i].price;
        break;
      }
    }

    if (i == cartList.length) {
      //product does not exist in cart
      cartList.add(productList[index]);
      cartList.last.amount = 1;
      totalPrice.value += cartList.last.price;
    }
  }

  // delete a unit of product from cart
  void deleteProduct(int index) {
    // TODO: decrease the total price
    // cartList[index].amount--;

    //amount > 1 ?
    if (cartList[index].amount > 1) {
      var product = cartList[index];
      product.amount--;
      cartList[index] = product;
    } else {
      cartList.removeAt(index);
    }
  }
}
