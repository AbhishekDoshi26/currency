import 'package:api_repository/api_repository.dart';
import 'package:currency/splash_screen/view/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency',
      theme: ThemeData.dark().copyWith(
        primaryTextTheme: GoogleFonts.varelaTextTheme(),
      ),
      home: RepositoryProvider(
        create: (context) => ApiRepository(
          appID: dotenv.env['APP_ID']!,
        ),
        child: const SplashScreenPage(),
      ),
    );
  }
}
