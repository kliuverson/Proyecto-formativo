import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading ({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text(
              'Cargando...',
              style: TextStyle(fontSize: 17),
            )
          ]
        )

      )
    );
  }
}