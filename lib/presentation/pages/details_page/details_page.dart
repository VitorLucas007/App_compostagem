import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Adubo de palmeira'),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.network(
                    'https://media.wired.com/photos/59269cd37034dc5f91bec0f1/191:100/w_1280,c_limit/GoogleMapTA.jpg'),
              ),
              Container(
                height: 150,
                width: 350,
                color: Colors.grey,
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                height: 150,
                width: 350,
                color: Colors.grey,
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                height: 150,
                width: 350,
                color: Colors.grey,
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                height: 350,
                width: 350,
                color: Colors.green,
                child: Column(
                  children: [
                    ListTile(
                     
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
