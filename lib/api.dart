import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

Future<Album> fetchAlbum() async {
  final httpClient = HttpClient();
  final uri = Uri.parse(
      'https://api.steampowered.com/ISteamChartsService/GetMostPlayedGames/v1');
  final request = await httpClient.getUrl(uri);
  final response = await request.close();
  final responseBody = await response.transform(utf8.decoder).join();
  httpClient.close();

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(responseBody));
  } else {
    throw Exception('Failed to load album');
  }
}

class Album {
  final int rank;
  final int appid;
  final int last_week_rank;
  final int peak_in_game;

  const Album({
    required this.rank,
    required this.appid,
    required this.last_week_rank,
    required this.peak_in_game,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      rank: json['rank'] as int,
      appid: json['appid'] as int,
      last_week_rank: json['last_week_rank'] as int,
      peak_in_game: json['peak_in_game'] as int,
    );
  }
}

class Api extends StatefulWidget {
  const Api({Key? key}) : super(key: key);

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final album = snapshot.data!;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Rank: ${album.rank}'),
                    Text('App ID: ${album.appid}'),
                    Text('Last Week Rank: ${album.last_week_rank}'),
                    Text('Peak In Game: ${album.peak_in_game}'),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
