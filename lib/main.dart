
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Генератор паролей',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Генератор паролей'),
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
  bool _chars = false;
  bool _Cchars = false;
  bool _numbers = false;
  bool _symbols = false;
  int _length = 0;
  String passw = "Пароль";
 
  String generatepassword(bool chars,bool cchars, bool numbers, bool symbols, int length) {
      String password = "";
      if (length<4) length = 4;

      while(password.length<length)
      {
      int rtype = Random().nextInt(4)+1;
      switch(rtype)
      {
      case 1:
      if(cchars==true)
      password = password + String.fromCharCode(Random().nextInt(26)+65);break;
      case 2:
      if(chars==true)
      password = password + String.fromCharCode(Random().nextInt(26)+97);break;
      case 3:
      if(numbers==true)
      password = password + String.fromCharCode(Random().nextInt(10)+48);break;
      case 4:
      if(symbols==true)
      password = password + String.fromCharCode(Random().nextInt(16)+33);break;

      }

      }
      setState(() {});
    return password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 100),
          height: 800,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: <Widget>[
              Row(
                  children: <Widget> [
                            Switch(
          value: _chars,
          onChanged: (bool value) {
            setState(() {
              _chars = value;
            });
          },
        ),
        Text("буквы"),

                  ],
              ),
              Row(
                  children: <Widget> [
                            Switch(
          value: _Cchars,
          onChanged: (bool value) {
            setState(() {
              _Cchars = value;
            });
          },
        ),
        Text("заглавные буквы"),

                  ],
              ),
                 Row(
                  children: <Widget> [
                            Switch(
          value: _numbers,
          onChanged: (bool value) {
            setState(() {
              _numbers = value;
            });
          },
        ),
        Text("числа"),

                  ],
              ),
                 Row(
                  children: <Widget> [
                            Switch(
          value: _symbols,
          onChanged: (bool value) {
            setState(() {
              _symbols = value;
            });
          },
        ),
        Text("специальные символы"),

                  ],
              ),

                 Row(
                  children: <Widget> [

        Text("количество символов"),

                  ],
              ),

TextFormField(
  
            onChanged: (text) {
              _length = int.parse(text);
        },
        decoration: InputDecoration(
          
            hintText: "Введите количество символов",
            fillColor: Colors.black12,
            filled: true
            ),
initialValue: '0',
  
),
TextField(
        readOnly: true,
        controller: TextEditingController(text: "$passw"),
        decoration: InputDecoration(
            hintText: "$passw",
            fillColor: Colors.black12,
            filled: true,
            ),
  
),

ElevatedButton(
          child: Text("Генерация", style: TextStyle(fontSize: 22)),
          onPressed:(){if(_chars == false && _Cchars == false && _numbers == false && _symbols == false) {} else {passw = generatepassword(_chars, _Cchars, _numbers, _symbols, _length);
          _chars = false; }}
      ),
            ],
          
          )
      )
      )
    );
  }
}
