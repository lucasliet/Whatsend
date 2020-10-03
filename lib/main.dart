import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(Whatsend());

class Whatsend extends StatefulWidget {
  Whatsend({Key key}) : super(key: key);

  @override
  _WhatsendState createState() => _WhatsendState();
}

class _WhatsendState extends State<Whatsend> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(),
      home: Scaffold(
        backgroundColor: Color(0xFF128C7E),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset("assets/img/Logo.png"),
            ),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        "Digite o número para quem deseja enviar a mensagem",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFEEEEEE),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: _phoneController,
                          textAlign: TextAlign.center,
                          validator: (value) {
                            return value.isEmpty ? 'Digite alguma coisa' : null;
                          },
                          style: TextStyle(
                              color: Colors.black
                          ),
                          decoration: InputDecoration(
                            hintText: '11999999999',
                            hintStyle: TextStyle(color: Colors.blueGrey),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: RaisedButton(
                            onPressed: () async => await launch('https://api.whatsapp.com/send?phone=${_phoneController.text}'),
                            child: Text('Enviar'),
                            color: Color(0xFF34B7F1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32)
                            ),
                            elevation: 4,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}