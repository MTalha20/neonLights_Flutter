import 'package:flutter/material.dart';

class Neon extends StatelessWidget {
  
  Color firstShadow = Colors.redAccent;

  Color secondShadow = Colors.blueAccent;

  Color thirdShadow = Colors.greenAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: Center(child: Text("Neon Lights", style: TextStyle(letterSpacing: 12,),),),),
      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NeonText(text: "4th", color: firstShadow, hover: false ),
            NeonText(text:"January",color: secondShadow,hover: false),
            NeonText(text: "2023", color: thirdShadow,hover: false),
            ]), 
      ),
    );
  }
}

class NeonText extends StatefulWidget {

  late String text;
  late Color color;
  late bool hover;

  NeonText({required this.text, required this.color, required this.hover});

  @override
  State<NeonText> createState() => _NeonTextState();
}

class _NeonTextState extends State<NeonText> {
  @override
  Widget build(BuildContext context) {

  return Listener(
          onPointerUp: (event) {
              setState(() {
                widget.hover = false;
              });   
          },
          onPointerDown: (event){
            setState(() {
              widget.hover = true;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              boxShadow: [
                for(int i = 1; widget.hover ? i <= 8 : i <= 5; i++)
                  BoxShadow(
                  color: widget.color,
                  blurRadius: i*2,
                  blurStyle: BlurStyle.outer,
                  spreadRadius: -2
                ),
                ],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: widget.color, width: 2)
            ),
            child: Text(widget.text, style: TextStyle(color: Colors.white, 
            fontSize: 48,
            shadows: [
              for(int i = 1; widget.hover ? i<=8 : i<=5 ; i++)
              Shadow(
                color: widget.color,
                blurRadius: i * 3,
              ),
            ]), 
            ),
          ),
        );
}
}

