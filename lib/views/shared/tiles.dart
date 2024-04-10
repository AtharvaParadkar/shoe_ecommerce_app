// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class TilesWidget extends StatelessWidget {
  final String title;
  final IconData leading;
  final Function()? OnTap;

  const TilesWidget({
    super.key,
    required this.title,
    required this.leading,
    this.OnTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: OnTap,
      leading: Icon(
        leading,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      
      trailing: title != "Orderss"
          ? const Icon(
              AntDesign.right,
              size: 16,
            )
          : Image.asset(
              "images/india.png",
              width: 15,
              height: 20,
            ),
    );
  }
}
