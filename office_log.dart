import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily:  'RobotoMono',
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  State <StatefulWidget> createState(){
    return new HomeState();
  }
}

class HomeState extends State<Home>{
  final TextEditingController _weightController = new TextEditingController();
  final TextEditingController _weightController2 = new TextEditingController();
  
  int radioValue=0;
  //double _finalResult = 0.0;
  //String _formattedText="";
  String _log="";
  var _lst = new List(100);
  var i=0;
  
  void loadlog(){
    DateTime today = new DateTime.now();
    String str_name=_weightController.text;
    String New_string=str_name;
    
    for( var i = 0 ; i < 20 - str_name.length; i++ ) { 
      New_string = New_string + " " ; 
    }
    
    String dateSlug ="${today.year.toString()}-${today.month.toString()}-${today.day.toString()} ${today.hour.toString()}:${today.minute.toString()}";
    setState(() {
     // _log +=_weightController.text +" "+ _weightController2.text+" "+ dateSlug + " ,";
      _lst[i]="["+ New_string +" "+ _weightController2.text+" "+ dateSlug + "]";
      i=i+1;
    });
     
    
  } 
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:new AppBar(
        title: new Text("office log app"),
          centerTitle:true,
        backgroundColor:Colors.black12,       
      ),
      
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment : Alignment.topCenter,
        child:new ListView(
          padding:const EdgeInsets.all(2.5),
          children: <Widget>[
            new Container(
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  
                  
                  new TextField(
                      controller:_weightController,
                      decoration: new InputDecoration(
                      labelText:'name',
                      icon: new Icon(Icons.person_outline), 
                         
                    ),
                  ),
                  
                  new Padding(padding: new EdgeInsets.all(5.0)),
                   new TextField(
                      controller:_weightController2,
                      decoration: new InputDecoration(
                      labelText:'phno',
                      icon: new Icon(Icons.person_outline), 
                         
                    ),
                  ),
                 new Padding(padding: new EdgeInsets.all(5.0)),

                 new Padding(padding: new EdgeInsets.all(5.0)),
                 //result text
                 //new Text("$_log",),
                  new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget>[
                        //button
                        FlatButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
                          padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueAccent,
                          onPressed: loadlog,
                          
                          child: Text(
                             "Enter",
                              style: TextStyle(fontSize: 20.0),
                              ),
                          ),
                      new Padding(padding: new EdgeInsets.all(5.0)),
                      ],
                 ),
                  
                new Text("${_lst[0]}\n${_lst[1]}\n${_lst[2]}\n${_lst[3]}\n${_lst[4]}\n${_lst[5]}\n${_lst[6]}\n")                  
                ], 
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  
}
