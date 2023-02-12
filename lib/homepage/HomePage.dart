import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pattern/blocs/internetBloc/internet_bloc.dart';
import 'package:flutter_bloc_pattern/blocs/internetBloc/internet_state.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: BlocConsumer<InternetBloc,InternetState>(
          listener: (context, state){
            if(state is InternetGainedState){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Internet is Connected"), backgroundColor: Colors.green,));
            }else if(state is InternetLostState){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Internet is Disconnected"), backgroundColor: Colors.green,));
            }
          },
          builder: (context, state){
            if(state is InternetGainedState){
              return const Text("Connected");
            }else if(state is InternetLostState){
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
