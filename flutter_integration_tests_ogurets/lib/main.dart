import 'package:flutter/material.dart';
import 'package:flutter_integration_tests_ogurets/counter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _bloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return ApplicationBlocContext(
      child: MaterialApp(
        title: 'Counter App',
        home: MyHomePage(title: 'Counter App Home Page'),
      ),
      bloc: _bloc
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
//  final _bloc = CounterBloc();

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = ApplicationBlocContext.of(context).bloc;
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
          child: StreamBuilder(
              stream: bloc.application,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'You have pushed the button this many times:',
                      ),
                      Text(
                        '${snapshot.data}',
                        style: Theme.of(context).textTheme.display1,
                      )
                    ]);
              })),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            // Provide a Key to this the button. This allows us to find this
            // specific button and tap it inside the test suite.
            key: Key('increment'),
            onPressed: () => bloc.counterInc(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            // Provide a Key to this the button. This allows us to find this
            // specific button and tap it inside the test suite.
            key: Key('Decrement'),
            onPressed: () => bloc.counterDec(),
            tooltip: 'Increment',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class ApplicationBlocContext extends InheritedWidget {
  final CounterBloc bloc;

  ApplicationBlocContext({Key key,
    @required this.bloc,
    @required Widget child})
      :
        assert(bloc != null),
        assert(child != null),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  // walk up the widget tree to find this widget as it is the base widget for everything above the MaterialApp
  static ApplicationBlocContext of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ApplicationBlocContext);
  }
}
