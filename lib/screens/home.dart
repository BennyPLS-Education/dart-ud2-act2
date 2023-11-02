import 'package:flutter/material.dart';
import 'package:learning/menu_provider.dart';
import 'package:learning/utils/string_icons.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: const [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _createElements(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _createElements(List<dynamic>? data, BuildContext context) {
    final List<Widget> elements = [];

    data?.forEach((element) {
      elements
        ..add(
          ListTile(
            title: Text(element['texte']),
            leading: getIcon(element['icona']),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, element['ruta']);
            },
          ),
        )
        ..add(const Divider());
    });

    return elements;
  }
}
