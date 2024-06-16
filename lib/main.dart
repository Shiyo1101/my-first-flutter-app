import 'package:flutter/material.dart';
import 'package:myapp/gen/assets.gen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void showRobotResult() {
    final List<String> choices = ['グー', 'チョキ', 'パー'];
    choices.shuffle();
    final String hand = choices.first;

    Image image;

    switch (hand) {
      case 'グー':
        image = Assets.images.jankenGu.image();
        break;
      case 'チョキ':
        image = Assets.images.jankenChoki.image();
        break;
      case 'パー':
        image = Assets.images.jankenPa.image();
        break;
      default:
        throw UnimplementedError();
    }

    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: const Text('ロボットくん'),
        content:
          image,
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showRobotResult();
          },
          child: const Text('じゃんけん'),
        ),
      ),
    );
  }
}
