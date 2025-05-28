import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';
// import 'package:get_it/get_it.dart';

// import 'config.dart';

// ignore: avoid_classes_with_only_static_members
class AppTheme {
  // static MyTheme get currentTheme => GetIt.I<MyTheme>();
  // static ThemeMode get themeMode => GetIt.I<MyTheme>().currentTheme();
  static ThemeData lightTheme({
    required BuildContext context,
  }) {
    return ThemeData(
      // TextTheme(),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.hankenGrotesk(
          textStyle:
              const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        displayMedium: GoogleFonts.hankenGrotesk(
          textStyle:
              const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
        ),
        // ... other text styles
        bodyLarge: GoogleFonts.hankenGrotesk(
          textStyle: const TextStyle(fontSize: 16.0),
        ),
        bodyMedium: GoogleFonts.hankenGrotesk(
          textStyle: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        selectionHandleColor: kPrimaryColor,
        cursorColor: kPrimaryColor,
        selectionColor: kPrimaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 1.5, color: Colors.black),
        ),
        border: const OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.black), // Set your border color here
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
      ),
      expansionTileTheme: ExpansionTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        // backgroundColor: kPrimaryColor,
      ),
      cardTheme: CardTheme(
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
      ),
      disabledColor: Colors.grey[600],
      brightness: Brightness.light,
      snackBarTheme:
          SnackBarThemeData(backgroundColor: Theme.of(context).cardColor),
      indicatorColor: kPrimaryColor,
      progressIndicatorTheme:
          const ProgressIndicatorThemeData().copyWith(color: kPrimaryColor),
      iconTheme: IconThemeData(
        color: Colors.grey[900],
        opacity: 1.0,
        size: 24.0,
      ),
      colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: Colors.grey[900],
            brightness: Brightness.light,
            secondary: kPrimaryColor,
          ),
    );
  }

  static ThemeData darkTheme({
    required BuildContext context,
  }) {
    return ThemeData(
      textTheme: TextTheme(
        displayLarge: GoogleFonts.hankenGrotesk(
          textStyle:
              const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        displayMedium: GoogleFonts.hankenGrotesk(
          textStyle:
              const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
        ),
        // ... other text styles
        bodyLarge: GoogleFonts.hankenGrotesk(
          textStyle: const TextStyle(fontSize: 16.0),
        ),
        bodyMedium: GoogleFonts.hankenGrotesk(
          textStyle: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: kPrimaryLightColor,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        selectionHandleColor: kPrimaryColor,
        cursorColor: kPrimaryColor,
        selectionColor: kPrimaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(color: kPrimaryLightColor),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          // borderSide: const BorderSide(width: 1.5, color: kPrimaryLightColor),
        ),
        border: const OutlineInputBorder(
            // borderSide:
            // BorderSide(color: kPrimaryLightColor), // Set your border color here
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      datePickerTheme: DatePickerThemeData(
        headerHelpStyle: const TextStyle(color: kPrimaryLightColor),
        backgroundColor: kPrimaryDarkColor, // Set to the dark background color
        dayForegroundColor: MaterialStateProperty.all(kPrimaryLightColor),
        yearForegroundColor: MaterialStateProperty.all(kPrimaryLightColor),
        todayForegroundColor: MaterialStateProperty.all(kPrimaryLightColor),
        rangePickerHeaderForegroundColor: kPrimaryLightColor,
        todayBackgroundColor: MaterialStateProperty.all(kPrimaryDarkColor),
        yearStyle: const TextStyle(color: kPrimaryLightColor),
        dividerColor: kPrimaryLightColor,
        weekdayStyle: const TextStyle(color: kPrimaryLightColor),
        dayStyle: const TextStyle(color: kPrimaryLightColor),
        yearOverlayColor: MaterialStateProperty.all(kPrimaryLightColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ), // Customize the shape as needed

        headerForegroundColor: kPrimaryLightColor, // Customize as needed
        rangePickerHeaderHelpStyle: const TextStyle(color: kPrimaryLightColor),
        rangePickerHeaderHeadlineStyle:
            const TextStyle(color: kPrimaryLightColor),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: kPrimaryLightColor),
          fillColor: kPrimaryColor,
        ),
        headerHeadlineStyle: const TextStyle(
          color: kPrimaryLightColor,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ), // Customize the header headline style as needed
      ), // Customize

      dialogTheme: const DialogTheme(
        backgroundColor: kPrimaryDarkColor,
        contentTextStyle: TextStyle(
          color: kPrimaryLightColor,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: kPrimaryDarkColor,
      ),
      listTileTheme: ListTileThemeData(
        iconColor: kPrimaryLightColor,
        textColor: kPrimaryLightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
      ),
      expansionTileTheme: ExpansionTileThemeData(
        iconColor: kPrimaryLightColor,
        textColor: kPrimaryLightColor,
        collapsedTextColor: kPrimaryLightColor,
        collapsedIconColor: kPrimaryLightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
          color: Colors.grey[850],
          textStyle: const TextStyle(color: kPrimaryLightColor),
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            // Default TextStyle
            return const TextStyle(color: kPrimaryLightColor);
          })),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.dark,
      snackBarTheme:
          SnackBarThemeData(backgroundColor: Theme.of(context).hintColor),
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(),
        // color: kPrimaryColor,
        backgroundColor: kPrimaryDarkColor,
        foregroundColor: kPrimaryLightColor,
      ),
      canvasColor: kPrimaryDarkColor,
      scaffoldBackgroundColor: kPrimaryDarkColor,

      drawerTheme: const DrawerThemeData(
        backgroundColor: kPrimaryDarkColor,
      ),
      cardColor: kPrimaryDarkColor,
      cardTheme: CardTheme(
        color: kPrimaryDarkColor,
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
      ),
      dialogBackgroundColor: Colors.grey[850],
      progressIndicatorTheme:
          const ProgressIndicatorThemeData().copyWith(color: kPrimaryColor),
      iconTheme: const IconThemeData(
        color: kPrimaryLightColor,
        opacity: 1.0,
        size: 24.0,
      ),
      indicatorColor: kPrimaryColor,
      colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: kPrimaryLightColor,
            secondary: kPrimaryColor,
            brightness: Brightness.dark,
          ),
    );
  }
}
