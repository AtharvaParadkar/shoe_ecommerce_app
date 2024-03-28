import 'package:cached_network_image/cached_network_image.dart';
import 'package:shoe_ecommerce_app/model/productcart.dart';
import 'package:shoe_ecommerce_app/views/productpage.dart';
import 'package:shoe_ecommerce_app/views/shared/appstyle.dart';
import 'package:flutter/material.dart';

class Staggeredtile extends StatefulWidget {
  const Staggeredtile({super.key, required this.shoes});

  final Sneakers shoes;

  @override
  State<Staggeredtile> createState() => _StaggeredtileState();
}

class _StaggeredtileState extends State<Staggeredtile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => productPage(
                      shoesize: widget.shoes.sizes,
                      id: widget.shoes.id,
                      category: widget.shoes.category)));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: widget.shoes.imageUrl[1].toString(),
              fit: BoxFit.fill,
            ),
            Container(
              padding: const EdgeInsets.only(top: 12),
              height: 75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.shoes.name,
                    style: appstyleHt(20, Colors.black, FontWeight.w700, 1),
                  ),
                  Text(
                    "\u{20B9}${widget.shoes.price}",
                    style: appstyleHt(16, Colors.black, FontWeight.w500, 1),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
