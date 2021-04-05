import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;

  void _handleRefreshPressed() async {
    //Deshabilitar el boton refresh mientras el comando se ejecuta    
    setState(() => _isLoading = true);
    
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    // Vincula a UserModel.userPosts
    //var users = context.select<UsuarioModelo, List<String>>((value) => value.userPosts);
    // Deshabilita btn eliminando el oyente cuando estamos cargando datos
    VoidCallback btnHandler = _isLoading ? null : _handleRefreshPressed;
    // Carga lista de widgets
    //var listWidgets = users.map((post) => Text(post)).toList();
    return Scaffold(
      body: Column(
        children: [
         // Flexible(child: ListView(children: listWidgets)),
          FlatButton(child: Text("Recargar"), onPressed: btnHandler),
        ],
      ),
    );
  }
}