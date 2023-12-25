import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/gift.dart';

class ApiGifts extends StatefulWidget {
  const ApiGifts({super.key});

  @override
  State<ApiGifts> createState() => _ApiGiftsState();
}

class _ApiGiftsState extends State<ApiGifts> {
  var _listGifs;

  Future<List<Gif>> getGifs() async {
    final response = await http.get(Uri.parse(
        "https://api.giphy.com/v1/gifs/trending?api_key=X4u9FSv5ULpPeer4L3A40BtZ3SkeQtGS&limit=25&offset=0&rating=g&bundle=messaging_non_clips"));

    List<Gif> gifs = [];

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsondata = jsonDecode(body);

      for (var item in jsondata['data']) {
        gifs.add(
            Gif(item['title'], item['images']["fixed_width_small"]['url']));
      }
      return gifs;
    } else {
      throw Exception('Failed conection');
    }
  }

  @override
  void initState() {
    super.initState();
    _listGifs = getGifs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ApiGifts'),
        ),
        body: FutureBuilder(
            future: _listGifs,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.count(
                    crossAxisCount: 3, children: _gifs(snapshot.data));
              } else if (snapshot.hasError) {
                return const Text('Error');
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }

  List<Widget> _gifs(data) {
    List<Widget> gifs = [];
    for (var gif in data) {
      gifs.add(Card(
          child: Column(
        children: [
          Expanded(
              child: Image.network(
            gif.url,
            fit: BoxFit.fill,
          ))
        ],
      )));
    }
    return gifs;
  }
}
