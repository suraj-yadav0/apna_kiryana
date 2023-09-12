import 'package:apna_kiryana/widgets/TopTitle/top_title.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categoriesList
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.white,
                        elevation: 12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.network(e),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            
          ),
          const SizedBox(height: 10,),
           const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Top Selling",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> categoriesList = [
  "https://img.favpng.com/19/12/7/clip-art-portable-network-graphics-grocery-store-transparency-vector-graphics-png-favpng-EQQvh35BHC3gQsbHTJdnM8LGa.jpg", "https://media.istockphoto.com/id/1339317246/vector/clothes-hanging-on-rack-garment-rail-with-casual-women-clothing-fashion-girl-wardrobe-female.jpg?s=612x612&w=0&k=20&c=c1WpTkm4Guhhc_XH5Lau3DK9ruG6anMutc1is34d81o=",
  "https://img.freepik.com/free-vector/wireless-technology-devices-isometric-icons-set_1284-15264.jpg",
  "https://www.clipartmax.com/png/middle/174-1744809_soft-drinks-vector-png.png",
  "https://cdn1.vectorstock.com/i/1000x1000/57/40/set-of-cosmetics-products-for-makeup-vector-5395740.jpg",
 
];
