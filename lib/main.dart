import 'package:flutter/material.dart';
import 'package:moviez/presentation/journeys/home_page.dart';

void main() {
  runApp(Moviez());
}

final String appName = 'Moviez';

class Moviez extends StatelessWidget {
  const Moviez({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}
