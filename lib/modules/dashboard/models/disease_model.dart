class DiseaseModel {
  static List<DiseaseItem>? diseaseItems;
}

class DiseaseItem {
  final String? id;
  final String? name;
  final String? image;
  final String? signsofDamage;
  final String? howToPrevent;
  final String? treatment;

  DiseaseItem({
    this.id,
    this.name,
    this.signsofDamage,
    this.howToPrevent,
    this.treatment,
    this.image,
  });

  factory DiseaseItem.fromMap(Map<String, dynamic> map) {
    return DiseaseItem(
      id: map['id'],
      name: map['name'],
      signsofDamage: map['signsofDamage'],
      howToPrevent: map['howToPrevent'],
      treatment: map['treatment'],
      image: map['image'],
    );
  }
}
