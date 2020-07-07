import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themes_provider/counter_notifier.dart';
import 'package:themes_provider/fancy_fab.dart';
import 'package:themes_provider/theme_notifier.dart';
import 'package:themes_provider/themes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(Themes.lightTheme),
        ),
        ChangeNotifierProvider<CounterNotifier>(
          create: (_) => CounterNotifier(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      theme: Provider.of<ThemeNotifier>(context).getTheme,
      debugShowCheckedModeBanner: false,
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
  Flushbar _flushbar;

  void showMessage(String text, bool showUndo) {
    if (_flushbar != null && _flushbar.isShowing() && _flushbar.isDismissible)
      _flushbar.dismiss();

    _flushbar = Flushbar(
      message: text,
      messageText: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).accentColor,
        ),
      ),
      duration: Duration(seconds: 3),
      animationDuration: Duration(seconds: 2),
      backgroundGradient: LinearGradient(colors: [
        Theme.of(context).primaryColor,
        Theme.of(context).primaryColor.withOpacity(0.7),
      ]),
      shouldIconPulse: true,
      icon: Icon(
        Icons.track_changes,
        color: Theme.of(context).accentColor,
      ),
      mainButton: Row(
        children: [
          Icon(
            Icons.undo,
            color: Theme.of(context).accentColor,
          ),
          SizedBox(width: 8),
          Text(
            'UNDO',
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
      leftBarIndicatorColor: Theme.of(context).accentColor,
      onTap: (flushbar) {
        flushbar.dismiss();
        Provider.of<ThemeNotifier>(context).revertTheme();
      },
    )..show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.format_color_fill),
            color: Theme.of(context).accentColor,
            onPressed: () {
              Provider.of<ThemeNotifier>(context).nextTheme().then(
                    (value) => showMessage(value, true),
                  );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: Theme.of(context).primaryTextTheme.headline6,
              textAlign: TextAlign.center,
            ),
            Text(
              Provider.of<CounterNotifier>(context).value.toString(),
              style: Theme.of(context).primaryTextTheme.headline3,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: Provider.of<CounterNotifier>(context).decrease,
            tooltip: 'Decrease',
            child: Icon(
              Icons.remove,
              color: Theme.of(context).errorColor,
            ),
          ),
          SizedBox(height: 8),
          FancyFab(
            icon: Icons.add,
            onPressed: Provider.of<CounterNotifier>(context).increase,
            tooltip: 'Increase',
          ),
        ],
      ),
    );
  }
}
