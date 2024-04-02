import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Listing',
      home: Scaffold(
        appBar: AppBar(
          title: Text('1975 Porsche 911 Carrera'),
        ),
        body: CarListing(),
      ),
    );
  }
}

class CarListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Image.network(
          'assets/porsche911.jpg',
          height: 250,
          fit: BoxFit.cover,
        ),
        ListTile(
          title: Text(
            '1975 Porsche 911 Carrera',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.comment),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {},
              ),
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.check_circle, color: Colors.green),
          title: Text('Essential Information'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Year: 1975'),
              Text('Make: Porsche'),
              Text('Model: 911 Carrera'),
              Text('VIN: 9115400029'),
            ],
          ),
        ),
        Divider(
          thickness: 0.0,
        )
      ],
    );
  }
}
