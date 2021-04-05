import 'package:flutter/material.dart';
import 'package:loginmvcs/comandos/login_comando.dart';
import 'package:loginmvcs/vistas/principal_pagina.dart';

class LoginPagina extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPagina> {
//_______________________________________________________Atributos______________________________________________________________________________
  bool _isLoading = false;
  bool _correoValido = false;
  bool _passwordValida = false;
  String _correo = "";
  String _password = "";

//_______________________________________________________Métodos______________________________________________________________________________
  void _handleLoginPressed() async {
    setState(() => _isLoading = true);
    bool success = await LoginComando().run(this._correo, this._password);
    if(!success){
      setState(() {
        _isLoading = false;
      });
              print("Entrar");
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomePage()));
            
        }
    }

    

  void _correoCambia(String correo) async{
    setState(() => _correoValido = false);
    bool cValido = await LoginComando().validaCorreo(correo);
    if(cValido) {
      setState(() {
        _correoValido = true;
        _correo = correo;
      });
    }
  }

  void _passwordCambia(String password) async{
    setState(() => _passwordValida = false);
    bool pValido = await LoginComando().validaPassword(password);
    if(pValido){
      setState(() {
        _passwordValida = true;
        _password = password;        
      });
    }
  }


  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[           
            TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon( Icons.alternate_email, color: Colors.black54, ),
                hintText: 'correo@google.com', labelText: 'Correo electrónico',                
            ),
            onChanged: (value) => _correoCambia(value),            
          ),
          TextField(
            obscureText: true,            decoration: InputDecoration(
                icon: Icon( Icons.lock_outline, color: Colors.black54,),
                labelText: 'Contraseña',
                counterText: '',
                
            ),
            onChanged: (value) => _passwordCambia(value),            
          ),
          _crearBoton(context)
          ],
        ),
      ),     
    );
  }

Widget _crearBoton(BuildContext context){

    return Container(      
        child: true//(_correoValido & _passwordValida)
            ? Container(
              child: _isLoading
              ? CircularProgressIndicator()
              : RaisedButton(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 80.0, vertical: 15.0),
                  child: Text('Ingresar'),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)
                ),
                elevation: 0.0,                
                color: Colors.blueGrey.shade900,
                textColor: Colors.white,
                onPressed: () => _handleLoginPressed(),                
              )
            )             
            : Text(""),      
    );
  }


}
