import 'package:apna_kiryana/provider/app_provider.dart';
import 'package:apna_kiryana/widgets/single_cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScren extends StatefulWidget {
  const CartScren({super.key});

  @override
  State<CartScren> createState() => _CartScrenState();
}

class _CartScrenState extends State<CartScren> {
  
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider =  Provider.of<AppProvider>(context );
    return Scaffold(
      appBar: AppBar(
        title: const Text("The Cart"),
      ),
      body: appProvider.getCartProductList.isEmpty ? const Center(child: Text("Empty!",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),) :
       ListView.builder(
          itemCount: appProvider.getCartProductList.length,
          padding: const EdgeInsets.all(12),
          itemBuilder: (ctx, index) {
            return   SingleCartItem(singleProduct: appProvider.getCartProductList[index]);
          }),
    );
  }
}
