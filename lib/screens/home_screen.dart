import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:listlogic/providerclass/provider_screen.dart';
import 'package:listlogic/screens/add_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<DataClass>(context, listen: false).emptylist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TRIP'),
        centerTitle: true,
      ),
      body: Consumer<DataClass>(
        builder: (BuildContext context, value, Widget? child) {
          log('message ${value.emptylist.length}');
          return value.emptylist.length == 0
              ? const Center(
                  child: Text('No Data Right Now'),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: value.emptylist.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 11),
                  itemBuilder: (context, index) {
                    final path = value.emptylist[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(children: [
                                const TextSpan(
                                  text: 'Name :-  ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: path.name.toString(),
                                  style: const TextStyle(color: Colors.black),
                                )
                              ]),
                            ),
                            RichText(
                              text: TextSpan(children: [
                                const TextSpan(
                                    text: 'Age :-  ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text: path.age.toString(),
                                  style: const TextStyle(color: Colors.black),
                                )
                              ]),
                            ),
                            RichText(
                              text: TextSpan(children: [
                                const TextSpan(
                                    text: 'Category :-  ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text: path.category.toString(),
                                  style: const TextStyle(color: Colors.black),
                                )
                              ]),
                            ),
                            RichText(
                              text: TextSpan(children: [
                                const TextSpan(
                                    text: 'Job-Title :-  ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text: path.jobtitle.toString(),
                                  style: const TextStyle(color: Colors.black),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddScreen(),
              ),
            );
          }),
    );
  }
}
