import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odoo_apexive/blocs/bloc/bloc/timers_bloc.dart';
import 'package:odoo_apexive/screens/dashboard.dart';
import 'package:odoo_apexive/shared/theme.dart';
import 'package:odoo_apexive/shared/widgets.dart';

Future<void> main() async {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return const ErrorWidgetCustom();
  };
  BlocOverrides.runZoned(() => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimersBloc()..add(const FetchTimers()),
      child: MaterialApp(
        // showPerformanceOverlay: true,
        debugShowCheckedModeBanner: false,
        title: 'Odoo Apexive',
        initialRoute: '/',
        routes: {
          // '/': (context) => const SplashScreen(),
          '/': (context) => const Dashboard(),
          '/dashboard': (context) => const Dashboard(),
        },
        supportedLocales: const [
          Locale('en', 'UK'),
        ],
        theme: themeDataLight,
      ),
    );
  }
}
