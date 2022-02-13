import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonex/model/data_model.dart';

import '../cubit/helper_cubit.dart';
import '../cubit/helper_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Json Exercise"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<HelperCubit, HelperState>(
          builder: (context, state) {
            if (state is InitialState) {
              return ElevatedButton(
                onPressed: () async {
                  await BlocProvider.of<HelperCubit>(context).fetchData();
                },
                child: const Text("Fetch Data"),
              );
            }
            if (state is LoadingState) {
              return const CircularProgressIndicator();
            }
            if (state is LoadedState) {
              List<Information> list = informationFromJson(state.jsonBody);
              return ListView.builder(
                itemBuilder: (ctx, index) {
                  return ListTile(
                    title: Text(list[index].title),
                  );
                },
                itemCount: list.length,
              );
            } else if (state is ErrorState) {
              return Text(state.errorMessage);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
