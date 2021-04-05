import 'package:flutter/material.dart';
import 'package:loginmvcs/servicios/usuario_servicio.dart';
import 'package:loginmvcs/vistas/login_pagina.dart';
import 'package:loginmvcs/vistas/principal_pagina.dart';
import 'package:provider/provider.dart';

import 'comandos/base_comando.dart' as Comandos;




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext _) {
    return MultiProvider(
      providers: [        
        Provider(create: (c) => UsuarioServicio()),
      ],
      child: Builder(builder: (context) {
        // Guardamos un contexto que nuestros comandos puedan utilizar para acceder a los modelos y servicios proporcionados
        Comandos.init(context);
        return MaterialApp(title: 'LOGIN',
            initialRoute: 'login',
            routes: {
              'login': (BuildContext context ) => LoginPagina(),              
              'principal': (BuildContext context ) => HomePage(),
            });
      }),
    );
  }
}



