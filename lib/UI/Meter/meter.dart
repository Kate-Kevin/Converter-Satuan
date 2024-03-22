import 'package:converter_satuan/Shared/logic.dart';
import 'package:converter_satuan/UI/drawer.dart';
import 'package:flutter/material.dart';

class Meter extends StatefulWidget {
  const Meter({super.key});

  @override
  State<Meter> createState() => _MeterState();
}

class _MeterState extends State<Meter> {
  double angka = 0;
  double hasil = 0;
  String selected1 = 'MM';
  String selected2 = 'MM';
  String errorText = '';
  TextEditingController angka1 = TextEditingController();
  List<String> dropdown = ["MM", "CM", "DM", "M", "DAM", "HM", "KM"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Satuan Meter'),
      ),
      drawer: const SideBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                onChanged: (_) {
                  setState(() {
                    errorText = '';
                  });
                },
                decoration: InputDecoration(
                    errorText: errorText.isEmpty ? null : errorText,
                    labelText: "Jarak",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                    fillColor: Colors.white,
                    filled: true),
                controller: angka1,
                keyboardType: TextInputType.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    hint: Text(dropdown[0]),
                    value: selected1,
                    items: dropdown
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selected1 = val!;
                      });
                    },
                  ),
                  const Text(' -> '),
                  DropdownButton(
                    hint: Text(dropdown[0]),
                    value: selected2,
                    items: dropdown
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selected2 = val!;
                      });
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (angka1.text.isNotEmpty) {
                          angka = double.parse(angka1.text);
                          hasil =
                              Logic().meterLogic(angka, selected1, selected2);
                        } else {
                          setState(() {
                            errorText = 'Masukan Angka';
                          });
                        }
                      });
                    },
                    child: const Text('Convert')),
              ),
              Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(style: BorderStyle.solid),
                    color: Colors.white,
                  ),
                  child: Center(child: Text('${hasil.toString()} $selected2'))),
            ],
          ),
        ),
      ),
    );
  }
}
