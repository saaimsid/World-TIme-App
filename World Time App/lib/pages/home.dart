import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;
    String image = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    print(data);
    return Scaffold(
      backgroundColor: data['isDayTime'] ? Colors.blue[100] : Colors.black,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$image'), fit: BoxFit.cover)),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          TextButton.icon(
              onPressed: () async {
                dynamic result = await Navigator.pushNamed(context, '/location');
                setState(() {
                  data = {
                    'time' : result['time'],
                    'location' : result['location'],
                    'isDayTime' : result['isDayTime'],
                    'flag':result['flag']
                  };
                });
              },
              icon: Icon(Icons.edit_location, color: Colors.amber),
              label: Text(
                'Edit location',
                style: TextStyle(color: Colors.amber),
              )),
          SizedBox(
            height: 120.0,
          ),
          Text(
            data['location'],
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 40,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            data['time'],
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 60, letterSpacing: 2.0, color: Colors.white),
          ),
        ]),
      )),
    );
  }
}
