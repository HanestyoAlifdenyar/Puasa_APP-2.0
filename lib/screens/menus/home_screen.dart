import 'package:flutter/material.dart';
import 'package:puasa_app/datas/data_puasa.dart';
import 'package:puasa_app/screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DataPuasa> _dataPuasaList = List<DataPuasa>();
  double _screenWidthAdjustment;

  @override
  void initState() {
    _dataPuasaList = DataPuasa().createDataPuasa();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _screenWidthAdjustment = MediaQuery.of(context).size.width - 48.0 - 64.0;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Puasa APP')),
      body: SafeArea(
        child: ListView.builder(
            itemExtent: 190.0,
            itemCount: _dataPuasaList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      fullscreenDialog: true,
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return DetailScreen(
                            dataPuasa: DataPuasa(
                                title: _dataPuasaList[index].title,
                                description: _dataPuasaList[index].description,
                                image: _dataPuasaList[index].image,
                                materialColor:
                                    _dataPuasaList[index].materialColor));
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
                        tag: 'background' + _dataPuasaList[index].title,
                        child: Container(
                          color: _dataPuasaList[index].materialColor,
                        ),
                      ),
                      Positioned(
                        top: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Hero(
                          tag: 'image' + _dataPuasaList[index].title,
                          child: Image.network(_dataPuasaList[index].image,
                              height: 80.0, fit: BoxFit.fitWidth),
                        ),
                      ),
                      Positioned(
                        top: 96.0,
                        left: 24.0,
                        width: _screenWidthAdjustment,
                        child: Hero(
                          tag: 'text' + _dataPuasaList[index].title,
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              _dataPuasaList[index].title,
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
                        width: _screenWidthAdjustment,
                        child: Hero(
                          tag: 'subTitle' + _dataPuasaList[index].title,
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              _dataPuasaList[index].description,
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
    );
  }
}
