// ignore_for_file: camel_case_types

import 'package:shoe_ecommerce_app/cartpage.dart';
import 'package:shoe_ecommerce_app/controllers/mainscreen_providers.dart';
import 'package:shoe_ecommerce_app/favouratepage.dart';
import 'package:shoe_ecommerce_app/homepage.dart';
import 'package:shoe_ecommerce_app/profilepage.dart';
import 'package:shoe_ecommerce_app/searchpage.dart';
import 'package:shoe_ecommerce_app/views/shared/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<Widget> pageList = [
    const homePage(),
    const searchpage(),
    const Favourates(
      cross: false,
    ),
    cartPage(
      value: 0,
    ),
    const profilePage()
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
        // setting up the provider for the state mangement process
        builder: (context, mainScreenNotifier, child) {
      // mainScreenNotifier is the object
      return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
        body: pageList[mainScreenNotifier.pageIndex], // getting the variable
        bottomNavigationBar: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            // container take the size of its children
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageset =
                        0; // setting the variable of the notifier hence automatically the notify listeners will get called
                  },
                  icon: mainScreenNotifier.pageIndex == 0
                      ? Icons.home
                      : Icons.home_outlined,
                ),
                BottomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageset = 1;
                  },
                  icon: mainScreenNotifier.pageIndex != 1
                      ? Icons.manage_search_outlined
                      : Icons.search,
                ),
                BottomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageset = 2;
                  },
                  icon: mainScreenNotifier.pageIndex == 2
                      ? Ionicons.heart
                      : Icons.favorite_outline,
                ),
                BottomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageset = 3;
                  },
                  icon: mainScreenNotifier.pageIndex == 3
                      ? Icons.shopping_cart
                      : Icons.shopping_cart_outlined,
                ),
                BottomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageset = 4;
                  },
                  icon: mainScreenNotifier.pageIndex == 4
                      ? Icons.person_2
                      : Icons.person_2_outlined,
                ),
              ],
            ),
          ),
        )),
      );
    });
  }
}
