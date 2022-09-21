import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../domain/product.dart';

class ShoppingController extends GetxController {
  // lista de productos
  var entries = <Product>[].obs;
  // el valor total de la compra
  var total = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // los elementos que vamos a tener en la tienda
    entries.add(Product(0, "Iphone 12", 899));
    entries.add(Product(1, "Redmi Note 11", 189));
    entries.add(Product(2, "Galaxy A53", 329));
    entries.add(Product(3, "Mi Band 6", 35));
    entries.add(Product(4, "HP Ventus", 1039));
  }

  void calcularTotal() {
    int newTotal = 0;
    // Done
    // calcular el valor total de los elementos en el carro de compras
    for (var product in entries) {
      newTotal += product.price * product.quantity;
    }
    total.value = newTotal;
  }

  agregarProducto(id) {
    logInfo('agregarProducto $id');
    // Done
    // Encontrar el elemento usando el id, revisar el método firstWhere de la lista
    // después obtener el index de ese elemento, revisar el método indexOf de la lista
    // después hacer el incremento en la cantidad
    // finalmente actualizar entries usando el indice y el elemento actualizado
    Product foundProduct = entries.firstWhere((prod) => prod.id == id);
    int productIndex = entries.indexOf(foundProduct);
    entries[productIndex].quantity++;

    calcularTotal();
  }

  quitarProducto(id) {
    logInfo('quitarProducto $id');
    // Done
    // similar a agregarProducto
    // validar cuando la cantidad es igual a cero
    Product foundProduct = entries.firstWhere((prod) => prod.id == id);
    int productIndex = entries.indexOf(foundProduct);
    if (entries[productIndex].quantity != 0) {
      entries[productIndex].quantity--;
    }

    calcularTotal();
  }
}
