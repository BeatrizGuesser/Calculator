import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String numero = '0';

  double primeiroNumero = 0.0;

  String operacao = '';

  void calcular(String tecla) {
    switch (tecla) {
      case '0':
      // setState(() {
      //   numero += tecla;
      //   double numeroDouble = double.parse(numero);
      //   numero = numeroDouble.toString();
      // });
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case ',':
        setState(() {
          numero += tecla;
          numero = numero.replaceAll(',', '.');
          if (numero.contains('.')) {
            // double numeroDouble = double.parse(numero);
            // numero = numeroDouble.toString();
          } else {
            int numeroInt = int.parse(numero);
            numero = numeroInt.toString();
          }
          numero = numero.replaceAll('.', ',');
        });
        break;

      case '+':
      case '-':
      case 'X':
      case '/':
        operacao = tecla;
        numero = numero.replaceAll(',', '.');
        primeiroNumero = double.parse(numero);
        numero = numero.replaceAll('.', ',');
        numero = '0';
        break;

      case '=':
        double resultado = 0.0;

        if (operacao == '/') {
          if (double.parse(numero) * 1 == 0) {
            print('ERRO: divisão por zero');
            return;
          }
        }

        if (operacao == '+') {
          resultado = primeiroNumero + double.parse(numero);
        }

        if (operacao == '-') {
          resultado = primeiroNumero - double.parse(numero);
        }

        if (operacao == 'X') {
          resultado = primeiroNumero * double.parse(numero);
        }

        if (operacao == '/') {
          resultado = primeiroNumero / double.parse(numero);
        }

        String resultadoString = resultado.toString();
        // 3
        // parte1 = 3, parte2 = 0

        List<String> resultadoPartes = resultadoString.split('.');

        if (int.parse(resultadoPartes[1]) * 1 == 0) {
          setState(() {
            numero = int.parse(resultadoPartes[0]).toString();
          });
        } else {
          setState(() {
            numero = resultado.toString();
          });
        }

        break;

      case 'AC':
        setState(() {
          numero = '0';
        });
        break;

      case '<X':
        setState(() {
          if (numero.length > 0) {
            numero = numero.substring(0, numero.length - 1);
          }
        });
        break;

      default:
        numero += tecla;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 195, 131, 207),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 195, 131, 207),
          title: const Center(
            child: Text(
              'Calculadora',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  numero,
                  style: const TextStyle(fontSize: 72),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calcular('AC'),
                  child: Image.asset(
                    'assets/images/iconsclear.png',
                    width: 80,
                  ),
                ),
                const Text('               '),
                const Text('               '),
                GestureDetector(
                  onTap: () => calcular('<X'),
                  child: Image.asset(
                    'assets/images/iconsseta.png',
                    width: 80,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular('7');
                  },
                  child: Image.asset(
                    'assets/images/icons7.png',
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('8'),
                  child: Image.asset(
                    'assets/images/icons8.png',
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('9'),
                  child: Image.asset(
                    'assets/images/icons9.png',
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('/'),
                  child: Image.asset(
                    'assets/images/iconsdiv.png',
                    width: 80,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calcular('4'),
                  child: Image.asset(
                    'assets/images/icons4.png',
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('5'),
                  child: Image.asset(
                    'assets/images/icons5.png',
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('6'),
                  child: Image.asset(
                    'assets/images/icons6.png',
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('X'),
                  child: Image.asset(
                    'assets/images/iconsmulti.png',
                    width: 80,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calcular('1'),
                  child: Image.asset(
                    'assets/images/numeroum.png',
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('2'),
                  child: Image.asset(
                    'assets/images/icons2.png',
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('3'),
                  child: Image.asset(
                    'assets/images/icons3.png',
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('-'),
                  child: Image.asset(
                    'assets/images/iconsmenos.png',
                    width: 80,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calcular('0'),
                  child: Image.asset(
                    'assets/images/icons0.png',
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular(','),
                  child: Image.asset(
                    'assets/images/iconsvir.png',
                    width: 65,
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('='),
                  child: Image.asset(
                    'assets/images/iconsigual.png',
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('+'),
                  child: Image.asset(
                    'assets/images/iconssoma.png',
                    width: 80,
                  ),
                ),
              ],
            ),
            const Text(''),
          ],
        ),
      ),
    );
  }
}
