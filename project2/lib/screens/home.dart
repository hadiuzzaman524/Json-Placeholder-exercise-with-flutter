import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/data/model.dart';
import 'package:project2/screens/second.dart';
import 'package:project2/widgets/button.dart';

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
          child: BlocConsumer<HelperCubit, HelperState>(
        listener: (ctx, state) {
          if (state is LoadedState) {
            final List<Welcome> list = welcomeFromJson(state.jsonBody);
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => SecondPage(list: list)));
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
      )),
    );
  }
}
