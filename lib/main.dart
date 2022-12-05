import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_shop/actions/actions.dart';
import 'package:redux_shop/middleware/store_middleware.dart';
import 'package:redux_shop/reducers/app_state_reducer.dart';
import 'package:redux_shop/ui/menu_screen.dart';
import 'model/app_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final store = Store<AppState>(
      appReducer,
      initialState: AppState.initial(),
    middleware:createStoreMiddleware()
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
         routes: {
            '/':(context){
              return MenuScreen(onInit: (){
                StoreProvider.of<AppState>(context).dispatch(LoadMenuAction());});
            }
         },
         /* home: MenuScreen(onInit:(){
            StoreProvider.of<AppState>(context).dispatch(LoadMenuAction());
          } ,),*/
        ));
  }
}

/*
class CounterIncrementAction{}

@immutable
class AppState{
  final int value;

  AppState({ this.value = 0});

  factory AppState.initial()=>AppState();

  AppState copyWith({ int? value}){
    return AppState(
      value:value??this.value,
    );
  }




}

final incrementReducer=combineReducers<int>([
  TypedReducer<int,CounterIncrementAction>(_increment)
]);

int _increment(int value,CounterIncrementAction action)=>++value;

AppState appReducer(state,action){
  return AppState(
    value: incrementReducer(state.value,action)
  );
}

class CounterConnector extends StatelessWidget {
  const CounterConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,_ViewModel>(
      converter: _ViewModel.fromStore,
        builder: (context,vm){
        return MyHomePage(value: vm.value, increase: vm.onIncrease,);
        }, );
  }
}

class _ViewModel{
  final int value;
  final VoidCallback onIncrease;

  _ViewModel({required this.value, required this.onIncrease});

  static _ViewModel fromStore(Store<AppState> store)=>_ViewModel(
      value:store.state.value,
          onIncrease: ()=>store.dispatch(CounterIncrementAction()),);
}


class MyApp extends StatelessWidget {
   MyApp({super.key});
  final store=Store<AppState>(
    appReducer,
    initialState: AppState.initial()
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(store: store, child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterConnector(),
    ));
  }
}

class MyHomePage extends StatelessWidget {
   MyHomePage({Key? key,
  required this.value,
     required this.increase,
   }) : super(key: key);
  int value;
  VoidCallback increase;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Redux counter'),),
      body: Center(
        child: Text(value.toString(),style: Theme.of(context).textTheme.headline4,),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        onPressed: increase,
      ),
    );
  }
}

*/
