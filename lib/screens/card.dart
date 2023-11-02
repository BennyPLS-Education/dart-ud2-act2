import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  final imageUrl =
      'https://ayay.co.uk/backgrounds/nature/beaches_and_coasts/big-beach.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          _cardTipus1(),
          SizedBox(height: 30.0),
          _cardTipus2(),
          SizedBox(height: 30.0),
          _cardTipus1(),
          SizedBox(height: 30.0),
          _cardTipus2(),
          SizedBox(height: 30.0),
          _cardTipus1(),
          SizedBox(height: 30.0),
          _cardTipus2(),
          SizedBox(height: 30.0),
          _cardTipus1(),
          SizedBox(height: 30.0),
          _cardTipus2(),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget _cardTipus1() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Títol de la targeta'),
            subtitle: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: const Text('OK')),
              TextButton(onPressed: () {}, child: const Text('Cancel·lar')),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipus2() {
    return Card(
      elevation: 10,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(imageUrl),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text('Títol de la imatge'),
          ),
        ],
      ),
    );
  }
}
