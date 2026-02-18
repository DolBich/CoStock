import 'package:auto_route/auto_route.dart';
import 'package:co_stock/data/local_storage/local_storage_impl/local_storage_service.dart';
import 'package:co_stock/domain/bases/session_manager.dart';
import 'package:co_stock/presentation/navigation/app_router.dart';
import 'package:flutter/material.dart';

/// Тут логикак перехода на эту страницу
/// Проверка прав
/// Query params
/// Добавление bloc
/// Кэширование
/// и другая логика, которая проходит перед странице
///
///
@RoutePage()
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title = 'CoStock'});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _logOut() {
    setState(() {
      LocalStorageService.removeAuth();
      SessionManager.id = null;
      context.router.replaceAll([const AuthRoute()]);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Image.asset('assets/images/logos/co_stock_logo.png'),
            Image.asset('assets/images/logos/co_stock_logo_transparent.png'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _logOut,
        label: const Text('Log out!'),
        icon: const Icon(Icons.logout_outlined),
      ),
    );
  }
}
