import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget{
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading>{

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', url: 'Europe/Berlin');
    await instance.getTime();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
    });
  }

  @override 
  void initState(){
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: SpinKitRotatingCircle(color: Colors.black,
        size: 50.0)
      ),
    );
  }
}