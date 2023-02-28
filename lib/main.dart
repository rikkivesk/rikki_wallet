import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  //runApp(const MyApp());
  runApp(MyFirstApp());
}

class MyFirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyFirstAppState();
  }
}

class _MyFirstAppState extends State<MyFirstApp> {
  late int _totalPrice; // итоговая цена
  late int _income; // доходы
  late int _expenses; // расходы

  final _inputController = TextEditingController(); // предоставляет доступ к значениям из полей
  @override
  void dispose() {
    // очищает значение в контроллере
    _inputController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // этот метод переопределяет переменные, находящиеся внутри объекта State
    _totalPrice = 0;
    _income = 0;
    _expenses = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('rikki wallet'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('$_totalPrice: ', style: TextStyle(fontSize: 30)),
                        const Text(
                          'рублей',
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Text('расходы'),
                          Text('$_expenses'),
                        ],
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Column(
                        children: [
                          const Text('доходы'),
                          Text('$_income'),
                        ],
                      ),
                    ],
                  ),
                ),
                TextField(
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  controller: _inputController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "введите сумму",
                    contentPadding: EdgeInsets.all(50),

                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          inputInfoMinus();
                          //_totalPrice -= 100;
                          //_expenses += 100;
                          //Text('input: $_inputController');

                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          inputInfoPlus();
                          //_totalPrice += 100;
                          //_income += 100;
                          //Text('input: $_inputController');
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void inputInfoPlus() {
    //print('data: $_inputController.text');\
    _totalPrice += int.parse(_inputController.text);
    _income += int.parse(_inputController.text);
  }
  void inputInfoMinus() {
    _totalPrice -= int.parse(_inputController.text);
    _expenses += int.parse(_inputController.text);
  }
}

