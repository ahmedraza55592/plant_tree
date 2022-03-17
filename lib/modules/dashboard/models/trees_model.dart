class Trees {
  static List<Item>? items;
}

class Item {
  final String? id;
  final String? name;
  final String? climateForGrowth;
  final String? idealSoil;
  final String? waterInTake;
  final String? timeToMaturity;
  final String? lifeSpan;
  final String? image;
  final String? season;
  final String? temperature;
  final String? water;
  final String? humidity;

  Item(
      {this.id,
      this.name,
      this.climateForGrowth,
      this.idealSoil,
      this.waterInTake,
      this.timeToMaturity,
      this.lifeSpan,
      this.image,
      this.season,
      this.water,
      this.temperature,
      this.humidity});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      climateForGrowth: map['ClimateForGrowth'],
      idealSoil: map['IdealSoil'],
      waterInTake: map['WaterIntake'],
      timeToMaturity: map['TimeToMaturity'],
      lifeSpan: map['LifeSpan'],
      image: map['Image'],
      season: map['season'],
      water: map['water'],
      temperature: map['temperature'],
      humidity: map['humidity']
    );
  }
}
