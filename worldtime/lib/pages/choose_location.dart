import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLocation extends StatefulWidget{
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation>{

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi'),
    WorldTime(url: 'America/Chicago', location: 'Chicago'),
    WorldTime(url: 'America/New_York', location: 'New York'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(
      context, {
        'location': instance.location,
        'time': instance.time,
        'isDaytime': instance.isDaytime,
      }
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a location"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locations[index].location),
            ),
          );
        }),
    );
  }
}