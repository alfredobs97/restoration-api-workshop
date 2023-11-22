import 'package:flutter/material.dart';
import 'package:restoration_api_workshop/ui/app_router.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> with RestorationMixin {
  String termsAndConditions = """
Welcome to the Buy GDG Tickets app!

By using this app, you agree to the following terms and conditions:

License: You are granted a non-exclusive, non-transferable license to use the app for personal, non-commercial purposes.
Intellectual property: All rights, title, and interest in the app, including all intellectual property rights, are owned by the app developer.
Responsibility: The app developer is not responsible for any damages or losses caused by the app, including, but not limited to, personal injury, property damage, or financial loss.
Privacy: The app developer may collect and use your personal information in accordance with the app's privacy policy.
Changes: The app developer may change these terms and conditions at any time.

Additional terms and conditions for Buy GDG Tickets app:

The app allows you to create and share content with other users. You are responsible for the content you create and share.
The app may contain links to third-party websites or services. The app developer is not responsible for the content or privacy practices of these third-party websites or services.
The app is provided "as is" and the app developer makes no warranties, express or implied, about the app.

These terms and conditions are subject to the laws of the State of Spain.
""";
  final RestorableBool _isTermsAccepted = RestorableBool(false);

  @override
  String? get restorationId => 'TermsPageRestorationId';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_isTermsAccepted, "_isTermsAccepted");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Terms & Conditions')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              color: Colors.grey[200],
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    termsAndConditions,
                  ),
                ),
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Agree to our Terms and Conditions'),
                      Checkbox.adaptive(
                        value: _isTermsAccepted.value,
                        onChanged: (bool? value) => setState(() {
                          _isTermsAccepted.value = value ?? false;
                        }),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FilledButton.tonal(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Come back'),
                      ),
                      FilledButton(
                        onPressed:
                            _isTermsAccepted.value ? () => Navigator.of(context).restorablePushNamed(RouteNames.userForm) : null,
                        child: Text('Next'),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
