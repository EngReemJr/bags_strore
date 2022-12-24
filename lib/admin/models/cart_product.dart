import 'dart:convert';
import 'dart:ui';

class CartProduct {
  String? id;

  String name;
  String price;
  String imageUrl;
  int count;
  String? size;
  Color? color;
  CartProduct({
    this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.count,
    this.size,
  });

  CartProduct copyWith({
    String? id,
    String? name,
    String? price,
    String? imageUrl,
    int? count,
    String? size,
  }) {
    return CartProduct(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      count: count ?? this.count,
      size: size ?? this.size,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'count': count,
      'size': size,
    };
  }

  factory CartProduct.fromMap(Map<String, dynamic> map) {
    return CartProduct(
      id: map['id'],
      name: map['name'] ?? '',
      price: map['price'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      count: map['count']?.toInt() ?? 0,
      size: map['size'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CartProduct.fromJson(String source) =>
      CartProduct.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CartProduct(id: $id, name: $name, price: $price, imageUrl: $imageUrl, count: $count, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartProduct &&
        other.id == id &&
        other.name == name &&
        other.price == price &&
        other.imageUrl == imageUrl &&
        other.count == count &&
        other.size == size;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        price.hashCode ^
        imageUrl.hashCode ^
        count.hashCode ^
        size.hashCode;
  }
}
