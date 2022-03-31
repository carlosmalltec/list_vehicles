import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/const_colors.dart';
import 'package:flutter/material.dart';

class Themes {
  static final TextStyle _titulo = GoogleFonts.openSans(fontSize: 18.0, color: ConstColors.blue, fontWeight: FontWeight.w600);
  static final TextStyle? _subtitulo = GoogleFonts.openSans(fontSize: 16.0, color: ConstColors.blue, fontWeight: FontWeight.w400);

  static InputDecorationTheme inputDecorationTheme([TextTheme? textTheme]) {
    return InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.all(10),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      // //Focus no input sem error
      focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(width: 1, color: ConstColors.fillColor)),
      // //Input em modo de bloqueado
      disabledBorder: const UnderlineInputBorder(borderSide: BorderSide(width: 1, color: ConstColors.border)),
      // //Sem focus, input nao teve evento
      enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(width: 1, color: ConstColors.border)),
      // //Borda global aqui
      border: const UnderlineInputBorder(borderSide: BorderSide(width: 1, color: ConstColors.border)),
      // //Com error sem evento, ou seja o focus esta em outro input
      errorBorder: const UnderlineInputBorder(borderSide: BorderSide(width: 1, color: ConstColors.danger)),
      // //Com error e o focus no input
      focusedErrorBorder: const UnderlineInputBorder(borderSide: BorderSide(width: 1, color: ConstColors.danger)),
      hintStyle: _subtitulo?.copyWith(color: Colors.grey),
      helperStyle: _subtitulo?.copyWith(color: ConstColors.colorText),
      errorStyle: _subtitulo?.copyWith(color: ConstColors.danger),
      labelStyle: _titulo.copyWith(fontSize: 24),
      helperMaxLines: 5,
      errorMaxLines: 5,
    );
  }

  final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    primaryTextTheme: GoogleFonts.openSansTextTheme(),
    // primaryTextTheme: Themes.openSansTextTheme(),
    primaryIconTheme: const IconThemeData(color: ConstColors.blue),
    primaryColor: ConstColors.blue,
    unselectedWidgetColor: ConstColors.orange,
    iconTheme: const IconThemeData(color: ConstColors.blue),
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: ConstColors.createMaterialColor(ConstColors.blue),
        accentColor: ConstColors.orange,
        cardColor: Colors.white,
        backgroundColor: Colors.white,
        errorColor: Colors.red),
    tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(5)),
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: _subtitulo,
        unselectedLabelStyle: _subtitulo,
        labelColor: Colors.white,
        unselectedLabelColor: ConstColors.blue),

    /// App Bar Geral
    appBarTheme: AppBarTheme(
      toolbarHeight: 70.0,
      backgroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      actionsIconTheme: const IconThemeData(color: ConstColors.blue),
      iconTheme: const IconThemeData(color: ConstColors.blue),
      elevation: 2.0,
      centerTitle: true,
      titleTextStyle: _titulo.copyWith(color: ConstColors.orange),
    ),
    textTheme: TextTheme(
      /// Está usando na tela de suporte
      headline6: _subtitulo,

      ///Título da agenda subtitle1
      subtitle1: _titulo,

      ///Usar para Sub-titulo do subtitle2
      subtitle2: _subtitulo?.copyWith(color: ConstColors.colorText),

      ///Formataçao para os buttoes
      button: _subtitulo?.copyWith(color: Colors.white),

      ///Sub-titulo dos cards dos agendamentos bodyText2
      bodyText2: _subtitulo?.copyWith(color: ConstColors.colorText),

      /// Está usando na versao do APP bodyText1
      bodyText1: _subtitulo,
    ),
    buttonTheme: const ButtonThemeData(buttonColor: ConstColors.fillColor, height: 50, minWidth: 250, textTheme: ButtonTextTheme.primary),
    inputDecorationTheme: Themes.inputDecorationTheme(),
  );

  final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.white,
    // primaryTextTheme: Themes.openSansTextTheme(),
    primaryTextTheme: GoogleFonts.openSansTextTheme(),
    primaryIconTheme: const IconThemeData(color: ConstColors.blue),
    primaryColor: ConstColors.blue,
    unselectedWidgetColor: ConstColors.orange,
    iconTheme: const IconThemeData(color: ConstColors.blue),
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: ConstColors.createMaterialColor(ConstColors.blue),
        accentColor: ConstColors.orange,
        cardColor: Colors.white,
        backgroundColor: Colors.white,
        errorColor: Colors.red),
    tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(5)),
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: _subtitulo,
        unselectedLabelStyle: _subtitulo,
        labelColor: Colors.white,
        unselectedLabelColor: ConstColors.blue),

    /// App Bar Geral
    appBarTheme: AppBarTheme(
      toolbarHeight: 70.0,
      backgroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      actionsIconTheme: const IconThemeData(color: ConstColors.blue),
      iconTheme: const IconThemeData(color: ConstColors.blue),
      elevation: 2.0,
      centerTitle: true,
      titleTextStyle: _titulo.copyWith(color: ConstColors.orange),
    ),
    textTheme: TextTheme(
      /// Está usando na tela de suporte
      headline6: _subtitulo,

      ///Título da agenda subtitle1
      subtitle1: _titulo,

      ///Usar para Sub-titulo do subtitle2
      subtitle2: _subtitulo?.copyWith(color: ConstColors.colorText),

      ///Formataçao para os buttoes
      button: _subtitulo?.copyWith(color: Colors.white),

      ///Sub-titulo dos cards dos agendamentos bodyText2
      bodyText2: _subtitulo?.copyWith(color: ConstColors.colorText),

      /// Está usando na versao do APP bodyText1
      bodyText1: _subtitulo,
    ),
    buttonTheme: const ButtonThemeData(buttonColor: ConstColors.fillColor, height: 50, minWidth: 250, textTheme: ButtonTextTheme.primary),
    inputDecorationTheme: Themes.inputDecorationTheme(),
  );
}
