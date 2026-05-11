


import 'package:salud_ulv_app/src/core/domain/userActivity/ports/inports.dart';

class BeginActivityRegistryInAdapter{
  final IBeginActivityInPort useCase;

  const BeginActivityRegistryInAdapter(this.useCase);

  Stream<Map<String, dynamic>> execute() {
    return useCase.beginActivity();
  }
}