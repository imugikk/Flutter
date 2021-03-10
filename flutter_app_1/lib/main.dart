import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dicoding',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
//        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        fontFamily: 'Quicksand',
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;

//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        elevation: 4,
        leading: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.network(
              'https://d17ivq9b7rppb3.cloudfront.net/original/commons/new-ui-logo.png'
          ),
        ),
//        title: Text(widget.title),
      ),
      endDrawer: Drawer(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              MenuTile(title: 'Academy'),
              MenuTile(title: 'Challenge'),
              MenuTile(title: 'Event'),
              MenuTile(title: 'Job'),
              MenuTile(title: 'Developer'),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
          child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network('https://d17ivq9b7rppb3.cloudfront.net/original/commons/certificate_logo.png'),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Masuk',
                style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Center(child: Image.asset('images/illustration.png')),
              SizedBox(
                height: 16,
              ),
              Text(
                'Email',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Alamat Email',
                  focusedBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Password',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Theme(
                data: Theme.of(context).copyWith(primaryColor: Colors.grey),
                child: TextField(
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Password',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      ),
                    isDense: true,
                    )
                  ),
                ),
              SizedBox(height: 8),
              Text(
                'Lupa Password?',
                style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(decoration: TextDecoration.underline),
              ),
              SizedBox(height: 16),
              RaisedButton(
                color: Colors.pink,
                onPressed: (){},
                child: Text(
                  'Masuk',
                  style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Text(
                'Atau masuk dengan',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                    onPressed: (){},
                    color: Colors.white,
                    child: Image.network(
                        'https://pngimg.com/uploads/google/google_PNG19644.png',
                        width: 50,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              RichText(text: TextSpan(
                text: 'Belum punya akun? Ayo',
                style: Theme.of(context).textTheme.bodyText1,
                children: [
                  TextSpan(
                    text: 'Daftar',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              RichText(text: TextSpan(
                text: 'Dengan melakukan login, Anda setuju dengan ',
                style: Theme.of(context).textTheme.bodyText1,
                children: [
                  TextSpan(
                    text: 'syarat & ketentuan Dicoding',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ],
              ),),
            ],
          ),
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

  class MenuTile extends StatelessWidget {
    final String title;

    MenuTile({@required this.title});

    @override
    Widget build(BuildContext context){
      return ListTile(
        title: Text(
          title,
          style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          Icons.navigate_next,
          color: Colors.black,
        ),
      );
    }
  }

