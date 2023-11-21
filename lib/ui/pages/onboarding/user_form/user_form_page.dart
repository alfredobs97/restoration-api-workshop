import 'package:flutter/material.dart';

class UserFormPage extends StatefulWidget {
  const UserFormPage({super.key});

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final List<String> _cities = [
    'Santiago de Compostela',
    'Barcelona',
    'Valencia',
    'Sevilla',
    'Zaragoza',
    'Málaga',
    'Murcia',
    'Palma de Mallorca',
    'Bilbao',
  ];

  String _citySelected = 'Santiago de Compostela';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fill your data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Name and Surname',
                          labelStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      DropdownButtonFormField<String>(
                        value: _citySelected,
                        items: _cities.map((ciudad) {
                          return DropdownMenuItem(
                            value: ciudad,
                            child: Text(ciudad),
                          );
                        }).toList(),
                        onChanged: (ciudadSeleccionada) {
                          setState(() {
                            _citySelected = ciudadSeleccionada ?? _citySelected;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Select DevFest',
                          labelStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            FilledButton(onPressed: () {}, child: const Text('Buy your ticket!'))
          ],
        ),
      ),
    );
  }
}
