import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(
    MaterialApp(
      title: "Stateful App",
      home: FavoriteCity()
    )
  );
}

saveValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('key', "hyd");
}

getValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String stringval = prefs.getString('key');
  return stringval;
}

class FavoriteCity extends StatefulWidget {
  @override
  _FavoriteCityState createState() => _FavoriteCityState();
}

class _FavoriteCityState extends State<FavoriteCity> {

  String nameCity = "";

  @override
  Widget build(BuildContext context) {
    saveValue();
    getValue().then((city){
      nameCity = city;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful App"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              onSubmitted: (String userInput){
                setState(() {
                  nameCity = userInput;
                });
              },
            ),
            Text(
              "Your favorite city is $nameCity",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}