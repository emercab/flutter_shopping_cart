import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner(this.bannerHeight, {Key? key}) : super(key: key);
  final double bannerHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: bannerHeight,
      child: Image.network(
        "https://i.ibb.co/Qvx55df/Retail-Experience-Center-21-web.jpg",
        //"https://ogden_images.s3.amazonaws.com/www.miningjournal.net/images/2020/01/17194414/1-16-Comprenew-1-1100x733.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}
