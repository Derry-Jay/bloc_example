import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/counter_bloc.dart';
import '../../../extensions/extensions.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({super.key});

  Widget blocBuilder(BuildContext context, int i) {
    return i.string.textWidget();
  }

  @override
  Widget build(BuildContext context) {
    final countBloc = context.getCounterBloc(true);
    return Scaffold(
      appBar: AppBar(title: 'Counter'.textWidget(), actions: [
        IconButton(
            icon: Icons.add.iconBuilder(), onPressed: countBloc.increment),
        IconButton(
            icon: Icons.remove.iconBuilder(), onPressed: countBloc.decrement)
      ]),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            'You have pushed the button this many times:'.textWidget(),
            BlocBuilder<CounterBloc, int>(builder: blocBuilder),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
