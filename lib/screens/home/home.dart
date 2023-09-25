import 'package:apna_kiryana/constants/routes.dart';
import 'package:apna_kiryana/firebase_helper/firebase_firestore_heper.dart';
import 'package:apna_kiryana/models/category_model.dart';
import 'package:apna_kiryana/models/product_model.dart';
import 'package:apna_kiryana/screens/category_view/category_view.dart';
import 'package:apna_kiryana/screens/product_details/product_details.dart';

import 'package:apna_kiryana/widgets/TopTitle/top_title.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoriesList = [];
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
    categoriesList = await FirebaseFireStoreHelper.instance.getCategories();
    bestProductsList = await FirebaseFireStoreHelper.instance.getBestProducts();
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
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const TopTitle(title: "Apni Dukan", subtitle: ""),
                        TextFormField(
                          decoration: const InputDecoration(hintText: "Search"),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Categories",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  categoriesList.isEmpty
                      ? const Center(
                          child: Text("The Category List is Empty."),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: categoriesList
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        Routes.instance.push(
                                            widget:
                                                CategoryView(categoryModel: e),
                                            context: context);
                                      },
                                      child: Card(
                                        color: Colors.white,
                                        elevation: 12,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Image.network(e.image),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),

                  // const SizedBox(
                  //   height: 10,
                  // ),

                  const Padding(
                    padding: EdgeInsets.only(top: 12, left: 12),
                    child: Text(
                      "Top Selling",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                                      borderRadius: BorderRadius.circular(10)),
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
                                                  singleProduct: singleProduct),
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
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
    );
  }
}

// List<String> categoriesList = [
//   "https://img.favpng.com/19/12/7/clip-art-portable-network-graphics-grocery-store-transparency-vector-graphics-png-favpng-EQQvh35BHC3gQsbHTJdnM8LGa.jpg",
//   "https://media.istockphoto.com/id/1339317246/vector/clothes-hanging-on-rack-garment-rail-with-casual-women-clothing-fashion-girl-wardrobe-female.jpg?s=612x612&w=0&k=20&c=c1WpTkm4Guhhc_XH5Lau3DK9ruG6anMutc1is34d81o=",
//   "https://img.freepik.com/free-vector/wireless-technology-devices-isometric-icons-set_1284-15264.jpg",
//   "https://www.clipartmax.com/png/middle/174-1744809_soft-drinks-vector-png.png",
//   "https://cdn1.vectorstock.com/i/1000x1000/57/40/set-of-cosmetics-products-for-makeup-vector-5395740.jpg",
// ];

// List<ProductModel> bestProducts = [
//   ProductModel(
//       image:
//           "https://www.pngplay.com/wp-content/uploads/12/Smartphone-PNG-Free-File-Download.png",
//       id: "1",
//       name: "Mobile Phone",
//       price: "9999",
//       description: "A made In India Smarphone",
//       status: "OnSale",
//       isFavourite: true),
//   ProductModel(
//       image:
//           "https://www.shryoan.com/cdn/shop/files/EYE_CATAGORY_ICON_26ca83f8-3fc1-4758-b9db-5b136264edf2.png?v=1663133786",
//       id: "2",
//       name: "Cosmetics",
//       price: "500",
//       description: "Chemicals to temporarily beautify You.",
//       status: "Pending",
//       isFavourite: false),
//   ProductModel(
//       image:
//           "https://www.bigbasket.com/media/uploads/p/xxl/40305323_1-optimum-nutrition-gold-standard-100-whey-protein-powder-double-rich-chocolate.jpg",
//       id: "3",
//       name: "Protien Powder",
//       price: "100",
//       description: "A made In India Protien Powder For Extra Muscle Growth",
//       status: "OnSale",
//       isFavourite: true),
//   ProductModel(
//       image:
//           "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1652455605-Men_s_Wool_Runners_-_Natural_Grey__Light_Grey_Sole__-_imageAngle.png?crop=1xw:1xh;center,top&resize=980:*",
//       id: "4",
//       name: "Men's Shoes",
//       price: "650",
//       description: "A made In India casual shoes, for comfortable feets.",
//       status: "OnSale",
//       isFavourite: true),
//   ProductModel(
//       image:
//           "https://www.bigbasket.com/media/uploads/p/xxl/40305323_1-optimum-nutrition-gold-standard-100-whey-protein-powder-double-rich-chocolate.jpg",
//       id: "5",
//       name: "Protien Powder",
//       price: "100",
//       description: "A made In India Protien Powder For Extra Muscle Growth",
//       status: "OnSale",
//       isFavourite: true),
//   ProductModel(
//       image:
//           "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1652455605-Men_s_Wool_Runners_-_Natural_Grey__Light_Grey_Sole__-_imageAngle.png?crop=1xw:1xh;center,top&resize=980:*",
//       id: "6",
//       name: "Men's Shoes",
//       price: "650",
//       description: "A made In India casual shoes, for comfortable feets.",
//       status: "OnSale",
//       isFavourite: true),
// ];
