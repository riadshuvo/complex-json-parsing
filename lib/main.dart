import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async{
  List _data = await getJSON();
  for(int i = 0; i<_data.length; i++){
    print("${_data[i]["address"]["geo"]["lat"]}");
  }
  runApp(
        new MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: new Text("Complex JSON Parsing"),
              backgroundColor:Colors.orangeAccent,
              centerTitle: true,
            ),
            body:  ListView.builder(
                itemCount: _data.length,
                itemBuilder: (BuildContext contex, int position){
                  return Column(
                    children: <Widget>[
                      Divider(height: 3.30),
                      ListTile(
                        title: Text("${_data[position]["name"]}"),
                        subtitle: Text("${_data[position]["address"]["street"]}"),
                        leading: CircleAvatar(
                          backgroundColor: Colors.orangeAccent,
                          child: Text(_data[position]["name"][0].toString()),
                        ),
                        onTap: () => print("id is: ${_data[position]["id"]} and phone number:${_data[position]["phone"]}"),
                      )

                    ],
                  );
                }
            )
          ),
        )
  );
}

Future<List> getJSON() async{
  String getUrl = "https://jsonplaceholder.typicode.com/users";
  http.Response response = await http.get(getUrl);

  return json.decode(response.body);
}