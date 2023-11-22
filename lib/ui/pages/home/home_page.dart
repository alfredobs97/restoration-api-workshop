import 'package:flutter/material.dart';
import 'package:restoration_api_workshop/ui/app_router.dart';


class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/img/buy-ticket.jpeg'),
              const SizedBox(height: 16),
              Text(
                'GDG tickets',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Text(
                'In this app, you could buy DevFest tickets for GDG spain chapters',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 72),
              FilledButton.icon(
                onPressed: () => Navigator.of(context).restorablePushNamed(RouteNames.terms),
                icon: Icon(Icons.navigate_next),
                label: Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
