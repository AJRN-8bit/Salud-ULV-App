import 'package:flutter/material.dart';
import 'package:salud_ulv_app/src/core/domain/user/ports/primary/user_auth_inport.dart';


class UserRegistryInAdapter {
  final TextEditingController useridController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final IUserRegistryInputPort useCase;

  /// Constructor recibe los controladores
  const UserRegistryInAdapter({
    required this.useridController,
    required this.emailController,
    required this.passwordController,
    required this.useCase
  });

  /// Implementación del puerto primario
  /// Método de conveniencia para construir la entidad desde los controladores
  Future<void> execute() async {
    debugPrint("Adapter In -> Entrando desde UI");
    // tryParse devuelve int? (puede ser nulo)
    final int? parsedID = int.tryParse(useridController.text);
    final String email = emailController.text.trim();
    final String password = passwordController.text;

    // Validación de seguridad para convertir int? a int
    if (parsedID == null) {
      debugPrint("Adaptador Entrada: Error, el ID no es un número válido.");
      return; // Salimos para no llamar al caso de uso con datos basura
    }

    // Ahora sí, userID es un 'int' garantizado
    final int userID = parsedID;

    debugPrint("Adapter In -> Entrando a caso de uso");
    // Llama al método del puerto
    await useCase.registerUserIn(userID, email, password);
  }
}
