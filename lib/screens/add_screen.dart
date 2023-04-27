import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:listlogic/providerclass/provider_screen.dart';
import 'package:provider/provider.dart';

import 'model_screen.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final formkey = GlobalKey<FormState>();

    final name = TextEditingController();
    final age = TextEditingController();
    final category = TextEditingController();
    final jobtitle = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Screen'),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              customField(
                controller: name,
                hinttext: 'name',
                onValidate: (value) {
                  if (value == null || value == '') {
                    return 'enter your name';
                  }
                  return null;
                },
              ),
              customField(
                controller: age,
                hinttext: 'age',
                onValidate: (value) {
                  if (value == null || value == '') {
                    return 'enter your age';
                  }
                  return null;
                },
              ),
              customField(
                controller: category,
                hinttext: 'category',
                onValidate: (value) {
                  if (value == null || value == '') {
                    return 'enter your category';
                  }
                  return null;
                },
              ),
              customField(
                controller: jobtitle,
                hinttext: 'job title',
                onValidate: (value) {
                  if (value == null || value == '') {
                    return 'enter your job title';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Consumer<DataClass>(
                builder: (context, value, child) {
                  return   ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                       value.addUserData(name.text, age.text, category.text, jobtitle.text);
                        Navigator.pop(context);
                      }

                    },
                    child: const Text('Submit'),
                  );
                },

              ),
            ],
          ),
        ),
      ),
    );
  }

  customField(
      {required TextEditingController controller,
      required String hinttext,
      required FormFieldValidator onValidate}) {
    return TextFormField(
      validator: onValidate,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: hinttext,
      ),
    );
  }
}
