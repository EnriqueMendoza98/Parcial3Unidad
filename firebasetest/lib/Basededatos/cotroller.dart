import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebasetest/Principal/formulario.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController nombre = TextEditingController();
  TextEditingController direccion = TextEditingController();
  TextEditingController telefono = TextEditingController();
  TextEditingController id = TextEditingController();

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("usuarios");
//**** select */
  create() async {
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

  update() async {
    try {} catch (e) {
      print(e);
    }
  }

  delete() async {
    try {} catch (e) {
      print(e);
    }
  }

  /*void getUsuarios() async {
    QuerySnapshot Usuarios = await collectionReference.get();
    if (Usuarios.docs.length != 0) {
      for (var documentos in Usuarios.docs) {
        print(documentos.data());
        //user.add(documentos.data());
      }
    }
  }*/

//insert

  // ignore: non_constant_identifier_names
  InsertarUsuario() async {
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

/*void actualizarUsuario() async {
  return collectionReference
      .doc('sQkvxE2Q3zGbPiSfY79y')
      .update({'ocupacion': 'Gerente'})
      .then((value) => print("Registro Actualizado"))
      .catchError((error) => print("Fallo en Actualizar registro:$error"));
}

void borrarUsuario() async {
  return collectionReference
      .doc('sQkvxE2Q3zGbPiSfY79y')
      .delete()
      .then((value) => print("Registro Borrado"))
      .catchError((error) => print("Fallo en Borrar registro:$error"));
}*/
  main() {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));
  }

  //final firebase= FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
