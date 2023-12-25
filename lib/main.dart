import 'package:flutter/material.dart';
import 'package:login/pages/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 18, 250, 26)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: login());
  }
}

Widget login() {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('lib/assets/background.jpg'), fit: BoxFit.cover)),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          name(),
          campoUser(),
          campoPassword(),
          const Send(),
        ],
      ),
    ),
  );
}

Widget name() {
  return const Text("Sign In",
      style: TextStyle(
          fontSize: 40.0, color: Colors.white, fontWeight: FontWeight.bold));
}

Widget campoUser() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    child: const TextField(
      decoration: InputDecoration(
          hintText: "user", fillColor: Colors.white, filled: true),
    ),
  );
}

Widget campoPassword() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    child: const TextField(
      obscureText: true,
      decoration: InputDecoration(
          hintText: "password", fillColor: Colors.white, filled: true),
    ),
  );
}

class Send extends StatelessWidget {
  const Send({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Welcome()))
      },
      child: const Text("Enter"),
    );
  }
}
