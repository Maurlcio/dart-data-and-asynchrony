class Customer {
  int id;
  String name;

  Customer({
    required this.id, 
    required this.name
    });

  //slightly improved fromJson() function from task 0
  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class Order {
  int orderId;
  double total;
  Customer customer;

  Order({
    required this.orderId,
    required this.customer,
    required this.total,
  });

  //improved fromJson() function from task 0 (again)
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['orderId'],
      customer: Customer.fromJson(json['customer']),
      total: json['total'].toDouble(),
    );  
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'customer': customer.toJson(),
      'total': total,
    };
  }
}
