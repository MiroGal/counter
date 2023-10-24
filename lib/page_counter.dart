import 'package:flutter/material.dart';

const int _maxCount = 50;
const int _minCount = 0;

const int _counterDivide1 = 10;
const int _counterDivide2 = 30;

const int _step1 = 1;

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
            _buildButtons(
              context,
              step: _step1,
              child: const Icon(Icons.play_arrow),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons(
    BuildContext context, {
    required int step,
    Widget? child,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Row(
        children: [
          _buildButton(
            context,
            onPressed: () => _decrementCounter(step),
            child: RotatedBox(
              quarterTurns: 2,
              child: child,
            ),
          ),
          const Spacer(),
          const Text('1'),
          const Spacer(),
          _buildButton(
            context,
            onPressed: () => _incrementCounter(step),
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    void Function()? onPressed,
    Widget? child,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
      child: child,
    );
  }

  void _incrementCounter(int step) {
    final int newValue = _counter + step;
    if (newValue <= _maxCount) {
      setState(() {
        _counter = _counter + 1;
      });
    }
  }

  void _decrementCounter(int step) {
    final int newValue = _counter - step;
    if (newValue >= _minCount) {
      setState(() {
        _counter = newValue;
      });
    }
  }

  String _setCounterLabelText() {
    if (_counter == _minCount) {
      return 'You Died';
    } else if (_counter <= _counterDivide1) {
      return 'You Are In Danger';
    } else if (_counter > _counterDivide1 && _counter <= _counterDivide2) {
      return 'Meh';
    } else {
      return 'Everything Is Ok';
    }
  }

  Color _setCounterValueColor() {
    if (_counter <= _counterDivide1) {
      return Colors.red;
    } else if (_counter > _counterDivide1 && _counter <= _counterDivide2) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }
}
