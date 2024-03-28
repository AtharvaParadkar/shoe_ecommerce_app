// ignore_for_file: camel_case_types

import 'package:shoe_ecommerce_app/views/shared/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class successfull extends StatefulWidget {
  const successfull({super.key});

  @override
  State<successfull> createState() => _successfullState();
}

class _successfullState extends State<successfull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.black,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.grey.shade100, // Navigation bar
          statusBarColor: Colors.grey.shade100, // Status bar
        ),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset("images/Checkmark.png"),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Paid Successfully ",
                    style: appstyle(35, Colors.black, FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
