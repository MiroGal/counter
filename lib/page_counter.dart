import 'package:flutter/material.dart';

const int _maxCount = 50;
const int _minCount = 0;

const int _countStep1 = 10;
const int _countStep2 = 30;

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
            Text(
              _setCounterLabelText(),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: _setCounterValueColor(),
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
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Row(
        children: [
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
        ],
      ),
    );
  }

  String _setCounterLabelText() {
    if (_counter == _minCount) {
      return 'You Died';
    } else if (_counter <= _countStep1) {
      return 'You Are In Danger';
    } else if (_counter > _countStep1 && _counter <= _countStep2) {
      return 'Meh';
    } else {
      return 'Everything Is Ok';
    }
  }

  Color _setCounterValueColor() {
    if (_counter <= _countStep1) {
      return Colors.red;
    } else if (_counter > _countStep1 && _counter <= _countStep2) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  void _incrementCounter() {
    final int newValue = _counter + 1;
    if (newValue <= _maxCount) {
      setState(() {
        _counter = _counter + 1;
      });
    }
  }

  void _decrementCounter() {
    final int newValue = _counter - 1;
    if (newValue >= _minCount) {
      setState(() {
        _counter = newValue;
      });
    }
  }
}
