// ignore_for_file: prefer_const_constructors

import 'package:app_traduction/pages/dictionary.page.dart';
import 'package:app_traduction/pages/ocr.page.dart';
import 'package:app_traduction/pages/qr/readqr.page.dart';
import 'package:app_traduction/pages/qr/scanqr.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_traduction/bloc/theme.bloc.dart';

import 'home.page.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return MaterialApp(
        theme: state.theme,
        routes: {
          "/": (context) => HomePage(),
          "/dictionary": (context) => Dictionary(),
          "/ocr": (context) => Ocr(),
          "/sqr": (context) => CreateScreen(),
          "/rqr": (context) => ScanScreen(),
        },
      );
    });
  }
}
