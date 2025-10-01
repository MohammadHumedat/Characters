import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/business_logic/cubit/counter_cubit/counter_cubit.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title:const Text('Cubit Demo'), centerTitle: true),
        body: HomePage(),
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: Colors.deepPurple,
          secondary: Colors.amberAccent,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IncrementButton(), // + button
                BlocConsumer<CounterCubit, CounterState>(
                  listener: (context, state) {
                    if (state is IncrementCounter && state.counter >6) {
                      showAlert(context, "The counter is over 6");
                    }
                    
                  },
                  builder: (context, state) {
                    if (state is DecrementCounter) {
                      return Text(
                        " ${state.counter}",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      );
                    } else if (state is IncrementCounter) {
                      return Text(
                        "${state.counter}",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      );
                    } else if (state is ErrorCounter) {
                      return Text(
                        state.message,
                        style: const TextStyle(color: Colors.red, fontSize: 18),
                      );
                    } else {
                      return Text(
                        "0",
                        style: Theme.of(context).textTheme.titleLarge,
                      );
                    }
                  },
                ),
                DecrementButton(), // - button
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class IncrementButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: const Icon(Icons.add),
      onPressed: () {
        context.read<CounterCubit>().incrementCounter();
      },
    );
  }
}

class DecrementButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: const Icon(Icons.remove),
      onPressed: () {
        context.read<CounterCubit>().decrementCounter();
      },
    );
  }
}


void showAlert(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Warning'),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}