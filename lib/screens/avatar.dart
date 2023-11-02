import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pàgina Avatar'),
        actions: [
          Container(
            margin: const EdgeInsets.all(10.0),
            child: const CircleAvatar(
              backgroundImage: NetworkImage("https://static.wikia.nocookie.net/minion/images/c/ca/Bob-from-the-minions-movie.jpg/revision/latest/scale-to-width-down/600?cb=20160316002021&path-prefix=es"),
              backgroundColor: Colors.brown,
              radius: 30.0,
              child: Text('JC'),
            ),
          )
        ],
      ),
      body: const Center(
        child:FadeInImage(
          image: NetworkImage('https://static.wikia.nocookie.net/minion/images/c/ca/Bob-from-the-minions-movie.jpg/revision/latest/scale-to-width-down/600?cb=20160316002021&path-prefix=es'),
          placeholder: AssetImage('assets/jar-loading.gif'),
        )
      ),
    );
  }
}
