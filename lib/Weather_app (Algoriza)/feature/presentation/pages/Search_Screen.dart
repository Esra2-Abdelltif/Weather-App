import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/colors.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/images.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/pages/weather_by_city.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/widgets/seacrhWidget.dart';
import 'package:weather_app/weather_app_angela/until/constants.dart';
import 'package:weather_app/weather_app_angela/widgets/textform_widget.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var Searchcontroller = TextEditingController();
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),

                        ),
                        child: TextFormField(
                              style: Theme.of(context).textTheme.bodyMedium,
                          controller: Searchcontroller,
                          onChanged: (value) {
                            cityName = value;
                            print(value);
                          },
                          onSaved: (value) {
                            Searchcontroller = value as TextEditingController;
                          },
                          onFieldSubmitted: (data) async {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) => WeatherByCityScreen(cityName: cityName!)));

                          },

                          decoration: InputDecoration(
                            hintText: 'Search City ',
                            hintStyle: TextStyle(color: Colors.grey.shade400,fontSize: 14,fontWeight: FontWeight.w500),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                      backgroundColor: AppColors.blueColor,
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) => WeatherByCityScreen(cityName: cityName)));
                      },
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 200,),
                Text('Search By City',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 30)),
                LottieBuilder.asset(
                  ImageAssest.earth ,
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width * 0.6,
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
