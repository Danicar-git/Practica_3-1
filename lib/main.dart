import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Recuperar el valor d\'un camp de text',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});
  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar el valor d\'un camp de text'),
      ),
      // Columna Body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: myController,
              decoration: const InputDecoration(
                labelText: 'Escriu el text aquí',
              ),
            ),
            const SizedBox(height: 20),

            // Primer boton AlertDialog
            ElevatedButton(
              child: const Text('Utilizar AlertDialog'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: const Color.fromARGB(255, 162, 210, 244),
                      surfaceTintColor: Colors.transparent,
                      title: const Text('AlertDialog'),
                      content: Text(myController.text),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 10),

            // Segundo boton SimpleDialog
            ElevatedButton(
              child: const Text('Utilizar SimpleDialog'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      backgroundColor: const Color.fromARGB(255, 234, 244, 162),
                      title: const Text('SimpleDialog'),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text(myController.text),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 10),

            // Tercer boton SnackBar
            ElevatedButton(
              child: const Text('utilizar SnackBar'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: const Color.fromARGB(255, 128, 252, 186),

                    content: Text(
                      myController.text,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                    action: SnackBarAction(
                      label: 'Cerrar', 
                      textColor: Color.fromARGB(255, 0, 0, 0),
                      onPressed: () {}),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),

            // Cuarto boton Modal BottomSheet
            ElevatedButton(
              child: const Text('Utilizar BottomSheet'),
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 112, 224),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                          ),
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(myController.text),
                                ElevatedButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('Cerrar BottomSheet'),
                                )
                              ],
                            ),
                          ));
                    });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: null,
    );
  }
}