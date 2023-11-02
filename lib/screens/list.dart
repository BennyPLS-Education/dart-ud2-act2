import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = ScrollController();
  List<int> _llistaNombres = [];
  int _darrerItem = 0;
  bool _estaCarregant = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Llistes'),
      ),
      body: Stack(children: [_crearLlista(), _crearLoading()]),
    );
  }

  @override
  void initState() {
    super.initState();
    _carregaNou();
    _scrollController.addListener(() {
      print(_scrollController.position.pixels);
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          print('Scroll a l\'inici');
        } else {
          print('Scroll al final');
          fetchData();
        }
      }
    });
  }

  Widget _crearLlista() {
    return RefreshIndicator(
      onRefresh: obtenirPagina,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _llistaNombres.length,
        itemBuilder: (BuildContext context, int index) {
          final imatge = _llistaNombres[index];
          return FadeInImage(
              placeholder: const AssetImage('assets/jar-loading.gif'),
              image:
                  NetworkImage('https://picsum.photos/id/${imatge}/500/400'));
        },
      ),
    );
  }

  Future<void> obtenirPagina() async{
    const duration = Duration(seconds: 2);
    Timer(duration, (){
      _llistaNombres.clear();
      _darrerItem++;
      _carregaNou();
    });
    return Future.delayed(duration);
  }

  void _carregaNou() {
    for (int i = 0; i < 5; i++) {
      _llistaNombres.add(_darrerItem);
      _darrerItem++;
    }
    setState(() {});
  }

  Future<Timer> fetchData() async {
    _estaCarregant = true;
    setState(() {});
    const duration = Duration(seconds: 2);
    return Timer(duration, peticioHTTP);
  }

  void peticioHTTP() {
    _estaCarregant = false;
    _carregaNou();
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: const Duration(milliseconds: 250),
        curve: Curves.fastOutSlowIn);
  }

  Widget _crearLoading() {
    if (_estaCarregant) {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(height: 15.0)
        ],
      );
    } else {
      return Container();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
