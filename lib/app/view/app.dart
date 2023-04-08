import 'package:api_repository/api_repository.dart';
import 'package:currency/home/home.dart';
import 'package:currency/splash_screen/view/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_storage/local_storage.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ApiRepository(
            appID: dotenv.env['APP_ID']!,
          ),
        ),
        RepositoryProvider(
          create: (context) => const LocalStorage(),
        ),
      ],
      child: BlocProvider(
        create: (context) => HomeBloc(
          apiRepository: context.read<ApiRepository>(),
          localStorage: context.read<LocalStorage>(),
        ),
        child: MaterialApp(
          title: 'Currency',
          theme: ThemeData.dark().copyWith(
            primaryTextTheme: GoogleFonts.varelaTextTheme(),
          ),
          home: const SplashScreenPage(),
        ),
      ),
    );
  }
}
