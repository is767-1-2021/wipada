import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       primarySwatch: Colors.blueGrey
      ),
      home: MyHomePage(title: 'NV'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

   Image cat = Image.asset(
    'assets/popcat2.png',
      width: 120,
  );
  Image cat1 = Image.asset(
    'assets/popcat1.png',
      width: 120,
  );
  Image cat2 = Image.asset(
    'assets/popcat2.png',
      width: 120,
  );

 
  void _incrementCounter() {
    setState(() {
      cat = cat2;
  _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      cat = cat1;
  _counter--;
    });
  }

  
  @override
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
               title: Text(widget.title),
      ),
      body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           cat,
             Text(
              'You have pushed the button this many times:',
            ),
                      Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green
                ),
                onPressed: _decreaseCounter,
               child: Text('Decrease'),
               ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red
                ),
                onPressed: _incrementCounter, 
                child: Text('Increase'),
                ),
            ]
            )       
           ],  
           ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.access_alarm_sharp),
      ), 
    );
  }
}


class SubmitButton extends StatelessWidget {
  final String buttonText;
  SubmitButton(this.buttonText);

  @override
  Widget build(BuildContext context) {
  return ElevatedButton(
    child: Text(this.buttonText),
    onPressed: (){
      print('Pressing');
    },
  );   
  }
}