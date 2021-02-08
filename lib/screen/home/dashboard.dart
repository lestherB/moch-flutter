import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moch/models/user.dart';
import 'package:moch/services/authService.dart';
import 'package:moch/services/database.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  
  final _auth = AuthService();
  String name,location,item,price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('MOCH'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              /*child: Text(
                'Sales',
                style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Roboto',
                ),
                */
                child: RaisedButton(
                  child: Text("Sign out"),
                  onPressed: ()async{
                    await _auth.signOut();
                  },
                ),
              ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Add Order'),
                  content: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Wrap(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: 'Name'
                            ),
                            onChanged: (val){
                              setState(() => name = val);
                            },
                          ),
                          TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: 'Location'
                            ),
                            onChanged: (val){
                              setState(() => location = val);
                            },
                          ),
                          TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: 'Item'
                            ),
                            onChanged: (val){
                              setState(() => item = val);
                            },
                          ),
                          TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: 'Price'
                            ),
                            onChanged: (val){
                              setState(() => price = val);
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () async{
                        //await DatabaseServices().sampleSaveData(name, location, item, price);
                        //Navigator.of(context).pop();
                        
                      },
                      child: Text('Add'),
                    )
                  ],
                );
              });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
