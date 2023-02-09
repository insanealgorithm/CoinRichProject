import 'dart:async';
import 'dart:js_util';
import 'package:cashrich/utils/GetCashRichAPI.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
 List<GetCashRichAPI>? apiList;
  @override
  void initState(){
    super.initState();
    getApiData();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        
        title: Text("cashrich API"),
      ),
      body: Column(
        children: [
          if (apiList != null)  
              getList()
        ],
      
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );

 }

 Widget getList(){
  return Expanded(
    child:ListView.builder(
      itemCount: apiList!.length,
      itemBuilder: (BuildContext context, int index){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Card(
            elevation: 5,
            child: Container(
              width: double.infinity,
              padding:EdgeInsets.fromLTRB(5, 10, 0, 10),
            child: Text("${apiList![index]}"), ),
          )
        ],
        );
      }
      ) ,);
 }
Future<void> getApiData() async{
  String url ="https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=BTC,ETHLTC";
  var result = await http.get(Uri.parse(url),headers: {'X-CMC_PRO_API_KEY': '27ab17d1-215f-49e5-9ca4-afd48810c149'});

 //

  apiList = jsonDecode(result.body)
  .map((data) => GetCashRichAPI.fromJson(data)) ;

  setState(() {
    
  });
}

}
