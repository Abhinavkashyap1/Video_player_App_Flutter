import 'package:flutter/material.dart';
import 'package:video_player_app/providers/video_provider.dart';
import 'package:video_player_app/screens/home_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VideoProvider(),
      child: MaterialApp(
        title: 'Flutter PiP Project',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(), // 👈 Set HomeScreen as the start
      ),
    );
  }
}

