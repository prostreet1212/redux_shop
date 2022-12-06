class CoffeeMenu {
  final String image;
  final String name;
  final double price;
  final bool isBuy ;

  const CoffeeMenu({required this.image, required this.name, required this.price,required this.isBuy});

  CoffeeMenu copyWith({ String? image,  String? name,  double? price,  bool? isBuy}) {
    return CoffeeMenu(
      image: image ?? this.image,
      name: name ?? this.name,
      price: price ?? this.price,
      isBuy: isBuy ?? this.isBuy,
    );
  }

  @override
  int get hashCode =>
      image.hashCode ^ name.hashCode ^ price.hashCode ^ isBuy.hashCode;

  @override
   bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoffeeMenu &&
          runtimeType == other.runtimeType &&
          image == other.image &&
          name == other.name &&
          price == other.price &&
          isBuy == other.isBuy;
}
