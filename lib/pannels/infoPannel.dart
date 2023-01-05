import 'package:covid_tracker/datasource.dart';
import 'package:covid_tracker/pannels/faqs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPannel extends StatelessWidget {
  const InfoPannel({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Container(

      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQPage()));
            },
            child: Container(

              padding: EdgeInsets.symmetric(vertical: 2,horizontal: 5),
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('FAQs',style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,
                  ),
                  ),
                  Icon(Icons.arrow_forward,color: Colors.white,),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: (){
              launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/donate');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text('Donate',style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,
                  ),
                  ),
                  Icon(Icons.arrow_forward,color: Colors.white,),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: (){
              launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters' as String);
            },
            child: Container(

              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('MYTH BUSTERS',style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,
                  ),
                  ),
                  Icon(Icons.arrow_forward,color: Colors.white,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
