import 'package:apna_kiryana/constants/routes.dart';
import 'package:apna_kiryana/firebase_helper/firebase_firestore_heper.dart';
import 'package:apna_kiryana/models/category_model.dart';

import 'package:apna_kiryana/models/product_model.dart';
import 'package:apna_kiryana/screens/product_details/product_details.dart';


import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;
  const CategoryView({
    super.key,
    required this.categoryModel,
  });

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<ProductModel> bestProductsList = [];

  bool isLoading = false;

  @override
  void initState() {
    getCategoriesList();

    super.initState();
  }

  void getCategoriesList() async {
    setState(() {
      isLoading = true;
    });

    bestProductsList = await FirebaseFireStoreHelper.instance
        .getCategoryView(widget.categoryModel.id);
    bestProductsList.shuffle();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? Center(
                child: Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: kToolbarHeight ,),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const BackButton(),
                         Text(widget.categoryModel.name,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                    bestProductsList.isEmpty
                        ? const Center(
                            child: Text("The Product List is Empty"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: GridView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: bestProductsList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 20,
                                        crossAxisSpacing: 20,
                                        childAspectRatio: .7,
                                        crossAxisCount: 2),
                                itemBuilder: (context, index) {
                                  ProductModel singleProduct =
                                      bestProductsList[index];
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.red.withOpacity(.2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      children: [
                                        Image.network(
                                          singleProduct.image,
                                          height: 100,
                                          width: 100,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          singleProduct.name,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Price: \$${singleProduct.price}",
                                          style: const TextStyle(fontSize: 10),
                                        ),
                                        // Text("About: ${singleProduct.description}",style: const TextStyle(fontSize: 5)),
                                        OutlinedButton(
                                          onPressed: () {
                                            Routes.instance.push(
                                                widget: ProductDetails(
                                                    singleProduct:
                                                        singleProduct),
                                                context: context);
                                          },
                                          child: const Text(
                                            "Buy Now",
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                  ],
                ),
              ));
  }
}
