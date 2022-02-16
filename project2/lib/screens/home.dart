import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/cubits/counter_cubit.dart';
import 'package:project2/data/model.dart';
import 'package:project2/screens/second.dart';
import 'package:project2/widgets/button.dart';

import '../cubits/counter_state.dart';
import '../cubits/helper_cubit.dart';
import '../cubits/helper_state.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Manager"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(builder: (ctx){
              final state= ctx.watch<CounterCubit>().state;
              return Text(
                "With Context.watch: ${state.count}",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              );
            }),
           const Divider(),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(
                  "With BlockBuilder: ${state.count}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                );
              },
            ),
            const Divider(),
            Center(
              child: BlocConsumer<HelperCubit, HelperState>(
                listener: (ctx, state) {
                  if (state is LoadedState) {
                    final List<Welcome> list = welcomeFromJson(state.jsonBody);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => BlocProvider.value(
                                  value: BlocProvider.of<CounterCubit>(context),
                                  child: SecondPage(list: list),
                                )));
                  }
                },
                builder: (context, state) {
                  if (state is InitialState) {
                    return const FetchButton();
                  }
                  if (state is LoadingState) {
                    return const CircularProgressIndicator();
                  }
                  if (state is ErrorState) {
                    return Text(state.errorMessage);
                  }
                  return const FetchButton();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<CounterCubit>(context).increment();

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
