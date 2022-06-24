class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imageUrl;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.imageUrl,
  });
}

final products = [
  Item(
    id: "001",
    name: "iPhone 1`",
    desc: "descr",
    price: 999,
    color: "#33505a",
    imageUrl:
        "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone11-green-select-2019_GEO_EMEA?wid=834&hei=1000&fmt=jpeg&qlt=95&.v=1567021766404",
  ),
  Item(
    id: "002",
    name: "iPhone 12",
    desc: "descr",
    price: 1399,
    color: "#33505a",
    imageUrl:
        "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-red-select-2020?wid=940&hei=1112&fmt=png-alpha&.v=1604343703000",
  ),
  Item(
    id: "003",
    name: "iPhone 13",
    desc: "descr",
    price: 1599,
    color: "#33505a",
    imageUrl:
        "https://img.kingpowerclick.com/cdn-cgi/image/format=auto/kingpower-com/image/upload/w_640,h_640/v1633576545/prod/8313327-L1.jpg",
  ),
];
