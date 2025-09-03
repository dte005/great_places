import 'package:flutter/material.dart';
import 'package:great_places/providers/auth_provider.dart';
import 'package:provider/provider.dart';

const List<Color> indigoGradient = [
  Color.fromRGBO(232, 234, 246, 1), // tom 1: bem claro (lavanda/indigo 50)
  Color.fromRGBO(197, 202, 233, 1), // tom 2: claro (indigo 200)
  Color.fromRGBO(121, 134, 203, 1), // tom 3: médio (indigo 400)
  Color.fromRGBO(63, 81, 181, 1), // tom 4: principal (indigo 500)
  Color.fromRGBO(48, 63, 159, 1), // tom 5: mais profundo (indigo 700)
];

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  final Map<String, String> _authData = {'email': '', 'password': ''};
  final GlobalKey<FormState> _formKey = GlobalKey();

  bool _isLoading = false;

  void _showErrorDialog(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Ocorreu um erro"),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Fechar', style: TextStyle(color: Colors.indigo)),
          ),
        ],
      ),
    );
  }

  Future<void> _onSubmit() async {
    final bool isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    _formKey.currentState?.save();
    setState(() {
      _isLoading = true;
    });

    try {
      AuthProvider authProvider = Provider.of<AuthProvider>(
        context,
        listen: false,
      );
      authProvider.login(_authData['email']!, _authData['password']!);
    } catch (e) {
      _showErrorDialog('Ocorreu um erro inesperado: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: indigoGradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 45, color: Colors.white),
                    ),
                  ),
                  Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SizedBox(
                        width: screenWidth * 0.75,
                        child: Column(
                          children: <Widget>[
                            Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Colors.white,
                                      ),
                                      labelText: "email",
                                      hintText: "ex: teste@teste.com",
                                      hintStyle: TextStyle(color: Colors.white),
                                    ),
                                    onSaved: (value) =>
                                        _authData['email'] = value ?? '',
                                    validator: (email) {
                                      final String emailNow = email ?? '';
                                      if (emailNow.isEmpty ||
                                          emailNow.length < 5) {
                                        return "email é obrigatório";
                                      } else if (!emailNow.contains('@')) {
                                        return 'email precisa ser válido';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    obscureText: true,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.key,
                                        color: Colors.white,
                                      ),
                                      labelText: "password",
                                      hintText: "digite um password bem seguro",
                                      hintStyle: TextStyle(color: Colors.white),
                                    ),
                                    onSaved: (value) =>
                                        _authData['password'] = value ?? '',
                                    validator: (password) {
                                      final String passwordNow = password ?? '';
                                      if (passwordNow.isEmpty ||
                                          passwordNow.length < 5) {
                                        return "password é obrigatório";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  SizedBox(height: 20),
                                  _isLoading
                                      ? CircularProgressIndicator()
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            ElevatedButton(
                                              onPressed: _onSubmit,
                                              child: Text(
                                                'Enviar',
                                                style: TextStyle(
                                                  color: Colors.indigo,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
