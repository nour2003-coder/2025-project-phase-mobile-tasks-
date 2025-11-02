import 'dart:ffi';

class Product {
  String? name;
  double? price;
  String? description;
  String? imageUrl;
  Product(String name, double price, String description, String imageUrl) {
    this.name = name;
    this.price = price;
    this.description = description;
    this.imageUrl = imageUrl;
  }
}

class mangeproducts {
  Map<Product, bool> products = {};
  void addProduct(Product product, bool isAvailable) {
    products.addAll({product: isAvailable});
  }

  void removeProduct(Product product) {
    products.remove(product);
  }

  List<Product> getProducts() {
    return products.keys.toList();
  }

  List<Product> getAvailableProducts() {
    return products.entries
        .where((entry) => entry.value == true)
        .map((entry) => entry.key)
        .toList();
  }

  List<Product> getUnavailableProducts() {
    return products.entries
        .where((entry) => entry.value == false)
        .map((entry) => entry.key)
        .toList();
  }

  void updatename(Product product, String newName) {
    if (products.containsKey(product)) {
      product.name = newName;
    }
  }

  void updateprice(Product product, double newPrice) {
    if (products.containsKey(product)) {
      product.price = newPrice;
    }
  }

  void updatedescription(Product product, String newDescription) {
    if (products.containsKey(product)) {
      product.description = newDescription;
    }
  }

  void updateimageUrl(Product product, String newImageUrl) {
    if (products.containsKey(product)) {
      product.imageUrl = newImageUrl;
    }
  }
}

void main() {
  mangeproducts manager = mangeproducts();

  Product product1 = Product(
    "Laptop",
    999.99,
    "A high-performance laptop",
    "http://imageurl.com/laptop",
  );
  Product product2 = Product(
    "Smartphone",
    499.99,
    "A latest model smartphone",
    "http://imageurl.com/smartphone",
  );

  manager.addProduct(product1, true);
  manager.addProduct(product2, false);

  print("All Products:");
  for (var product in manager.getProducts()) {
    print("${product.name} - \$${product.price}");
  }

  print("\nAvailable Products:");
  for (var product in manager.getAvailableProducts()) {
    print("${product.name} - \$${product.price}");
  }

  manager.updatename(product1, "Gaming Laptop");
  manager.updateprice(product2, 450.00);

  print("\nUpdated Products:");
  for (var product in manager.getProducts()) {
    print("${product.name} - \$${product.price}");
  }
}
