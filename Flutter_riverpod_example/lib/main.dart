import 'package:contact_management/data/provider/themeProvider.dart';
import 'package:contact_management/presentation/pages/routes/AppRoutes.dart';
import 'package:contact_management/utility/AppLocalization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkMode = ref.watch(darkModeProvider);
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.routes,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        darkTheme: ThemeData.dark(),
        themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,

        // List all of the app's supported locales here
        supportedLocales: [
          Locale('en', 'US'),
          Locale('ar', 'DZ'),
        ],
        // These delegates make sure that the localization data for the proper language is loaded
        localizationsDelegates: [
          // THIS CLASS WILL BE ADDED LATER
          // A class which loads the translations from JSON files
          AppLocalizations.delegate,
          // Built-in localization of basic text for Material widgets
          GlobalMaterialLocalizations.delegate,
          // Built-in localization for text direction LTR/RTL
          GlobalWidgetsLocalizations.delegate,
        ],
        // Returns a locale which will be used by the app
        localeResolutionCallback: (locale, supportedLocales) {
          // Check if the current device locale is supported
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          // If the locale of the device is not supported, use the first one
          // from the list (English, in this case).
          return supportedLocales.first;
        });
  }
}
