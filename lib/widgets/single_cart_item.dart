import 'package:apna_kiryana/constants/constants.dart';
import 'package:apna_kiryana/models/product_model.dart';
import 'package:apna_kiryana/provider/app_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleCartItem extends StatefulWidget {
  final ProductModel singleProduct;
  const SingleCartItem({super.key, required this.singleProduct});

  @override
  State<SingleCartItem> createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  var qty = 1;
  @override
  void initState() {
    qty = widget.singleProduct.qty??1;
    setState(() {
      
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red, width: 3),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 155,
              color: Colors.red.withOpacity(.5),
              child: Image.network(
                widget.singleProduct.image,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 155,
              // color: Colors.red.withOpacity(.5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(
                                widget.singleProduct.name,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  CupertinoButton(
                                    child: const Padding(
                                      padding: EdgeInsets.zero,
                                      child: CircleAvatar(
                                        maxRadius: 13,
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
                                  Text(
                                    qty.toString(),
                                    style: const TextStyle(
                                        fontSize: 22, fontWeight: FontWeight.bold),
                                  ),
                                  CupertinoButton(
                                    child: const Padding(
                                      padding: EdgeInsets.zero,
                                      child: CircleAvatar(
                                        maxRadius: 13,
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
                              Row(
                            
                                children: [
                                  CupertinoButton(
                                    onPressed: () {},
                                    padding: EdgeInsets.zero,
                                    child: const Text(
                                      "Add to Favourites ",
                                      style: TextStyle(
                                          fontSize: 12, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                 
                                
                                ],
                              ),
                              
                              
                            ],
                          ),
                          Text(
                            "\$ ${widget.singleProduct.price.toString()} ",
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                      CupertinoButton(child: const CircleAvatar(maxRadius: 13,
                                child: Icon(Icons.delete)), onPressed: (){
                                  AppProvider appProvider =  Provider.of<AppProvider>(context,listen: false );
                      appProvider.removeCartProduct(widget.singleProduct);
                      showMessage("Removed from Cart");
                                }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
