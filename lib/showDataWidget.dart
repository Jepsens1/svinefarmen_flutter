import 'package:flutter/material.dart';
import 'package:svinefarmen_flutter/Tempsensor.dart';

class ShowTempData extends StatelessWidget {
  const ShowTempData({super.key, required this.data});
  final Temperatur data;

  //Changes the background color tilecolor based on Temperatur value
  Color getTileColorBasedOnTemp(String data) {
    try {
      double value = double.parse(data);
      if (value < 0) {
        return Colors.red;
      }
      if (value > 0 && value < 40) {
        return Colors.green;
      } else {
        return Colors.red;
      }
    } on Exception catch (_) {
      return Colors.red;
    }
  }

  //Changes the background color tilecolor based on Humiditity value
  Color getTileColorBasedOnHumiditity(String data) {
    try {
      double value = double.parse(data);
      if (value < 85) {
        return Colors.green;
      } else {
        return Colors.red;
      }
    } on Exception catch (_) {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    //Shows a ListView with 3 tiles (Sensor name, Temperatur and Humiditity)
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ListTile(
            title: Text(
                style: const TextStyle(fontWeight: FontWeight.bold),
                "Sensor: ${data.Name}"),
            tileColor: Colors.blue,
            leading: const Icon(Icons.sensors)),
        ListTile(
          title: Text(
              style: const TextStyle(fontWeight: FontWeight.bold),
              "Temperature: ${data.TemperaturValue}"),
          tileColor: getTileColorBasedOnTemp(data.TemperaturValue),
          leading: const Icon(Icons.thermostat),
        ),
        ListTile(
          title: Text(
              style: const TextStyle(fontWeight: FontWeight.bold),
              "Humidtity: ${data.HumidtityValue}"),
          tileColor: getTileColorBasedOnHumiditity(data.HumidtityValue),
          leading: const Icon(Icons.air),
        ),
      ],
    );
  }
}
