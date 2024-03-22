import 'package:converter_satuan/UI/Gram/gram.dart';
import 'package:converter_satuan/UI/Meter/meter.dart';
import 'package:converter_satuan/UI/Time/time.dart';
import 'package:converter_satuan/UI/Volume/volume.dart';
import 'package:converter_satuan/UI/home.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(context),
            buildItem(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    );
  }

  Widget buildItem(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Home()));
          },
        ),
        const Divider(
          thickness: 2,
          color: Colors.black,
        ),
        ListTile(
          leading: const Icon(Icons.height),
          title: const Text('Meter'),
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Meter()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.scale),
          title: const Text('Gram'),
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Gram()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.water_drop),
          title: const Text('Volume'),
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Volume()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.schedule),
          title: const Text('Waktu'),
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Time()));
          },
        ),
      ],
    );
  }
}
