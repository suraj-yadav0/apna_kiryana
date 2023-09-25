import 'package:apna_kiryana/constants/constants.dart';
import 'package:apna_kiryana/models/category_model.dart';
import 'package:apna_kiryana/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFireStoreHelper {
  static FirebaseFireStoreHelper instance = FirebaseFireStoreHelper();
  FirebaseFirestore  _firebaseFireStore = FirebaseFirestore.instance;
  Future<List<CategoryModel>> getCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFireStore.collection("categories").get();

      List<CategoryModel> categoriesList = querySnapshot.docs
          .map((e) => CategoryModel.fromJson(e.data()))
          .toList();

      return categoriesList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }


  Future<List<ProductModel>> getBestProducts() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFireStore.collectionGroup("products").get();

      List<ProductModel> productModelList = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();

      return productModelList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }

  
  Future<List<ProductModel>> getCategoryView(String id) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFireStore.collection("categories").doc(id).collection("products").get();

      List<ProductModel> productModelList = querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();

      return productModelList;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }
}
