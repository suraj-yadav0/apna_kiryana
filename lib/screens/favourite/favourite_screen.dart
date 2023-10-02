
import 'package:apna_kiryana/provider/app_provider.dart';
import 'package:apna_kiryana/widgets/single_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  @override
  Widget build(BuildContext context) {

       AppProvider appProvider =  Provider.of<AppProvider>(context );
    return  Scaffold(
       appBar: AppBar(
        title: const Text("Favourite List"),
      ),
      body: appProvider.getFavouriteProductList.isEmpty ? const Center(child: Text("Empty!",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),) :
       ListView.builder(
          itemCount: appProvider.getFavouriteProductList.length,
          padding: const EdgeInsets.all(12),
          itemBuilder: (ctx, index) {
            return   SingleCartItem(singleProduct: appProvider.getFavouriteProductList[index]);
          }),
    );
  }
}