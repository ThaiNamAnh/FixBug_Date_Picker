import 'package:datepicker/form_input.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton.icon(
              onPressed: () {
                showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2010),
                  lastDate: DateTime(2030),
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        primaryColor: Colors.teal, // Màu chính của date picker
                        buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
                        colorScheme: const ColorScheme
                          .light(primary: Colors.teal)
                          .copyWith(secondary: Colors.teal), // Định dạng nút
                      ),
                      child: child!,
                    );
                  },
                );
              },
              icon: const Icon(Icons.add),
              label: const Text("Calender"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const FormInput()));
              }, 
              child: const Text("Add form"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
