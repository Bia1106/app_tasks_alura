import 'package:flutter/material.dart';



class MyFirstWidget extends StatelessWidget {
  const MyFirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                color: Colors.blue,
                width: 300,
                height: 300,
              ),
              Container(
                color: Colors.black,
                width: 150,
                height: 150,
              ),
              Container(
                color: Colors.pinkAccent,
                width: 75,
                height: 75,
              ),
              Container(
                color: Colors.amberAccent,
                width: 37,
                height: 37,
              ),
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                color: Colors.amberAccent,
                width: 300,
                height: 300,
              ),
              Container(
                color: Colors.pinkAccent,
                width: 150,
                height: 150,
              ),
              Container(
                color: Colors.black,
                width: 75,
                height: 75,
              ),
              Container(
                color: Colors.blue,
                width: 37,
                height: 37,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.black,
                width: 50,
                height: 50,
              ),
              Container(
                color: Colors.amber,
                width: 50,
                height: 50,
              ),
              Container(
                color: Colors.red,
                width: 50,
                height: 50,
              ),
            ],
          ),
          Container(
            color: Colors.green,
            width: 300,
            height: 30,
            child: const Text(
              'Exemplo de texto',
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () => debugPrint('Apertou o botão'),
            child: const Text('Aperte o botão!'),
          ),
        ],
      ),
    );
  }
}

class MySecondWidget extends StatelessWidget {
  const MySecondWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.red,
                width: 100,
                height: 100,
              ),
              Container(
                color: Colors.orange,
                width: 100,
                height: 100,
              ),
              Container(
                color: Colors.yellow,
                width: 100,
                height: 100,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.green,
                width: 100,
                height: 100,
              ),
              Container(
                color: const Color.fromARGB(255, 88, 172, 241),
                width: 100,
                height: 100,
              ),
              Container(
                color: Colors.blue,
                width: 100,
                height: 100,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.purple,
                width: 100,
                height: 100,
              ),
              Container(
                color: Colors.pink,
                width: 100,
                height: 100,
              ),
              Container(
                color: Colors.white,
                width: 100,
                height: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
