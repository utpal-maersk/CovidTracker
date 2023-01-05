import 'package:flutter/material.dart';
class WorldwidePannel extends StatelessWidget {

   final List worldData;

  WorldwidePannel({ required this.worldData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2),
        children: [
          StatusPannel(
            title: 'CONFIRMED',
            panelColor:Colors.red[100],
            textColor:Colors.red ,
            count: worldData[0]['positive'].toString(),
          ),
          StatusPannel(
            title: 'DEATH',
            panelColor:Colors.grey[300],
            textColor:Colors.grey ,
            count: worldData[0]['death'].toString(),
          ),
          StatusPannel(
            title: 'ACTIVE',
            panelColor:Colors.blue[100],
            textColor:Colors.blue ,
            count: worldData[0]['hospitalized'].toString(),
          ),
          StatusPannel(
            title: 'Recovered',
            panelColor:Colors.green[100],
            textColor:Colors.green ,
            count: worldData[0]['negativeIncrease'].toString(),
          ),

    ],
      ),
    );
  }
}
class StatusPannel extends StatelessWidget {

   Color? panelColor;
  Color ?textColor;
  final String title;
   final String  count;
  StatusPannel({required String this.title, required MaterialColor this.textColor, required this.panelColor, required this.count});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(5),
      color: panelColor,
      height:80 ,
      width: width/2,


      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
            ),
            Text(
              count,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
            )
          ],


      ),
    );

  }

}

