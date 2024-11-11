class ProductModel {
  String? responseCode;
  String? message;
  String? status;
  List<Product>? product;

  ProductModel({this.responseCode, this.message, this.status, this.product});

  ProductModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    message = json['message'];
    status = json['status'];
    if (json['Product'] != null) {
      product = <Product>[];
      json['Product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_code'] = this.responseCode;
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.product != null) {
      data['Product'] = this.product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  String? id;
  String? name;
  String? image;
  String? price;
  String? quantity;
  String? description;

  Product(
      {this.id,
        this.name,
        this.image,
        this.price,
        this.quantity,
        this.description});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    image = json['Image'];
    price = json['Price'];
    quantity = json['Quantity'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['Image'] = this.image;
    data['Price'] = this.price;
    data['Quantity'] = this.quantity;
    data['Description'] = this.description;
    return data;
  }
}
