import 'package:flutter/material.dart';
import 'package:restoration_api_workshop/ui/utils/cities.dart';
import 'package:restoration_api_workshop/ui/utils/restorable_cities.dart';

class UserFormPage extends StatefulWidget {
  const UserFormPage({super.key});

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> with RestorationMixin {
  final RestorableTextEditingController _nameController = RestorableTextEditingController();
  final RestorableTextEditingController _emailController = RestorableTextEditingController();
  final RestorableCities _city = RestorableCities();

  @override
  String? get restorationId => 'UserFormPageRestorationId';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_nameController, '_nameController');
    registerForRestoration(_emailController, '_emailController');
    registerForRestoration(_city, '_city');
  }

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
                    controller: _nameController.value,
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
                    controller: _emailController.value,
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
                  DropdownButtonFormField<Cities>(
                    value: _city.value,
                    items: Cities.values.map((city) {
                      return DropdownMenuItem(
                        value: city,
                        child: Text(city.name),
                      );
                    }).toList(),
                    onChanged: (citySelected) {
                      setState(() {
                        _city.value = citySelected ?? _city.value;
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
