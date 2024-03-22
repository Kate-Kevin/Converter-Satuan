import 'package:converter_satuan/UI/Gram/gram.dart';
import 'package:converter_satuan/UI/Meter/meter.dart';
/* import 'package:converter_satuan/UI/Time/time.dart'; */
import 'package:converter_satuan/UI/Volume/volume.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var menu = [
    "Meter",
    "Gram",
    "Volume",
    //"Waktu"
  ];

  var icon = [Icons.height, Icons.scale, Icons.water_drop, Icons.schedule];

  var map = [
    const Meter(),
    const Gram(),
    const Volume(),
    //const Time(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Converter Satuan'),
        ),
        body: GridView.builder(
            itemCount: menu.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => map[index]));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(icon[index]),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(menu[index]),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
