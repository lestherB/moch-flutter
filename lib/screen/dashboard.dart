import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
              child: Text(
                'Sales',
                style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
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
                            border: InputBorder.none,
                            hintText: 'Name'
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Location'
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Item'
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Price'
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: (){Navigator.of(context).pop();},
                    child: Text('Add'),
                    
                  )
                ],
              );
            }
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,        
      ),
    );
  }
}