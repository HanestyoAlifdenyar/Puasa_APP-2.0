import 'package:flutter/material.dart';
import 'package:puasa_app/datas/data_puasa.dart';

class DetailScreen extends StatefulWidget {
  final DataPuasa dataPuasa;

  const DetailScreen({Key key, this.dataPuasa}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  DataPuasa _dataPuasa;
  double _screenWidth;

  @override
  void initState() {
    _dataPuasa = widget.dataPuasa;
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
        title: Text('${_dataPuasa.title}'),
        backgroundColor: _dataPuasa.materialColor,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Hero(
              tag: 'background' + _dataPuasa.title,
              child: Container(
                color: _dataPuasa.materialColor,
              ),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              height: 230.0,
              child: Hero(
                tag: 'image' + _dataPuasa.title,
                child: Image.network(_dataPuasa.image,
                    height: 80.0, fit: BoxFit.fitWidth),
              ),
            ),
            Positioned(
              top: 246.0,
              left: 16.0,
              width: _screenWidth - 64.0,
              child: Hero(
                tag: 'text' + _dataPuasa.title,
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    _dataPuasa.title,
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
                tag: 'subtitle' + _dataPuasa.title,
                child: Material(
                  color: Colors.transparent,
                  child: Text(_dataPuasa.description),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
