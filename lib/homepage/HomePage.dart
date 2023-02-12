import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pattern/cubits/internet_cubit.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: BlocConsumer<InternetCubit,InternetState>(
          listener: (context, state){
            if(state  == InternetState.Gained){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Internet Connected"), backgroundColor: Colors.green,));
            }else if(state == InternetState.Lost){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Internet Disconnected"), backgroundColor: Colors.green,));
            }
          },
          builder: (context, state){
            if(state == InternetState.Gained){
              return const Text("Connected");
            }else if(state == InternetState.Lost){
              return const Text("Not Connected");
            }else {
              return const Text("Loading...");
            }

          },
        ),
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
