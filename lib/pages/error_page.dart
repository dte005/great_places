import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String errorMessage;
  const ErrorPage({super.key, required this.errorMessage});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Houve um erro de execução!",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                errorMessage,
                style: TextStyle(color: Colors.indigo, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
