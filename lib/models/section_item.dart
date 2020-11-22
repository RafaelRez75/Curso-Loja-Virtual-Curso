class SectionItem{

  SectionItem.fromMap(Map<String, dynamic> map){
    image = map['image'] as String;
  }

  @override
  String toString() {
    return 'SectionItem{image: $image}';
  }

  String image;
}