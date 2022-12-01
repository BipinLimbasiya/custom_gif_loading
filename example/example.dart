import 'package:custom_gif_loading/custom_gif_loading.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom GIF Loading',
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Add your GIF file with gif variable
  Image gif = Image.asset('assets/GIF/Spinner.gif');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Custom GIF Loading',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 34),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              //If click to button then loading is start.
              Loading(gif).start(context);
              Future.delayed(const Duration(seconds: 60), () {
                //After 5 second loding is stop.
                Loading.stop();
              });
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blueAccent,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Start Loding',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
          ),
        ),
      ),
    );
  }
}
