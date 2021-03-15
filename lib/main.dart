import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'main_view_model.dart';
import 'my_stateful_view_model_widget.dart';
import 'locator.dart';

void main() {
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.nonReactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.test),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              MyStatefulViewModelWidget(reactive: false),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => model.incCounter(),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
      viewModelBuilder: () => MainViewModel(),
    );
  }
}
