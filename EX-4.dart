enum OrderType { pickup, delivery }

class Shop {
  final String shopName;
  final String shopAddress;

  Shop({required this.shopAddress, required this.shopName});
}

class Product {
  final String productName;
  final double productPrice;

  Product({required this.productName, required this.productPrice});
}

class Customer {
  final String customerName;
  final String? customerEmail;
  final String? address;

  Customer({this.customerEmail, required this.customerName, this.address});
}

class OrderItem {
  final Product product;
  final int quantity;

  OrderItem({required this.product, required this.quantity});

  double totalPerItem() => product.productPrice * quantity;
}

class Order {
  final Customer customer;
  final OrderType type;
  final List<OrderItem> items;
  final Shop? shop;
  final String? address; //optional address (office, friend's home)

  Order({
    required this.customer,
    required this.type,
    required this.items,
    required this.shop,
    this.address,
  });

  double totalAmount() {
    double totalAmount = 0;
    for (var item in items) {
      totalAmount += item.totalPerItem();
    }
    return totalAmount;
  }

  @override
  String toString() {
    String deliveryInfo;
    if (type == OrderType.delivery) {
      if (customer.address == null) {
        deliveryInfo = 'Delivered to: $address';
      } else {
        deliveryInfo = 'Delivered to: ${customer.address}';
      }
    } else {
      if (shop?.shopName == null && shop?.shopAddress == null) {
        deliveryInfo = 'Pick up at: N/A, N/A';
      } else {
        deliveryInfo =
            'Product to be pickd up at: ${shop?.shopName}, ${shop?.shopAddress}';
      }
    }
    return '''
    Customer: ${customer.customerName}
    Order type: ${type.name}
    $deliveryInfo
    Total: \$${totalAmount().toStringAsFixed(2)}
    ''';
  }
}

void main() {
  // Create a shop
  var shop = Shop(
    shopName: 'Daily Beans Café',
    shopAddress: '123 Coffee Street',
  );

  // Create some products
  var coffee = Product(productName: 'Latte', productPrice: 3.5);
  var croissant = Product(productName: 'Croissant', productPrice: 2.0);

  // Create a customer
  var customer = Customer(
    customerName: 'Alice',
    customerEmail: 'alice@example.com',
    address: '45 Maple Avenue',
  );

  // Create order items
  var item1 = OrderItem(product: coffee, quantity: 2);
  var item2 = OrderItem(product: croissant, quantity: 3);

  // Create an order (delivery)
  var deliveryOrder = Order(
    customer: customer,
    type: OrderType.delivery,
    items: [item1, item2],
    shop: shop,
  );

  // Create another order (pickup)
  var pickupOrder = Order(
    customer: customer,
    type: OrderType.pickup,
    items: [item1],
    shop: shop,
  );

  print('--- Delivery Order ---');
  print(deliveryOrder);

  print('\n--- Pickup Order ---');
  print(pickupOrder);
}
