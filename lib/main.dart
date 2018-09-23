import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'new_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: new ThemeData(
            primarySwatch: Colors.deepPurple,
            primaryColor: defaultTargetPlatform == TargetPlatform.iOS
                ? Colors.grey[50]
                : null),
        home: new HomePage(),
        routes: <String, WidgetBuilder>{
          "/page1": (BuildContext context) => new NewPage("New Page")
        }
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Drawer App"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Ravi Pate"),
              accountEmail: new Text("ravipatel84184@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Theme
                    .of(context)
                    .platform == TargetPlatform.iOS
                    ? Colors.deepPurple
                    : Colors.white,
                child: new Text(
                  "R",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              otherAccountsPictures: <Widget>[
                new CircleAvatar(
                  backgroundColor: Theme
                      .of(context)
                      .platform == TargetPlatform.iOS
                      ? Colors.deepPurple
                      : Colors.white,
                  child: new Text(
                    "A",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                new CircleAvatar(
                  backgroundColor: Theme
                      .of(context)
                      .platform == TargetPlatform.iOS
                      ? Colors.deepPurple
                      : Colors.white,
                  child: new Text(
                    "V",
                    style: TextStyle(fontSize: 20.0),
                  ),
                )
              ],
            ),
            new ListTile(
              title: new Text("Page 1"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
//                Navigator.of(context).pushNamed("/page1");
                Navigator.of(context).push(
                    new MaterialPageRoute(
                        builder: (BuildContext context)
                        => new NewPage("Page One")));
              }
            ),
            new ListTile(
              title: new Text("Page 2"),
              trailing: new Icon(Icons.arrow_downward),
                onTap: () {
                  Navigator.of(context).pop();
//                  Navigator.of(context).pushNamed("/page2");
                  Navigator.of(context).push(
                      new MaterialPageRoute(
                          builder: (BuildContext context)
                          => new NewPage("Page Two")));
                }
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body: new Container(
        child: new Center(
          child: new Text("Home Page"),
        ),
      ),
    );
  }
}
