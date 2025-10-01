import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/business_logic/bloc/bloc/counter_bloc.dart';

class CounterBlocApp extends StatelessWidget {
  const CounterBlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => CounterBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: const Text('Bloc Demo'), centerTitle: true),
          body: const HomePage(),
        ),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            primary: Colors.deepPurple,
            secondary: Colors.amberAccent,
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const IncrementCounter(),
              BlocBuilder<CounterBloc, CounterState>(
                buildWhen:
                    (previous, current) =>
                        current is IncrementState ||
                        current is DecrementState ||
                        current is IncrementBy5State,

                builder: (context, state) {
                  return Text('${state.counter}');
                },
              ),
              const DecrementCounter(),
            ],
          ),
          const SizedBox(height: 20),
          const IncrementBy5Widget(),
        ],
      ),
    );
  }
}

class IncrementCounter extends StatelessWidget {
  const IncrementCounter({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<CounterBloc>().add(IncrementEvent());
      },
      child: const Icon(Icons.add),
    );
  }
}

class DecrementCounter extends StatelessWidget {
  const DecrementCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<CounterBloc>().add(DecrementEvent());
      },
      child: const Icon(Icons.remove),
    );
  }
}

class IncrementBy5Widget extends StatelessWidget {
  const IncrementBy5Widget({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<CounterBloc>().add(IncrementBy5Event());
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add_circle, semanticLabel: '5'),
          SizedBox(width: 10),
          Text('Increase the counter by 5'),
        ],
      ),
    );
  }
}
