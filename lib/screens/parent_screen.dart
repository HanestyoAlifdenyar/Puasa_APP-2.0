import 'package:flutter/material.dart';
import 'package:puasa_app/datas/data_puasa_2.dart';
import 'package:puasa_app/screens/detail_screen_2.dart';
import 'package:puasa_app/screens/menus/home_screen.dart';
import 'package:puasa_app/screens/menus/puasa_screen.dart';

class ParentScreen extends StatefulWidget {
  @override
  _ParentScreenState createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen> {
  List<DataPuasa2> _dataPuasaList2 = List<DataPuasa2>();
  double _screenWidthAdjustment2;

  @override
  void initState() {
    _dataPuasaList2 = DataPuasa2().createDataPuasa2();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _screenWidthAdjustment2 = MediaQuery.of(context).size.width - 48.0 - 64.0;
    super.didChangeDependencies();
  }

  int _lastSelected = 0;
  final List<Widget> menu = <Widget>[
    HomeScreen(),
    PuasaScreen(),
  ];

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hari2 Puasa')),
      body: SafeArea(
        child: ListView.builder(
            itemExtent: 190.0,
            itemCount: _dataPuasaList2.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      fullscreenDialog: true,
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return DetailScreen2(
                            dataPuasa2: DataPuasa2(
                                title: _dataPuasaList2[index].title,
                                description: _dataPuasaList2[index].description,
                                image: _dataPuasaList2[index].image,
                                materialColor:
                                    _dataPuasaList2[index].materialColor));
                      },
                      transitionsBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          Widget child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      }));
                },
                child: Card(
                  margin: EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 8.0),
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      Hero(
                        tag: 'background' + _dataPuasaList2[index].title,
                        child: Container(
                          color: _dataPuasaList2[index].materialColor,
                        ),
                      ),
                      Positioned(
                        top: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Hero(
                          tag: 'image' + _dataPuasaList2[index].title,
                          child: Image.network(_dataPuasaList2[index].image,
                              height: 80.0, fit: BoxFit.fitWidth),
                        ),
                      ),
                      Positioned(
                        top: 96.0,
                        left: 24.0,
                        width: _screenWidthAdjustment2,
                        child: Hero(
                          tag: 'text' + _dataPuasaList2[index].title,
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              _dataPuasaList2[index].title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 16.0,
                        top: 120.0,
                        width: _screenWidthAdjustment2,
                        child: Hero(
                          tag: 'subtitle' + _dataPuasaList2[index].title,
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              _dataPuasaList2[index].description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _lastSelected,
        type: BottomNavigationBarType.fixed,
        onTap: _selectedTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit), title: Text('Puasa')),
        ],
      ),
    );
  }
}
