import 'package:flutter/material.dart';

class FormInput extends StatefulWidget {
  const FormInput({super.key});

  @override
  State<FormInput> createState() {
    return _FormInput();
  }
}

class _FormInput extends State<FormInput> {
  final keyForm = GlobalKey<FormState>();

  void submit() {
    keyForm.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form input"),),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: keyForm,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Account"),
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                ),
                validator: (value) {
                  if(value!.trim().isEmpty) {
                    return "Fill Account";
                  }
                  return null;
                },
              ),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: submit, child: const Text("Submit")),
            ],
          ),
        ),
      ),
    );
  }

}