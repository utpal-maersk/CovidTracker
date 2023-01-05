import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class API_Internet_Doc extends StatefulWidget {
  const API_Internet_Doc({Key? key}) : super(key: key);

  @override
  State<API_Internet_Doc> createState() => _API_Internet_DocState();
}

class _API_Internet_DocState extends State<API_Internet_Doc> {

  String? stringResponse;
  
  Future fetchData()async{
    http.Response response= await http.get(Uri.parse('https://thegrowingdeveloper.org/apiview?id=1'));
    if (response.statusCode==200){
      setState(() {
        stringResponse=response.body;

      });

    }
  }
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data From Internet'),
        backgroundColor: Colors.blue[900],
      ),
      body: stringResponse==null?CircularProgressIndicator(): Text(stringResponse!,style: TextStyle(fontSize: 30),),
    );
  }
}
