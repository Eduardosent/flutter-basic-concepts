import 'package:flutter/material.dart';

class ListPersons extends StatefulWidget {
  const ListPersons({super.key});

  @override
  State<ListPersons> createState() => _ListPersonsState();
}

class _ListPersonsState extends State<ListPersons> {
  List<Person> personas = [
    Person('Genry', 'm', 16),
    Person('Maria', 'f', 13),
    Person('Alex', 'm', 14),
    Person('Valeri', 'f', 15),
    Person('Denis', 'm', 19),
  ];

  int currentPage = 0;

  //final List<Widget> _widgets = [const Text('1'), const Text('2')];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      body: ListView.builder(
          itemCount: personas.length,
          itemBuilder: (context, index) {
            return ListTile(
              onLongPress: () {
                _borrarPersona(context, personas[index]);
              },
              leading: CircleAvatar(
                child: Text(personas[index].name.substring(0, 1)),
              ),
              title: Text(personas[index].name),
              subtitle: Text('${personas[index].age}'),
              trailing: const Icon(Icons.arrow_forward_ios),
            );
          }),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentPage = index;
            });
          },
          currentIndex: currentPage,
          items: const [
            BottomNavigationBarItem(label: '', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              label: '',
            ),
            BottomNavigationBarItem(label: '', icon: Icon(Icons.home)),
          ]),
    );
  }

  _borrarPersona(context, Person persona) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Eliminar Contacto'),
            content:
                Text('Estas seguro que deseas eliminar a ${persona.name} ?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('cancelar')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      personas.remove(persona);
                    });
                  },
                  child: const Text(
                    'borrar',
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          );
        });
  }
}

class Person {
  String name;
  String gender;
  int age;
  Person(this.name, this.gender, this.age);
}
