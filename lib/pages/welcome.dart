import 'package:flutter/material.dart';
import 'package:login/pages/storedata.dart';
import 'list.dart';
import 'apigifts.dart';
import 'animations.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('regresar'),
          ),
          ElevatedButton(
            onPressed: () => mostrarDialog(context),
            child: const Text('show Dialog'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ListPersons())),
            child: const Text('show Persons'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ApiGifts())),
            child: const Text('api gifts'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Animations())),
            child: const Text('animations'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const StoreData())),
            child: const Text('carrousel'),
          ),
        ],
      )),
    );
  }
}

void mostrarDialog(BuildContext context) {
  showDialog(
      //barrierDismissible: false,
      //barrierColor: Colors.amber,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Basic dialog title'),
          content: const Text(
            'A dialog is a type of modal window that\n'
            'appears in front of app content to\n'
            'provide critical information, or prompt\n'
            'for a decision to be made.',
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('acept')),
            TextButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'reject',
                  style: TextStyle(color: Colors.white),
                )),
          ],
        );
      });
}

class Person {
  String name;
  String gender;
  int age;
  Person(this.name, this.gender, this.age);
}
