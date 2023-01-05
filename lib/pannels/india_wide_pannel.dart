import 'package:flutter/material.dart';
class IndiaWidePannel extends StatelessWidget {

   final Map indiaData;

   IndiaWidePannel({ required this.indiaData});

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
            count: indiaData['data']['summary']['confirmedCasesIndian'].toString(),

            //count: indiaData[1]['summary']['confirmedCasesIndian'].toString(),
          ),
          StatusPannel(
            title: 'DEATH',
            panelColor:Colors.grey[300],
            textColor:Colors.grey ,
            count: indiaData['data']['summary']['deaths'].toString(),

            //count: indiaData[1]['summary']['deaths'].toString(),
          ),
          StatusPannel(
            title: 'ACTIVE',
            panelColor:Colors.blue[100],
            textColor:Colors.blue ,
            count: indiaData['data']['summary']['total'].toString(),

            //count: indiaData[1]['summary']['confirmedCasesIndian'].toString(),
          ),
          StatusPannel(
            title: 'Recovered',
            panelColor:Colors.green[100],
            textColor:Colors.green ,
            count: indiaData['data']['summary']['discharged'].toString(),

            //count: indiaData[1]['summary']['discharged'].toString(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Last Refreshed '+ indiaData['lastRefreshed'].toString(),style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,

            ),),
          )

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

