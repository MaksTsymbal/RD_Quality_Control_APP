import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:check_point/providers/login_provider.dart';
import 'package:check_point/providers/documents_provider.dart';
import 'package:check_point/providers/quality_control_document_provider.dart';
import 'package:check_point/routing/router.dart';
import 'package:check_point/common/theme/responsive_theme.dart';
import 'package:check_point/common/custom_theme_data.dart';
import 'package:check_point/providers/theme_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:check_point/providers/language_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => DocumentsProvider()),
        ChangeNotifierProvider(create: (_) => QualityControlDocumentProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return AppResponsiveTheme(
          data: CustomThemeData.forLayoutBreakpoint,
          child: MaterialApp.router(
            title: 'Check-Point',
            locale: languageProvider.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'), 
              Locale('uk'),
            ],
            routerConfig: AppRouter().router,
          ),
        );
      },
    );
  }
}
