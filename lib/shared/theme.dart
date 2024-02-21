import 'package:flutter/material.dart';
import 'package:odoo_apexive/shared/const.dart';

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  hintStyle: textTheme.bodyLarge!.copyWith(height: 0),
  prefixStyle: textTheme.bodyLarge!.copyWith(height: 0),
  labelStyle: textTheme.bodyLarge!.copyWith(height: 0),
  helperStyle: textTheme.bodyLarge!.copyWith(height: 0),
  errorStyle: textTheme.bodyLarge!
      .copyWith(height: 0, color: themeLightColorScheme.error),
  suffixStyle: textTheme.bodyLarge!.copyWith(height: 0),
  counterStyle: textTheme.bodyLarge!.copyWith(height: 0),
  floatingLabelStyle: textTheme.bodyLarge!.copyWith(height: 0),
  filled: false,
  errorBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)),
    borderSide: BorderSide(color: themeLightColorScheme.error),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)),
    borderSide: BorderSide(color: themeLightColorScheme.outline),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)),
    borderSide: BorderSide(color: themeLightColorScheme.outline),
  ),
  border: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)),
    borderSide: BorderSide(color: themeLightColorScheme.outline),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)),
    borderSide: BorderSide(color: themeLightColorScheme.outline),
  ),
);

const ColorScheme themeLightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFFFFFFFF),
  onPrimary: Color(0xFF000000),
  primaryContainer: Color(0xFFFFFFFF),
  onPrimaryContainer: Color(0xFF000000),
  secondary: Color(0x29FFFFFF),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0x29FFFFFF),
  onSecondaryContainer: Color(0xFFFFFFFF),
  tertiary: Color(0x52FFFFFF),
  onTertiary: Color(0xFF000000),
  tertiaryContainer: Color(0x52000000),
  onTertiaryContainer: Color(0xFF000000),
  error: Color(0xFFCC3C21),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0x52CC3C21),
  onErrorContainer: Color(0xFFCC3C21),
  background: backgroundDarkColor, //Gradient
  onBackground: Color(0xFFFFFFFF),
  surface: backgroundLightColor, //Gradient
  onSurface: Color(0xFFFFFFFF),
  surfaceVariant: Color(0xFF214ECC),
  onSurfaceVariant: Color(0xFFFFFFFF),
  outline: Color(0x29FFFFFF),
  outlineVariant: Color(0x7AFFFFFF),
);

const TextTheme textTheme = TextTheme(
  displayLarge: TextStyle(
    fontFamily: 'Inter',
    fontSize: 57,
    // height: 64.0,
    fontWeight: FontWeight.w600,
    color: white,
  ),
  displayMedium: TextStyle(
    fontFamily: 'Inter',
    fontSize: 45,
    // height: 52.0,
    fontWeight: FontWeight.w400,
    color: white,
  ),
  displaySmall: TextStyle(
    fontFamily: 'Inter',
    fontSize: 36,
    // height: 44.0,
    fontWeight: FontWeight.w600,
    color: white,
  ),
  headlineLarge: TextStyle(
    fontFamily: 'Inter',
    fontSize: 32,
    // height: 40.0,
    fontWeight: FontWeight.w700,
    color: white,
  ),
  headlineMedium: TextStyle(
    fontFamily: 'Inter',
    fontSize: 28,
    // height: 36.0,
    fontWeight: FontWeight.w700,
    color: white,
  ),
  headlineSmall: TextStyle(
    fontFamily: 'Inter',
    fontSize: 24,
    // height: 32.0,
    fontWeight: FontWeight.w700,
    color: white,
  ),
  titleLarge: TextStyle(
    fontFamily: 'Inter',
    fontSize: 22,
    // height: 28.0,
    fontWeight: FontWeight.w600,
    color: white,
  ),
  titleMedium: TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    // height: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    color: white,
  ),
  titleSmall: TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    // height: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    color: white,
  ),
  labelLarge: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    // height: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    color: white,
  ),
  labelMedium: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    // height: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    color: white,
  ),
  labelSmall: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 11,
    // height: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    color: white,
  ),
  bodyLarge: TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    // height: 24,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    color: white,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    // height: 20,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: white,
  ),
  bodySmall: TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    // height: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    color: white,
  ),
);

final ThemeData themeDataLight = ThemeData(
  colorScheme: themeLightColorScheme,
  textTheme: textTheme,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor: Colors.transparent,
    type: BottomNavigationBarType.fixed,
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.transparent,
    toolbarHeight: 100,
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStateProperty.all(white),
      backgroundColor: MaterialStateProperty.all(
        Colors.transparent,
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultRadiusButtons),
        ),
      ),
    ),
  ),
  listTileTheme: const ListTileThemeData(
    dense: true,
    contentPadding: EdgeInsets.all(0),
  ),
  iconTheme: const IconThemeData(
    color: white,
  ),
  tabBarTheme: TabBarTheme(
    labelColor: Colors.white,
    dividerColor: themeLightColorScheme.outline,
    unselectedLabelColor: Colors.white,
    indicatorColor: Colors.white,
    labelStyle: const TextStyle(
      color: white,
    ),
    unselectedLabelStyle: textTheme.labelLarge!.copyWith(height: 0),
  ),
  dropdownMenuTheme: DropdownMenuThemeData(
    textStyle: textTheme.bodyLarge!.copyWith(
      height: 0,
      color: Colors.white,
    ),
    inputDecorationTheme: inputDecorationTheme,
  ),
  inputDecorationTheme: inputDecorationTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStateProperty.all(white),
      backgroundColor: MaterialStateProperty.all(
        themeLightColorScheme.secondaryContainer,
      ),
      fixedSize: MaterialStateProperty.all<Size>(
        const Size.fromHeight(defaultButtonHeight),
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(textTheme.labelLarge!),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultRadiusButtons),
        ),
      ),
      elevation: MaterialStateProperty.all(0),
    ),
  ),
  dividerTheme: DividerThemeData(
    color: themeLightColorScheme.outline,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: themeLightColorScheme.surfaceVariant,
  ),
  menuTheme: MenuThemeData(
    style: MenuStyle(
      backgroundColor: MaterialStateProperty.all(themeLightColorScheme.outline),
    ),
  ),
  canvasColor: const Color(0xFF304b92),
);
