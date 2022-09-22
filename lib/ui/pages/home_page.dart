import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/banner.dart';
import '../widgets/cart_total.dart';
import 'product_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              buildProfileImage(),
              customAppBar(),
              const Center(
                child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'TECH STORE',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 9, 72, 167)),
                      textAlign: TextAlign.center,
                    )),
              ),
            ],
          ),
          const SizedBox(height: 60),
          const Text(
            "Carlos Pérez",
            style: TextStyle(
              fontSize: 28,
              color: Color(0xff9c0730),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Valledupar, Colombia",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 60),
          CartTotal(),
        ],
      ),
    );
  }

  Widget buildProfileImage() {
    return Stack(
      alignment: Alignment.center,
      children: const [
        CustomBanner(250),
        CircleAvatar(
          backgroundImage: NetworkImage(
            "https://randomuser.me/api/portraits/men/97.jpg",
          ),
          radius: 80,
        ),
      ],
    );
  }

  Widget customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Get.to(() => const ProductList(),
                transition: Transition.circularReveal,
                duration: const Duration(milliseconds: 300)),
            child: const Icon(
              Icons.shopping_cart,
              size: 40,
              color: Color(0xff9c0730),
            ),
          ),
        )
      ],
    );
  }
}
