import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/product.dart';
import '../widgets/banner.dart';
import '../controllers/shopping_controller.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ShoppingController shoppingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [const CustomBanner(50), customAppBar()],
            ),
            // DONE
            // aquí debemos rodear el widget Expanded en un Obx para
            // observar los cambios en la lista de entries del shoppingController
            Obx(
              () => Expanded(
                child: ListView.builder(
                  itemCount: shoppingController.entries.length,
                  itemBuilder: (context, index) {
                    return _row(shoppingController.entries[index], index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xff9c0730),
              size: 40,
            ),
          ),
        )
      ],
    );
  }

  Widget _row(Product product, int index) {
    return _card(product);
  }

  Widget _card(Product product) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      elevation: 8,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Image.network(
              product.urlImage,
              height: 140,
            ),
            Text(product.name,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                )),
            Text('US\$ ${product.price}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Buy now! ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900],
                    )),
                IconButton(
                    onPressed: () {
                      // DONE
                      // aquí debemos llamar al método del controlador que
                      // incrementa el número de unidades del producto
                      // pasandole el product.id
                      shoppingController.agregarProducto(product.id);
                    },
                    icon: Icon(
                      Icons.add_circle,
                      size: 36,
                      color: Colors.green[900],
                    )),
                Text('${product.quantity}',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    )),
                IconButton(
                    onPressed: () {
                      // DONE
                      // aquí debemos llamar al método del controlador que
                      // disminuye el número de unidades del producto
                      // pasandole el product.id
                      shoppingController.quitarProducto(product.id);
                    },
                    icon: const Icon(
                      Icons.remove_circle,
                      size: 36,
                      color: Color(0xff9c0730),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
