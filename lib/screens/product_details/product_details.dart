import 'package:apna_kiryana/constants/constants.dart';
import 'package:apna_kiryana/constants/routes.dart';
import 'package:apna_kiryana/models/product_model.dart';
import 'package:apna_kiryana/provider/app_provider.dart';
import 'package:apna_kiryana/screens/cart_screen/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel singleProduct;
  const ProductDetails({super.key, required this.singleProduct});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  var qty = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Routes.instance.push(widget: const CartScren(), context: context);
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Image.network(
                widget.singleProduct.image,
                height: 225,
                width: 225,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.singleProduct.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.singleProduct.isFavourite =
                            !widget.singleProduct.isFavourite;
                      });
                    },
                    icon: Icon(widget.singleProduct.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border),
                  ),
                ],
              ),
              Text(widget.singleProduct.description),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  CupertinoButton(
                    child: const Padding(
                      padding: EdgeInsets.zero,
                      child: CircleAvatar(
                        child: Icon(Icons.remove),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (qty > 0) {
                          qty--;
                        }
                      });
                    },
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    qty.toString(),
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  CupertinoButton(
                    child: const Padding(
                      padding: EdgeInsets.zero,
                      child: CircleAvatar(
                        child: Icon(Icons.add),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        qty++;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
AppProvider appProvider =  Provider.of<AppProvider>(context,listen: false );
ProductModel productModel = widget.singleProduct.copyWith(qty: qty);
                      appProvider.addCartProduct(productModel);
                      showMessage("Added to Cart");
                    },
                    child: const Text("ADD TO CART"),
                  ),
                  const SizedBox(width: 24,),
                  SizedBox(height: 38,width: 140 ,child:  ElevatedButton(onPressed: (){},
                  child: const Text("BUY")),)
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
