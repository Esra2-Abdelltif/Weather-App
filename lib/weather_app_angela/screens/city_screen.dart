import 'package:flutter/material.dart';
import 'package:weather_app/weather_app_angela/until/constants.dart';
import 'package:weather_app/weather_app_angela/widgets/textform_widget.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  var Searchcontroller = TextEditingController();
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child:  CustomTextField(
                    onChanged: (value) {
                      cityName=value;
                      print(value);
                    },
                    onSaved: (value) {
                      Searchcontroller = value as TextEditingController;
                    },
                    onFieldSubmitted: (data) async {
                      Navigator.pop(context,cityName);

                    },
                    hintText: 'Enter a City',
                    textInputType: TextInputType.text,
                    labelText: 'Search',
                    fieldName: 'Search',
                    prefixIcon: Icon(Icons.search, color: Colors.orange),
                    controller: Searchcontroller),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context,cityName);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
