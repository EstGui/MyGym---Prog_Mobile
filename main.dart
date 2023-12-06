import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

int idade = 20;
int peso = 75;
int altura = 170;
int objetivo = 3;

int tmb = calculaTMB(peso, altura, idade);
int cal = tmb;

int calculaCal() {
  tmb = calculaTMB(peso, altura, idade);
                                                                

  return cal;
}

int calculaTMB(peso, altura, idade) {
  int tmb = (88.362 + (13.397*peso)+(4.799*altura)-(5.677*idade)).round();

  return tmb;
}

int calculaCarb(tmb) {
  return (tmb * 0.45 / 4).round();
}

int calculaProt(tmb) {
  return (tmb * 0.25 / 4).round();
}

int calculaGord(tmb) {
  return (tmb * 0.3 / 9).round();
}

int carboidrato = calculaCarb(tmb);
int proteina = calculaProt(tmb);
int gordura = calculaGord(tmb);

int calculaDieta(objetivo, tbm) {
  cal = calculaTMB(peso, altura, idade);
  if (objetivo == 1) {
    tmb = (tmb * 0.9).round();
  } else if (objetivo == 2) {
    tmb = (tmb * 1.4).round();
  } else {
    tmb = tbm;
  }

  return tmb;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      body: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 128),
            Image.asset(
                  '../assets/images/mygym_logo.png',
                  width: 200,
                ),
            const SizedBox(height: 128),
            TextField(
              controller: _loginController,
              decoration: const InputDecoration(labelText: 'Email', 
              labelStyle: TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white),
            ),
            TextField(
              obscureText: true,
              controller: _senhaController,
              decoration: const InputDecoration(labelText: 'Senha',
              labelStyle: TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 128),
            ElevatedButton(
              onPressed: () {
               Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelecionaObjetivo(),
                ),
              );
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFF5A405),
                onPrimary: Colors.black,
            ),
              child: const Text('Login'),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CadastroPag(),
                ),
              );

              },
              child: const Text('Realizar Cadastro', 
              style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}


class SelecionaObjetivo extends StatefulWidget {
  @override
  _SelecionaObjetivoState createState() => _SelecionaObjetivoState();
  int selecao = 0;
  bool secEmagrecer = false;
  bool secGanhar = false;
  bool secManter = false;

}

class _SelecionaObjetivoState extends State<SelecionaObjetivo> {
  int selecao = 0;
  bool secEmagrecer = false;
  bool secGanhar = false;
  bool secManter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 64),
            Image.asset(
                  '../assets/images/objetivo.png',
                  width: 300,
                ),
            const SizedBox(height: 48),
            GestureDetector(
              onTap: () {
                selecao = 1;
                objetivo = 1;
                setState(() {
                  secEmagrecer = true;
                  secGanhar = false;
                  secManter = false;
                });
              },
              child: Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: secEmagrecer ? Border.all(
                  color: const Color(0xFFF5A405),
                  width: 2.0,
                ) : null,
              ),
                child: Image.asset('../assets/images/Emagrecer.png'),
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
             onTap: () {
                selecao = 2;
                objetivo = 2;
                setState(() {
                  secEmagrecer = false;
                  secGanhar = true;
                  secManter = false;
                });
              },
              child: Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: secGanhar ? Border.all(
                  color: const Color(0xFFF5A405),
                  width: 2.0,
                ) : null,
              ),
                child: Image.asset('../assets/images/ganhar.png'),
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                selecao = 3;
                objetivo = 3;
                setState(() {
                  secEmagrecer = false;
                  secGanhar = false;
                  secManter = true;
                });
              },
              child: Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: secManter ? Border.all(
                  color: const Color(0xFFF5A405),
                  width: 2.0,
                ) : null,
              ),
                child: Image.asset('../assets/images/manter.png'),
              ),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {
              cal = calculaDieta(objetivo, calculaTMB(peso, altura, idade));
               Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Dieta(),
                ),
              );
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFF5A405),
                onPrimary: Colors.black
            ),
              child: const Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }
}

class CadastroPag extends StatelessWidget {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmaSenhaController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      body: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 16),
            Image.asset(
                  '../assets/images/cadastro.png',
                  width: 200,
                ),
            const SizedBox(height: 24),


            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome completo', 
              labelStyle: TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white),
            ),
            TextField(
              controller: _cpfController,
              decoration: const InputDecoration(labelText: 'CPF',
              labelStyle: TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email', 
              labelStyle: TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white),
            ),
            TextField(
              obscureText: true,
              controller: _senhaController,
              decoration: const InputDecoration(labelText: 'Insira sua senha',
              labelStyle: TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white),
            ),
            TextField(
              obscureText: true,
              controller: _confirmaSenhaController,
              decoration: const InputDecoration(labelText: 'Confirme sua senha',
              labelStyle: TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white),
            ),

            const SizedBox(height: 32),

            const Divider(
              color: Color(0xFFF5A405)
            ),
            const SizedBox(height: 16),
            
            Image.asset(
                  '../assets/images/informacoes.png',
                  width: 200,
                ),

            const SizedBox(height: 16),

            TextField(
              controller: _idadeController,
              decoration: const InputDecoration(labelText: 'Idade', 
              labelStyle: TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white),
            ),
            TextField(
              controller: _pesoController,
              decoration: const InputDecoration(labelText: 'Peso (Kg)',
              labelStyle: TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white),
            ),
            TextField(
              controller: _alturaController,
              decoration: const InputDecoration(labelText: 'Altura (cm)',
              labelStyle: TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white),
            ),

            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {
                idade = int.parse(_idadeController.text);
                peso = int.parse(_pesoController.text);
                altura = int.parse(_alturaController.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelecionaObjetivo(),
                  ),
              );
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFF5A405),
                onPrimary: Colors.black,
            ),
              child: const Text('Finalizar'),
            ),
          ],
        ),
      ),
    );
  }
}


class Dieta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      body: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 32),
            Text('${cal}Kcal', style: TextStyle(fontSize: 64, color: Colors.white)),
            const SizedBox(height: 16),

            const Divider(
              color: Color(0xFFF5A405)
            ),
            const SizedBox(height: 40),
            
            Image.asset(
                  '../assets/images/aaa.png',
                ),
            const SizedBox(height: 32),
            const Divider(
              color: Color(0xFFF5A405)
            ),
            const SizedBox(height: 70),
            Text('Carboidrato: ${calculaCarb(tmb)}g por dia', style: TextStyle(color: Colors.white)),
            Text('Proteína: ${calculaProt(tmb)}g por dia', style: TextStyle(color: Colors.white)),
            Text('Gordura: ${calculaGord(tmb)}g por dia', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 70),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CadastroPag(),
                  ),
              );
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFF5A405),
                onPrimary: Colors.black,
            ),
              child: const Text('Cadastro'),
            ),
          ],
        ),
      ),
    );
  }
}