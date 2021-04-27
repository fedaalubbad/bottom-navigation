import 'dart:io';

import 'package:flutter/material.dart';

import 'pages/favPage.dart';
import 'pages/newPage.dart';
import 'pages/profilePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String title;
  @override
  State<StatefulWidget> createState() => _DynamiceState('My Title');
}
////   عشان اوصل للمتغيرات في الكلاس الرئيسي بعرف نوع الحالة من نوع الكلاس الرئيسي
class _DynamiceState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  String title;
  _DynamiceState(this.title);
String title1='flutter login 1';
String title2='flutter login 2';
bool check=false;
List<BottomNavigationBarItem> itemesList=[
  BottomNavigationBarItem(icon: Icon( Icons.home),title: Text('home'),activeIcon:Icon( Icons.home)),
  BottomNavigationBarItem(icon: Icon( Icons.person),title: Text('profile'),activeIcon:Icon( Icons.person,)),
  BottomNavigationBarItem(icon: Icon( Icons.star),title: Text('fav'),activeIcon:Icon( Icons.star,)),
  BottomNavigationBarItem(icon: Icon( Icons.feedback),title: Text('chat'),activeIcon:Icon( Icons.feedback,))
];
int index=0;
String viewText='Home';

  TabController controller;
  @override
  initState(){
    super.initState();
    controller = TabController(vsync: this, length: 3);

  }
  List ProductsList=[
    {'name': 'MAKEUP',
      'products': [{'productName':'makeup1'},{'productName':'makeup2'},{'productName':'makeup3'},
      ]
    },
    {'name': 'CLOTHES',
      'products': [{'productName':'cloth1'},{'productName':'cloth2'},{'productName':'cloth3'},
      ]
    },
    {'name': 'FOOD',
      'products': [{'productName':'food1'},{'productName':'food2'},{'productName':'food3'},
      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
/////////////////////bottomNavBar
    // return Scaffold(
    //   drawer: Drawer(
    //    child: Column(
    //      children: [
    //        UserAccountsDrawerHeader(accountName: Text('omar'),
    //        accountEmail:Text('omar@gmail.com') ,
    //        currentAccountPicture: CircleAvatar(
    //          backgroundImage:NetworkImage('https://scontent.fgza6-1.fna.fbcdn.net/v/t31.18172-8/13613449_596313377209656_1688064465934823849_o.jpg?_nc_cat=104&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=AkzsxP3d2z0AX-6qPfI&_nc_ht=scontent.fgza6-1.fna&oh=497b66e312ec5151fa82f22113b8973f&oe=60A6F509'),
    //          backgroundColor: Platform.isAndroid?Colors.white:Colors.blue,
    //        ),),
    //        ListTile(
    //          title: Text('Home'),
    //          subtitle: Text('go to home'),
    //          onTap: (){
    //            title='Home';
    //            setState(() {
    //            });
    //            Navigator.of(context).pop();
    //          },
    //          leading: Icon(Icons.home),
    //          trailing: Icon(Icons.arrow_forward_ios),
    //        ),
    //        ListTile(
    //          title: Text('News'),
    //          subtitle: Text('go to news'),
    //          onTap: (){
    //            title='News';
    //            setState(() {
    //
    //            });
    //            Navigator.of(context).pop();
    //
    //          },
    //          leading: Icon(Icons.feedback),
    //          trailing: Icon(Icons.arrow_forward_ios),
    //        ),
    //        ListTile(
    //          title: Text('Favorites'),
    //          subtitle: Text('go to fav'),
    //          onTap: (){
    //            title='Favorites';
    //            setState(() {
    //
    //            });
    //            Navigator.of(context).pop();
    //
    //          },
    //          leading: Icon(Icons.favorite),
    //          trailing: Icon(Icons.arrow_forward_ios),
    //        ),
    //
    //      ],
    //    ),
    //   ),
    //   appBar: AppBar(
    //     title: Text('title'),
    //   ),
    //   body: Container(
    //     width: double.infinity,
    //     height: double.infinity,
    //     alignment: Alignment.center,
    //     color: Colors.teal,
    //     child: Text(
    //       // index==0?'Home':index==1?'Profile':index==2?'Favourites':'Chat',
    //       title,
    //       style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.white),
    //     ),
    //
    //     // child: Column(
    //     //   crossAxisAlignment: CrossAxisAlignment.stretch,
    //     //   mainAxisAlignment: MainAxisAlignment.center,
    //     //   children: <Widget>[
    //     //     Container(
    //     //       margin: EdgeInsets.all(16),
    //     //       child: Text(
    //     //         // check==true? title1:title2,
    //     //         title,style: TextStyle(fontSize: 20),textAlign: TextAlign.center,
    //     //       ),
    //     //     ),
    //     //      Container(
    //     //        margin: EdgeInsets.all(16),
    //     //        child: RaisedButton(
    //     //          padding: EdgeInsets.all(5),
    //     //          color: Colors.blue,
    //     //          child: Text('change Text',style: TextStyle(fontSize: 20,color: Colors.white,
    //     //                                            fontWeight: FontWeight.bold),),
    //     //          onPressed: (){
    //     //            setState(() {
    //     //              check=!check;
    //     //            });
    //     //          },
    //     //        ),
    //     //      )
    //     //   ],
    //     // ),
    //   ),
    // bottomNavigationBar: new Theme(
    // data: Theme.of(context).copyWith(
    // // sets the background color of the `BottomNavigationBar`
    // canvasColor: Colors.brown,
    // // sets the active color of the `BottomNavigationBar` if `Brightness` is light
    // primaryColor: Colors.red,
    // textTheme: Theme
    //     .of(context)
    //     .textTheme
    //     .copyWith(caption: new TextStyle(color: Colors.yellow))), // sets the inactive color of the `BottomNavigationBar`
    //
    // child: BottomNavigationBar(
    //     currentIndex: index,
    //     items:itemesList,
    //     onTap: (i){
    //       index=i;
    //       setState(() {});
    //     },
    //     selectedItemColor: Colors.teal,
    //     unselectedItemColor: Colors.grey,
    //     backgroundColor: Colors.blue,
    //   ),)
    // );

    ///////////////tabBar

    return  Scaffold(
        appBar:AppBar (title:Text('tabbar'),
          bottom: TabBar(
            controller: controller,
            tabs:ProductsList.map((e) => Tab(text:e['name'],)).toList(),
              // [
              //   Tab(child:Text('news'),icon:Icon( Icons.feedback),),
              //   Tab(child:Text('fav'),icon:Icon( Icons.favorite),),
              //   Tab(child:Text('profile'),icon:Icon( Icons.person),),
              // ]
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(

              ),
              ListTile(
                onTap: (){
                  controller.animateTo(0);
                  Navigator.pop(context);
                },
                title: Text('go home'),
              ),
              ListTile(
                onTap: (){
                  controller.animateTo(1);
                  Navigator.pop(context);
                },
                title: Text('go news'),
              ),
              ListTile(
                onTap: (){
                  controller.animateTo(2);
                  Navigator.pop(context);
                },
                title: Text('go fav'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:(){controller.animateTo(1);
          },
            child:Icon(Icons.favorite),
        ),
        body: TabBarView(
          controller: controller,
          children:
            // NewsPage(),
            // FavPage(),
            // ProfilePage(),
            ProductsList.map((e) {
              return ListView.builder(
                  itemBuilder: (contex,index){
                    List products=e['products'];
                    return Text(products[index]['productName']);
                   } ,
              itemCount: 3,
              );
            }).toList(),

        ),

    );
  }
}
class PageView extends
