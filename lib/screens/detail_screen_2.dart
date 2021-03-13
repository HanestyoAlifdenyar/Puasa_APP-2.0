import 'package:flutter/material.dart';
import 'package:puasa_app/datas/data_puasa_2.dart';

class DetailScreen2 extends StatefulWidget {
  final DataPuasa2 dataPuasa2;

  const DetailScreen2({Key key, this.dataPuasa2}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen2> {
  DataPuasa2 _dataPuasa2;
  double _screenWidth;

  @override
  void initState() {
    _dataPuasa2 = widget.dataPuasa2;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _screenWidth = MediaQuery.of(context).size.width;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_dataPuasa2.title}'),
        backgroundColor: _dataPuasa2.materialColor,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Hero(
              tag: 'background' + _dataPuasa2.title,
              child: Container(
                color: _dataPuasa2.materialColor,
              ),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              height: 230.0,
              child: Hero(
                tag: 'image' + _dataPuasa2.title,
                child: Image.network(_dataPuasa2.image,
                    height: 80.0, fit: BoxFit.fitWidth),
              ),
            ),
            Positioned(
              top: 246.0,
              left: 16.0,
              width: _screenWidth - 64.0,
              child: Hero(
                tag: 'text' + _dataPuasa2.title,
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    _dataPuasa2.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16.0,
              top: 288.0,
              width: _screenWidth - 64.0,
              child: Hero(
                tag: 'subtitle' + _dataPuasa2.title,
                child: Material(
                  color: Colors.transparent,
                  child: Text(_dataPuasa2.description),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
