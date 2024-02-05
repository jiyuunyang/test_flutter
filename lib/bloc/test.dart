import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/bloc/bloc_events.dart';
import 'package:test_flutter/bloc/bloc_observers.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('BlocObserver, BlocListener'),
            ),
            body: MultiBlocProvider(
              providers: [
                BlocProvider<BlocCounter>(
                  create: (context) => BlocCounter(),
                ),
                BlocProvider<UserBloc>(create: (context) => UserBloc())
              ],
              child: MyWidget(),
            )
        )
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BlocCounter counterBloc = BlocProvider.of<BlocCounter>(context);
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return MultiBlocListener(listeners: [
      BlocListener<BlocCounter, int>(
        listenWhen: (previous, current) {
          return true;
        },
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.toString()),
              backgroundColor: Colors.red,
            ),
          );
        },
      ),
      BlocListener<UserBloc, User?>(listener: (context, user) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(user!.name),
            backgroundColor: Colors.blue,
          ),
        );
      },)
    ], child: Container(
        color: Colors.deepOrange,
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<BlocCounter, int>(
                      buildWhen: (previous, current) {
                        return true;
                      },
                      builder: (context, count) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '${counterBloc.state}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Bloc: $count',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ElevatedButton(onPressed: () => counterBloc.add(IncrementEvent(2)),
                                child: const Text('increment')),
                            ElevatedButton(onPressed: () => counterBloc.add(DecrementEvent(2)),
                                child: const Text('decrement')),
                          ],
                        );
                      }
                  ),
                  BlocBuilder<UserBloc, User?>(builder: (context, user) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'user ${user?.name}, ${user?.address}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () => userBloc.add(CreateUserEvent(User('kkang', 'seoul'))),
                            child: const Text('create')),
                        ElevatedButton(
                            onPressed: () => userBloc.add(UpdateUserEvent(User('kim', 'busan'))),
                            child: const Text('update'))
                      ],
                    );
                  })
                ]
            )
        )
    ));
  }
}