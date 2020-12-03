class SectionItem{

  SectionItem.fromMap(Map<String, dynamic> map){
    image = map['image'] as String;
    product = map['product'] as String;
  }

  SectionItem({this.image, this.product});

  @override
  String toString() {
    return 'SectionItem{image: $image, product: $product}';
  }

  dynamic image;
  String product;

  SectionItem clone(){
    return SectionItem(
      image: image,
      product: product
    );
  }
}