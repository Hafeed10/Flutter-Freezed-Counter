import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_counter_app/counter/counter_bloc.dart';
import 'package:freezed_counter_app/counter/counter_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Counter-App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 11, 71, 151),
          ),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Counter App'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Background color of the AppBar
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white, // White title color
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  '${state.count}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
             tooltip: 'Decrement',
             onPressed: () {
               context.read<CounterBloc>().add(Decrement());
             },
             backgroundColor: Colors.blue[900], // Dark blue floating action button
             child: const Icon(
               Icons.remove,
               color: Colors.white, // Set icon color to white
             ),
           ),

          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(Increment());
            },
            tooltip: 'Increment',
            backgroundColor: Colors.blue[900], // Dark blue floating action button
            child: const Icon(
              Icons.add,
               color: Colors.white,
              ),
          ),
        ],
      ),
    );
  }
}
