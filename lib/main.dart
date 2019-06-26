import 'package:flutter_web/material.dart';
import 'package:flutter_web/foundation.dart';
import 'package:flutter_web/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomepage createState() => _MyHomepage();
}

class _MyHomepage extends State<MyHomePage> {
  final FocusNode _focusNode = FocusNode();
  String _message;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleKeyEvent(RawKeyEvent event) {
    setState(() {
      _message =
          'KeyName: ${event.logicalKey.debugName}  KeyId: ${event.logicalKey.keyId}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RawKeyboardListener Sample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RawKeyboardListener(
              focusNode: _focusNode,
              onKey: _handleKeyEvent,
              child: AnimatedBuilder(
                animation: _focusNode,
                builder: (BuildContext context, Widget child) {
                  if (!_focusNode.hasFocus) {
                    return GestureDetector(
                      onTap: () {
                        FocusScope.of(context).requestFocus(_focusNode);
                      },
                      child: Text('Tap to focus'),
                    );
                  }
                  return Text(_message ?? 'Press a key');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
