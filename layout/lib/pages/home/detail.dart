import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final v1, v2, v3, v4;
  DetailPage(this.v1, this.v2, this.v3, this.v4);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var _v1, _v2, _v3, _v4;

  @override
  void initState() {
    super.initState();
    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;
    _v4 = widget.v4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_v1)),
      body: Container(
        child:  ListView(children: [ContentDetail(_v3, _v1, _v4)],)
      )

    );
  }
// ContentDetail(_v3, _v1, _v4)
  @override
  Widget ContentDetail(String _v3, String _v1, String _v4) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      child: Column(  
        children: [
          Text(_v1, 
            style: TextStyle(
                fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            _v4,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),

          Image.network(_v3)
          
        ],
      
      ),
      
    );
  }
}
