import 'package:flutter/material.dart';

import 'stream/stream_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final MyStream _myStream = MyStream();

  @override
  void initState() {
    _myStream.addStreamData();
    super.initState();
  }

  @override
  void dispose() {
    _myStream.cancal();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Here The Steam Data : ',
            ),
            Text(
              '',
              style: Theme.of(context).textTheme.headline4,
            ),
            StreamBuilder(
                stream: _myStream.getSteamData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text("hey there is some error");
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  return Text(
                    "${snapshot.data}",
                  );
                }),
          ],
        ),
      ),
    );
  }
}
