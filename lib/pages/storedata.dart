//import 'dart:js_interop_unsafe';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreData extends StatefulWidget {
  const StoreData({super.key});

  @override
  State<StoreData> createState() => _StoreDataState();
}

class _StoreDataState extends State<StoreData> {
  var _points;

  getState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('points') == null) {
      setState(() {
        _points = 0;
      });
    } else {
      setState(() {
        _points = prefs.getInt('points');
      });
    }
  }

  increment() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _points++;
      prefs.setInt('points', _points);
    });
  }

  @override
  void initState() {
    super.initState();
    getState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences'),
      ),
      body: Center(
          child: Column(
        children: [
          Text(_points.toString()),
          FloatingActionButton.extended(
              label: const Text('increment'),
              tooltip: 'increment and save preferences',
              onPressed: increment)
        ],
      )),
    );
  }
}
