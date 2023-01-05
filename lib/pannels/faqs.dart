import 'package:flutter/material.dart';

import '../datasource.dart';
class FAQPage extends StatelessWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs Page'),
      ),
      body: ListView.builder(
        itemCount: DataSource.questionAnswers.length,
        itemBuilder: (context,index)
      {
        return ExpansionTile(title: Text(DataSource.questionAnswers[index]['question']),
          children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(DataSource.questionAnswers[index]['answer']),
          ),

        ],);

    },
    ));
  }
}
