class Product {
  String? sId;
  String? name;
  String? title;
  String? category;
  List<String>? imageUrl;
  String? oldPrice;
  List<Sizes>? sizes;
  String? price;
  String? description;

  Product(
      {this.sId,
      this.name,
      this.title,
      this.category,
      this.imageUrl,
      this.oldPrice,
      this.sizes,
      this.price,
      this.description});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    title = json['title'];
    category = json['category'];
    imageUrl = json['imageUrl'].cast<String>();
    oldPrice = json['oldPrice'];
    if (json['sizes'] != null) {
      sizes = <Sizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(Sizes.fromJson(v));
      });
    }
    price = json['price'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    data['title'] = title;
    data['category'] = category;
    data['imageUrl'] = imageUrl;
    data['oldPrice'] = oldPrice;
    if (sizes != null) {
      data['sizes'] = sizes!.map((v) => v.toJson()).toList();
    }
    data['price'] = price;
    data['description'] = description;
    return data;
  }
}

class Sizes {
  String? size;
  bool? isSelected;
  String? sId;

  Sizes({this.size, this.isSelected, this.sId});

  Sizes.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    isSelected = json['isSelected'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['size'] = size;
    data['isSelected'] = isSelected;
    data['_id'] = sId;
    return data;
  }
}
