import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/helper_cubit.dart';
import '../screens/second.dart';

class FetchButton extends StatelessWidget {
  const FetchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
       await BlocProvider.of<HelperCubit>(context).fetchData();
      },
      child: const Text("Fetch Data"),
    );
  }
}
