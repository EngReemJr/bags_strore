import 'dart:convert';
import 'dart:ui';

class Product {
  String? id;
  String catId;
  String name;
  String description;
  String price;
  String imageUrl;
  int count;
  String? size;
  Color? color;
  Product({
    this.id,
    required this.catId,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.count,
    this.size,
    this.color,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'catId': catId,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'count': count,
      'size': size,
      'color': color?.value,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      catId: map['catId'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      count: map['count']?.toInt() ?? 0,
      size: map['size'],
      color: map['color'] != null ? Color(map['color']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  Product copyWith({
    String? id,
    String? catId,
    String? name,
    String? description,
    String? price,
    String? imageUrl,
    int? count,
    String? size,
    Color? color,
  }) {
    return Product(
      id: id ?? this.id,
      catId: catId ?? this.catId,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      count: count ?? this.count,
      size: size ?? this.size,
      color: color ?? this.color,
    );
  }

  @override
  String toString() {
    return 'Product(id: $id, catId: $catId, name: $name, description: $description, price: $price, imageUrl: $imageUrl, count: $count, size: $size, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Product &&
      other.id == id &&
      other.catId == catId &&
      other.name == name &&
      other.description == description &&
      other.price == price &&
      other.imageUrl == imageUrl &&
      other.count == count &&
      other.size == size &&
      other.color == color;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      catId.hashCode ^
      name.hashCode ^
      description.hashCode ^
      price.hashCode ^
      imageUrl.hashCode ^
      count.hashCode ^
      size.hashCode ^
      color.hashCode;
  }
}
/*
List<Product> products = [
  Product(
      id: '1',
      name: "Office Code",
      price: '234',
      size: '12',
      description: dummyText,
      imageUrl: "assets/images/bag_1.png",
      color: Color(0xFF3D82AE),
      catId: '1'),
  Product(
      id: '2',
      catId: '1',
      name: "Belt Bag",
      price: '234',
      size: '8',
      description: dummyText,
      imageUrl: "assets/images/bag_2.png",
      color: Color(0xFFD3A984)),
  Product(
      id: '3',
      catId: '1',
      name: "Hang Top",
      price: '234',
      size: '10',
      description: dummyText,
      imageUrl: "assets/images/bag_3.png",
      color: Color(0xFF989493)),
  Product(
      id: '4',
      name: "Old Fashion",
      catId: '1',
      price: '234',
      size: '11',
      description: dummyText,
      imageUrl: "assets/images/bag_4.png",
      color: Color(0xFFE6B398)),
  Product(
      id: '5',
      catId: '1',
      name: "Office Code",
      price: '234',
      size: '12',
      description: dummyText,
      imageUrl: "assets/images/bag_5.png",
      color: Color(0xFFFB7883)),
  Product(
    id: '6',
    catId: '1',
    name: "Office Code",
    price: '234',
    size: '12',
    description: dummyText,
    imageUrl: "assets/images/bag_6.png",
    color: Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
*/