import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebasetest/Basededatos/cotroller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Crea un Widget Form
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Crea una clase State correspondiente. Esta clase contendrá los datos relacionados con
// el formulario.
class MyCustomFormState extends State<MyCustomForm> {
  // Crea una clave global que identificará de manera única el widget Form
  // y nos permita validar el formulario
  //
  // Nota: Esto es un GlobalKey<FormState>, no un GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();
  TextEditingController nombre = TextEditingController();
  TextEditingController direccion = TextEditingController();
  TextEditingController telefono = TextEditingController();
  TextEditingController id = TextEditingController();

  get async => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crud Parcial"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: id,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Id Profesor"),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: nombre,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Nombre"),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: direccion,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Direccion"),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: telefono,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Telefono"),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      create();
                      id.clear();
                      nombre.clear();
                      direccion.clear();
                      telefono.clear();
                    },
                    child: Text("Crear")),
                ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.amber),
                    onPressed: () {
                      update();
                      id;
                      nombre;
                      direccion;
                      telefono;
                    },
                    child: Text("Actualizar")),
                ElevatedButton(
                    style:
                        TextButton.styleFrom(backgroundColor: Colors.redAccent),
                    onPressed: () {
                      delete();
                      id;
                      nombre;
                      direccion;
                      telefono;
                    },
                    child: Text("Eliminar")),
              ],
            )
          ],
        ),
      ),
    );
  }

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("Profesores");
  Future<void> create() {
//**** select */
    async;
    {
      return collectionReference
          .add({
            'id': id.text,
            'nombre': nombre.text,
            'direccion': direccion.text,
            'telefono': telefono.text,
          })
          .then((value) => print("Registro agregado"))
          .catchError((error) => print("Fallo en insertar registro:$error"));
    }
  }

  void update() {}

  void delete() {}
}
