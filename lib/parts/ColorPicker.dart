import 'package:flutter/material.dart';
import 'package:dama_app/model/ColorModel.dart';
import 'package:provider/provider.dart';

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(        
        body:             
        GridView.count(
            crossAxisCount: 5, // 1行に表示する数
            crossAxisSpacing: 10.0, // 縦スペース
            mainAxisSpacing: 10.0, // 横スペース
            shrinkWrap: true,
            children: <Widget>[          
              IconButton(
                icon: Icon(Icons.lens, color: Colors.blue),
                iconSize: 70.0,
                onPressed: () {
                  Provider.of<ColorModel>(context, listen: false).setBlue();
                },
              ),
              IconButton(
                icon: Icon(Icons.lens, color: Colors.red),
                iconSize: 70.0,
                onPressed: () {
                  Provider.of<ColorModel>(context, listen: false).setRed();
                },
              ),
              IconButton(
                icon: Icon(Icons.lens, color: Colors.purple),
                iconSize: 70.0,
                onPressed: () {
                  Provider.of<ColorModel>(context, listen: false).setPurple();
                },
              ),
              IconButton(
                icon: Icon(Icons.lens, color: Colors.pink),
                iconSize: 70.0,
                onPressed: () {
                  Provider.of<ColorModel>(context, listen: false).setPink();
                },
              ),
              IconButton(
                icon: Icon(Icons.lens, color: Colors.orange),
                iconSize: 70.0,
                onPressed: () {
                  Provider.of<ColorModel>(context, listen: false).setOrange();
                },
              ),
              IconButton(
                icon: Icon(Icons.lens, color: Colors.cyan),
                iconSize: 70.0,
                onPressed: () {
                  Provider.of<ColorModel>(context, listen: false).setCyan();
                },
              ),
              IconButton(
                icon: Icon(Icons.lens, color: Colors.teal),
                iconSize: 70.0,
                onPressed: () {
                  Provider.of<ColorModel>(context, listen: false).setTeal();
                },
              ),
              IconButton(
                icon: Icon(Icons.lens, color: Colors.indigo),
                iconSize: 70.0,
                onPressed: () {
                  Provider.of<ColorModel>(context, listen: false).setIndigo();
                },
              ),
              IconButton(
                icon: Icon(Icons.lens, color: Colors.brown),
                iconSize: 70.0,
                onPressed: () {
                  Provider.of<ColorModel>(context, listen: false).setBrown();
                },
              ),
              IconButton(
                icon: Icon(Icons.lens, color: Colors.yellow),
                iconSize: 70.0,
                onPressed: () {
                  Provider.of<ColorModel>(context, listen: false).setYellow();
                },
              ),
            ]),
      );
}
