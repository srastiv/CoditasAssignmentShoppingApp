import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/constants/colors.dart';

import '../constants/texts_constants.dart';
import '../screens/orders.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color.fromARGB(255, 216, 235, 187), kFluorescentGreen],
              ),
            ),
            child: CircleAvatar(
              backgroundColor: kWhite,
              child: Icon(
                Icons.shopping_bag,
                color: kFluorescentGreen,
                size: 85,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: kShopping,
            onTap: () {},
          ),
          const Divider(
            color: kBlack,
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: kCart,
            onTap: () {},
          ),
          const Divider(
            color: kBlack,
          ),
          ListTile(
            leading: const Icon(Icons.timer),
            title: kOrders,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Orders(),
                ),
              );
            },
          ),
          const Divider(
            color: kBlack,
          ),
        ],
      ),
    );
  }
}
