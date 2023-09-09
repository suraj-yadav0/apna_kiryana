
import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  final String title, subtitle;
  const TopTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(
            height: kToolbarHeight + 12,
          ),
          if(title == "Login" || title == "SignUp") GestureDetector(onTap: (){
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios),) ,const SizedBox(height: 12,),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 12,
          )
        ],
      );
 
  }
}
