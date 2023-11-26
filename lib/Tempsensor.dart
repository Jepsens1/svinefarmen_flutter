class Temperatur {
  final String Name;
  final String TemperaturValue;
  final String HumidtityValue;
  final bool Alarm;
  const Temperatur(
      {required this.Name,
      required this.TemperaturValue,
      required this.HumidtityValue,
      required this.Alarm});

  //Returns a Temperatur object after parsing in json format
  factory Temperatur.fromJson(Map<String, dynamic> json) {
    return Temperatur(
        Name: json['Sensor'] as String,
        TemperaturValue: json['Temperature'] as String,
        HumidtityValue: json['Humiditity'] as String,
        Alarm: json["Alarm"] as bool);
  }
}
