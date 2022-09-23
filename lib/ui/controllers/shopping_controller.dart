import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../domain/product.dart';

class ShoppingController extends GetxController {
  // lista de productos
  var entries = <Product>[].obs;
  // el valor total de la compra
  var total = 0.obs;

  final numArticulos = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // los elementos que vamos a tener en la tienda
    entries.add(Product(0, "Iphone 12", 899,
        'https://hsi.com.co/wp-content/uploads/2022/03/Imagen-Apple-iPhone-12-64GB-Usado-A-negro.jpg'));
    entries.add(Product(1, "Redmi Note 11", 189,
        'https://i.linio.com/p/327764a3c2cae0d951c91647024ec859-product.webp'));
    entries.add(Product(2, "Galaxy A53", 329,
        'https://jumbocolombiaio.vtexassets.com/arquivos/ids/377473-800-800?v=637910794335800000&width=800&height=800&aspect=true'));
    entries.add(Product(3, "Mi Band 6", 35,
        'https://xiaomicolombia.vtexassets.com/arquivos/ids/155608-800-auto?v=637618949048100000&width=800&height=auto&aspect=true'));
    entries.add(Product(4, "HP Victus", 1039,
        'https://www.alkomprar.com/medias/196337885103-001-750Wx750H?context=bWFzdGVyfGltYWdlc3wxMjk3MTF8aW1hZ2UvanBlZ3xpbWFnZXMvaDkzL2g0NS8xMTc1MjAxNTcyNDU3NC5qcGd8M2Q2YWQwMTE3MmFhZDQyMTc5ZDA0ZTRiZTNjMzhhZGYwMWM0M2UwNzc5MTA1MjU1ZGFmZDY4MWE5ZjYyNTAxZQ'));
    entries.add(Product(5, "Motorola G60", 185,
        'https://tigocolombia.vteximg.com.br/arquivos/ids/160571-1000-1000/G60_SOFT-SILVER_1.png'));
    entries.add(Product(6, "Ipad Mini 7.9", 540,
        'https://falabella.scene7.com/is/image/FalabellaCO/3848786_1?wid=800&hei=800&qlt=70'));
    entries.add(Product(7, "Realme 9 Pro+", 443,
        'https://conectamos.shop/wp-content/uploads/2022/03/realme_9_pro__5g_8gb_256gb_negro_01_l.jpg'));
    entries.add(Product(8, "IdeaPad Gaming 3", 749,
        'https://m.media-amazon.com/images/I/71gQFbwlabL._AC_SY450_.jpg'));
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
    countProducts();
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
    countProducts();
  }

  void countProducts() {
    int num = 0;
    for (var product in entries) {
      num += product.quantity;
    }

    numArticulos.value = num;
  }
}
