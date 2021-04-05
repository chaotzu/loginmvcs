import 'package:flutter/material.dart';

import 'base_comando.dart';

class LoginComando extends BaseComando{
  Future<bool> run(String user, String password) async{
    //Espera llamada del servicio
    print("Llamada");
    print(user);
    print(password);
    bool exitoInicioSesion = await usuarioServicio.login(user, password);

    if(exitoInicioSesion)
      print("funciona");
      


    //if(exitoInicioSesion)
    //  await cargaPaginaInicioComando.run(user);

  }

  Future<bool> validaCorreo(String correo) async{
    bool validado = false;
    Pattern patron = '^[a-zA-Z0-9](\.?[a-zA-Z0-9]){5,}@goo(le)?\.com';
    RegExp regExp = new RegExp(patron);

    if ( regExp.hasMatch(correo))
        validado = true;
    
    return validado;
      
  }

  Future<bool> validaPassword(String password) async{
    bool validado = false;        

   if(password.length >= 6) 
      validado = true;        
    else{
      validado = false;  
    }
    
    return validado;
      
  }

  
  
}