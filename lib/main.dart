import 'package:flutter/material.dart';
import './pageviews/firstPage.dart';
import './pageviews/secondPage.dart';
import './pageviews/thirdPage.dart';

void main() => runApp(
  new MaterialApp(
  title: 'Startup Name Generator',
  theme: new ThemeData(
    primaryColor: Colors.white,
  ),
    home: new MyHomePage(),
  )
);

class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _MyHomePageState();
  }
}


class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  PageController controller;
  var currentPage=0;

  @override
  void initState() {
    super.initState();
    controller=new PageController(initialPage: this.currentPage);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new PageView(
        children: <Widget>[
          new FirstPage(),
          new SecondPage(),
          new ThirdPage()
        ],
        controller: controller,
        onPageChanged: (int position){
          setState(() {
            this.currentPage = position;
          });
        },
      ),
      bottomNavigationBar:
          new BottomNavigationBar(items: [
            new BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                title: new Title(
                    title:"列表",
                    color: Colors.white,
                    child: new Text("列表",style: new TextStyle(fontSize: 13.0)))
                ),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.message),
                title: new Title(
                    title:"通知",
                    color: Colors.white,
                    child: new Text("通知",style: new TextStyle(fontSize: 13.0)))
                ),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.cloud),
                title: new Title(
                    title:"我的",
                    color: Colors.white,
                    child: new Text("我的",style: new TextStyle(fontSize: 13.0)))
            )
          ],
            iconSize: 28.0,
            onTap: (int position){
              setState(() {
                controller.animateToPage(
                    position, duration: const Duration(milliseconds: 300),
                    curve: Curves.ease);
              });
            },
            currentIndex: currentPage,
            fixedColor: Colors.blue,
        )
    );
  }

}