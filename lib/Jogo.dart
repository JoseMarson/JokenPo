import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _result = "";
  var _imagemApp = AssetImage("images/padrao.png");
  void _opcaoSelecionada(String escolhaUsuario){
    var opcoes =["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch(escolhaApp){
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
      setState(() {
        this._imagemApp = AssetImage("images/papel.png");
      });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }
    if(
    (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
    (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
    (escolhaUsuario == "papel" && escolhaApp == "pedra")
    ){
      setState(() {
        this._result = "Parabéns!!! Você ganhou.";
      });
    }else if(
    (escolhaUsuario == "pedra" && escolhaApp == "papel") ||
    (escolhaUsuario == "tesoura" && escolhaApp == "pedra") ||
    (escolhaUsuario == "papel" && escolhaApp == "tesoura")
    ){
      setState(() {
        this._result = "Infelizmente, você perdeu.";
      });
    }else{
      setState(() {
        this._result = "Empate!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child:
              Text("Escolha do App:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),

              ),
          ),
          Image(image: this._imagemApp,),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child:
              Text("Faça sua escolha:",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("images/pedra.png", height: 100,) ,
              ),
              GestureDetector(
                  onTap: () => _opcaoSelecionada("papel"),
                  child: Image.asset("images/papel.png", height: 100,),
              ),
              GestureDetector(
                  onTap: () => _opcaoSelecionada("tesoura"),
                  child: Image.asset("images/tesoura.png", height: 100,),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child:
            Text(_result,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          )


        ],
      ),
    );
  }
}
