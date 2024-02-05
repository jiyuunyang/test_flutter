import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/bloc/bloc_events.dart';

class MyRepository {
  someFunc() {
    print('.........someFun....');
  }
}

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Consumer, Repository Test'),
            ),
            body: RepositoryProvider(
                create: (context) => MyRepository(),
                child: BlocProvider<BlocCounter>(
                  create: (context) => BlocCounter(),
                  child: MyWidget(),
                ))));
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BlocCounter counterBloc = BlocProvider.of<BlocCounter>(context);
    final MyRepository repository = RepositoryProvider.of<MyRepository>(context);
    return BlocConsumer<BlocCounter, int>(listenWhen: (previous, current) {
      return true;
    }, listener: (context, state) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(state.toString()),
        backgroundColor: Colors.blue,
      ));
    }, buildWhen: (previous, current) {
      print('previous : $previous, current : $current');
      return true;
    }, builder: (context, count) {
      return Container(
        color: Colors.deepOrange,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bloc: $count',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  counterBloc.add(IncrementEvent(1));
                  repository.someFunc();
                },
                child: Text('increment'),
              ),
              ElevatedButton(
                onPressed: () {
                  counterBloc.add(DecrementEvent(1));
                  repository.someFunc();
                },
                child: Text('decrement'),
              )
            ],
          ),
        ),
      );
    });
  }
}
