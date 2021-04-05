
class UsuarioServicio{
  Future<bool> login(String user, String password) async{
    await Future.delayed(Duration(seconds: 3));
    return true;
  }
}