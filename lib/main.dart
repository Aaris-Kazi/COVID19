import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData.dark(),
      home: Covid(),
    );
  }
}

class Covid extends StatefulWidget {
  @override
  _CovidState createState() => _CovidState();
}

class _CovidState extends State<Covid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Column(
        children: <Widget>[
          new ClipPath(
              clipper: MyClipper(),
              child: Container(
                padding: EdgeInsets.only(left: 50, top: 50, right: 20),
                height: 300,
                width: double.infinity,
                decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF3383CD), Color(0xFF11249F)]),
                    image: new DecorationImage(
                        image: new AssetImage('assets/coronavirus.png'))),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        'assets/menu.png',
                        height: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: new Stack(
                      children: <Widget>[
                        Image.asset(
                          'assets/nurse.png',
                          height: 190,
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.bottomLeft,
                        ),
                        Positioned(
                          left: 120,
                          child: Text(
                            'All you need, \n Is to stay at home!',
                            style: new TextStyle(fontSize: 20),
                          ),
                        ),
                        Container()
                      ],
                    ))
                  ],
                ),
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: new BorderRadius.circular(25),
                  border: Border.all(color: Color(0xFFE5E5E5))),
              child: Row(
                children: <Widget>[
                  Icon(Icons.location_city, color: Colors.black),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: DropdownButton(
                    isExpanded: true,
                    underline: SizedBox(),
                    items: ['India', 'America', 'France']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        child: new Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (value) {},
                  ))
                ],
              )),
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              children: <Widget>[
                Text.rich(TextSpan(children: [
                  TextSpan(text: 'Case Update\n'),
                  TextSpan(text: 'Case Update')
                ]))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
