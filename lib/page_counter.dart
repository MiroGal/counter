import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

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
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: _setCounterColor(),
                    fontWeight: FontWeight.bold,
                    fontSize: 80,
                  ),
            ),
            _buildButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Row(
        children: [
          const SizedBox(width: 24),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const Spacer(),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 24),
        ],
      ),
    );
  }

  Color _setCounterColor() {
    if (_counter <= 10) {
      return Colors.red;
    } else if (_counter >= 11 && _counter <= 30) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  void _incrementCounter() {
    final int newValue = _counter + 1;
    if (newValue <= 50) {
      setState(() {
        _counter = _counter + 1;
      });
    }
  }

  void _decrementCounter() {
    final int newValue = _counter - 1;
    if (newValue >= 0) {
      setState(() {
        _counter = newValue;
      });
    }
  }
}
