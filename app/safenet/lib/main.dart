import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safenet/core/services/providers.dart';
import 'package:safenet/core/services/routes.dart';
import 'package:safenet/ui/views/welcome_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.providers,
      // TODO: create a seperate file to map all the changeNotifierProviders to their repective Models.
      child: MaterialApp(
        routes: Routes.getRoutes(),
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: WelcomeView(),
      ),
    );
  }
}
