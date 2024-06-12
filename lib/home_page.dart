import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter_flutter/counter_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // variable

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterModel>(
        builder: (context, value, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text(widget.title),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("You pushed the button this many times"),
                    Text(
                      value.count.toString(),
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(
                      value.count.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),

                    // button
                    ElevatedButton(
                      onPressed: () {
                        // get acces
                        final counter = context.read<CounterModel>();

                        counter.increment();
                      },
                      child: Text("Increment!"),
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    final counter = context.read<CounterModel>();

                    counter.increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add)),
            ));
  }
}
