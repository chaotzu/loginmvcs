import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loginmvcs/servicios/usuario_servicio.dart';

BuildContext _mainContext;
//Los comandos utilizaran esto para acceder a los modelos y servicios proporcionados
void init(BuildContext c) => _mainContext = c;

//Proporciona metodos de busqueda rapida para todos los modelos y servicios de nivel superior. Mantiene el codigo de los comandos mas limpio
class BaseComando{
  //Modelos

  //Servicios
  UsuarioServicio usuarioServicio = _mainContext.read();  
}
