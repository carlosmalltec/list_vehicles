import 'package:appvehicles/core/logger/application_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'core/bindings/application_bindings.dart';
import 'lang/translation_service.dart';
import 'routes/app_pages.dart';
import 'themes/theme_service.dart';
import 'themes/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ApplicationBindings(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.topLevel,
      enableLog: true,
      logWriterCallback: ApplicationLogger.write,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      localizationsDelegates: [GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
      supportedLocales: [const Locale("pt", "BR"), const Locale("es", "ES"), const Locale("en", "US")],
      title: 'nameApp'.tr,
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: ThemeService().getThemeMode(),
    );
  }
}
