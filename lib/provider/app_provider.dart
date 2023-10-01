import 'package:apna_kiryana/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class AppProvider with ChangeNotifier {

  //cart work
  final List<ProductModel> _cartProductList = [];

  void addCartProduct(ProductModel productModel) {
    _cartProductList.add(productModel);
    notifyListeners(); 
  }

  void removeCartProduct(ProductModel productModel) {
    _cartProductList.remove(productModel);
    notifyListeners(); 
  }

  List<ProductModel> get getCartProductList =>  _cartProductList;

  // favourite section code

final  List<ProductModel> _favouriteProductList = [];

  void addFavouriteProduct(ProductModel productModel) {
   _favouriteProductList.add(productModel);
    notifyListeners(); 
  }

  void removeFavouriteProduct(ProductModel productModel) {
    _favouriteProductList.remove(productModel);
    notifyListeners(); 
  }

  List<ProductModel> get getFavouriteProductList =>  _favouriteProductList;
}