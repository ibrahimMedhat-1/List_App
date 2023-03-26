import 'package:flutter/material.dart';



class ListApp extends StatefulWidget {
  const ListApp({Key? key}) : super(key: key);
  @override
  State<ListApp> createState() => _ListAppState();
}

class _ListAppState extends State<ListApp> {
  String name = '';
  bool isEnable = false;
  TextEditingController newName = TextEditingController();
  TextEditingController list = TextEditingController();
  List<String> names = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text(" List ")),
        backgroundColor: Colors.black,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
            child: Column(
                children: names
                    .map((listName) => Card(
                        color: Colors.blueGrey,
                        child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(8),
                                  child: Text(
                                    listName,
                                  ),
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                          child: const Icon(Icons.edit),
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: ((context) {
                                                  return AlertDialog(
                                                    content: SizedBox(
                                                      height: 120,
                                                      child: Column(
                                                        children: [
                                                          const Text('Editing'),
                                                          TextField(
                                                            controller: newName,
                                                          ),
                                                          ElevatedButton(
                                                              onPressed: () {
                                                                if (newName
                                                                        .text !=
                                                                    '') {
                                                                  names.remove(
                                                                      listName);
                                                                  listName =
                                                                      newName
                                                                          .text;
                                                                  names.add(
                                                                      listName);
                                                                  newName.text =
                                                                      '';
                                                                  setState(
                                                                      () {});
                                                                  return Navigator
                                                                      .pop(
                                                                          context);
                                                                }
                                                              },
                                                              child: const Text(
                                                                  'Save')),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }));
                                          }),
                                      InkWell(
                                        child: const Icon(Icons.delete),
                                        onTap: () {
                                          names.remove(listName);
                                          setState(() {});
                                        },
                                      )
                                    ])
                              ],
                            ))))
                    .toList())),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    content: SizedBox(
                  height: 120,
                  child: Column(children: [
                    const Text('Enter New Name'),
                    TextField(
                      controller: newName,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // list.text = newName.text;
                              name = newName.text;
                              if (name != '') {
                                names.add(name);
                              }
                              newName.text = '';
                              setState(() {});
                            },
                            child: const Text('Add'),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                return Navigator.pop(context);
                              },
                              child: const Text('Done')),
                        ])
                  ]),
                ));
              });
        },
        child: const Text(
          '+',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
