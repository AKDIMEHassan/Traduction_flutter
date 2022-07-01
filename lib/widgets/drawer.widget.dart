import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_traduction/bloc/theme.bloc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final menus = [
      {
        "title": "Traduction",
        "icon": Icon(
          Icons.translate,
          color: Theme.of(context).primaryColor,
        ),
        "route": "/"
      },
      {
        "title": "Dictionnaire",
        "icon": Icon(Icons.book, color: Theme.of(context).primaryColor),
        "route": "/dictionary"
      },
      {
        "title": "OCR",
        "icon": Icon(Icons.camera, color: Theme.of(context).primaryColor),
        "route": "/ocr"
      },
      {
        "title": "QR Scan",
        "icon": Icon(Icons.qr_code, color: Theme.of(context).primaryColor),
        "route": "/rqr"
      },
      {
        "title": "QR create",
        "icon": Icon(Icons.qr_code, color: Theme.of(context).primaryColor),
        "route": "/sqr"
      },
    ];
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.white,
                Theme.of(context).colorScheme.primary
              ])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("images/profil.png"),
                  ),
                  IconButton(
                      onPressed: () {
                        context.read<ThemeBloc>().add(SwitchThemeEvent());
                      },
                      icon: const Icon(Icons.switch_account))
                ],
              )),
          Expanded(
            child: ListView.separated(
                separatorBuilder: (_, __) {
                  return Divider(
                    color: Theme.of(context).primaryColor,
                    height: 1,
                  );
                },
                itemCount: menus.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    leading: menus[index]['icon'] as Icon,
                    title: Text("${menus[index]['title']}"),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, "${menus[index]['route']}");
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
