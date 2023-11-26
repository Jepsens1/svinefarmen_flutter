import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:svinefarmen_flutter/NotificationService.dart';
import 'package:svinefarmen_flutter/Tempsensor.dart';
import 'package:svinefarmen_flutter/datahandler.dart';
import 'package:svinefarmen_flutter/showDataWidget.dart';

void main() {
  runApp(const MyApp());
  NotificationService().init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Svinefarmen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //_channel variable used for the StreamBuilder widget, to show data and also refresh the UI once new data arrives
  final _channel = connectToSocket();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            style: const TextStyle(fontWeight: FontWeight.bold), widget.title),
      ),
      body: Center(
          //StreamBuilder is used for socket connection, when _channel is updated with new data
          // the UI rebuilds itself
          child: StreamBuilder(
        stream: _channel.stream,
        builder: (context, snapshot) {
          //If the socket has data we show the ShowTempData view
          if (snapshot.hasData) {
            return ShowTempData(
                data: Temperatur.fromJson(
                    jsonDecode(snapshot.data) as Map<String, dynamic>));
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return const CircularProgressIndicator();
          }
        },
      )),
    );
  }
}
