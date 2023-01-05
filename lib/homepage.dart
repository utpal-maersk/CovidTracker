import 'dart:convert';

import 'package:covid_tracker/datasource.dart';
import 'package:covid_tracker/pannels/india_wide_pannel.dart';
import 'package:covid_tracker/pannels/infoPannel.dart';
import 'package:covid_tracker/pannels/world_wide_pannel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    //Map? worldData;
   List<dynamic>?worldData;
   Map?IndiaData;
    fetchUSData()async{
    http.Response response=await http.get(Uri.parse('https://api.covidtracking.com/v1/us/current.json'));
    setState(() {
      worldData=jsonDecode(response.body);
      print(worldData);

    });
  }

  fetchIndiaData()async{
    http.Response response=await http.get(Uri.parse('https://api.rootnet.in/covid19-in/stats/latest'));
    setState(() {
      IndiaData=jsonDecode(response.body);
      print(IndiaData!['data']['summary']['total']);
  });
  }


  @override
  void initState() {
    fetchUSData();
    fetchIndiaData();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBlack,
        centerTitle: false,
        title: Text('COVID-19 TRACKER'),

      ),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              color: Colors.orange[100],
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(DataSource.quote,style: TextStyle(
                    color: Colors.orange[800],
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Worldwide Covid Data',style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,

                ),),
              ),
            ),
            worldData==null?CircularProgressIndicator() :WorldwidePannel(worldData: worldData!),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('India Covid Data',style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,)),
            ),
            IndiaData==null?CircularProgressIndicator():IndiaWidePannel(indiaData: IndiaData!),
            InfoPannel(),
          ],
          
        ),
      ),
    );
  }
}
