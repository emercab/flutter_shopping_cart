import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../controllers/shopping_controller.dart';

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);
  final ShoppingController shoppingController = Get.find();

  @override
  Widget build(BuildContext context) {
    // Método que da formato a los números
    String formatCurrency(double num) {
      final formatter = NumberFormat('###,###,###,###.##', 'es_CO');
      return formatter.format(num);
    }

    return Expanded(
      child: Center(
        //DONE
        // aquí debemos observar la variable total del shoppingController
        child: Obx(
          () => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total: ',
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.blue[900],
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'US\$ ${formatCurrency(double.parse(shoppingController.total.value.toString()))}',
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.green[900],
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                'Artículos comprados: ${shoppingController.numArticulos.value}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
