import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:listlogic/providerclass/provider_screen.dart';
import 'package:listlogic/screens/add_screen.dart';
import 'package:listlogic/screens/components_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: Consumer<DataClass>(
        builder: (BuildContext context, value, Widget? child) {
          log('message ${value.emptylist.length}');
          return value.emptylist.isEmpty
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
                            appText(text: path.name),
                            appText(text: path.age),
                            appText(text: path.category),
                            appText(text: path.jobtitle),
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
