
import 'package:flutter/material.dart';
import 'package:salud_ulv_app/src/core/domain/userActivity/ports/outports.dart';
import 'package:salud_ulv_app/src/core/domain/userActivity/usecases/begin_register_activity_usecase.dart';
import 'package:salud_ulv_app/src/core/domain/userActivity/usecases/walk_activity.dart';
import 'package:salud_ulv_app/src/features/adapters/primary/provider/controllers/userActivity/begin_activity_controller.dart';
import 'package:salud_ulv_app/src/features/adapters/secondary/sensors/sensor_controller.dart';


class BeginActivityTrackingScreen extends StatefulWidget {
  const BeginActivityTrackingScreen({super.key});

  @override
  State<BeginActivityTrackingScreen> createState() => _BeginActivityTrackingScreenState();
}

class _BeginActivityTrackingScreenState extends State<BeginActivityTrackingScreen> {
  // Cambiamos el tipo a UserAccelerometerEvent
  final _formKeyalues = GlobalKey<FormState>();
  final _outAdapter = SensorsPlusAdapter();

  // late final useCase = BeginRegisterActivityUsecase(_outAdapter);
  late final useCase = BeginWalking(_outAdapter);
  late final adapter = BeginActivityRegistryInAdapter(useCase);
  bool _tracking = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 255, 246),
    appBar: AppBar(title: Text('Step Tracker')),
    body: StreamBuilder<Map<String, dynamic>>(
    stream: adapter.execute(),
      builder: (context, snapshot) {

        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
        // debugPrint("data ${snapshot.data.toString()}");
        final data = snapshot.data!;
        final step = data['steps'];
        final progress = (step / 1500).clamp(0.0, 1.0);

        return Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              Text('${data['time']}', style: TextStyle(fontSize: 36)),
              // Text('Steps: ${data['steps']} / 1000', style: TextStyle(fontSize: 24)),

              SizedBox(height: 30),

               Stack(
                    alignment: Alignment.center, // centra todo dentro del Stack
                    children: [
                      SizedBox(
                        width: 300,
                        height: 300,
                        child: CircularProgressIndicator(
                          value: progress, // entre 0.0 y 1.0
                          strokeWidth: 25,
                          backgroundColor: Colors.grey[300],
                          color: Colors.blue,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${(progress * 100).toStringAsFixed(1)}%', // porcentaje
                            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$step / 1000 pasos', // pasos
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ), 

                  SizedBox(height: 40,),

                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        _tracking = !_tracking; // cambia true ↔ false
                      });
                    },
                    child: Icon(_tracking ? Icons.stop : Icons.play_arrow),
                  ),
            ],
            ),
          );
        }
      ),
    );

  } 
}