import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:salud_ulv_app/src/features/adapters/primary/provider/controllers/userAnthropometric/get_anthrop_controller.dart';
import 'package:salud_ulv_app/src/features/presentation/screens/records/anthropometrics/register_data_screen.dart';
import 'package:salud_ulv_app/src/features/presentation/screens/records/anthropometrics/progress_data_screen.dart';
import 'package:salud_ulv_app/src/features/presentation/screens/auth/user_registry.dart';
import 'package:salud_ulv_app/src/features/presentation/screens/records/progress_election_screen.dart';
import 'package:salud_ulv_app/src/features/presentation/screens/records/userActivities/activity_tracker_screen.dart';


// import 'src/features/adapters/primary/ui/controllers/user_registry_controller.dart';
// import 'src/features/adapters/secondary/http/controllers/user_registry_controller.dart';
// import 'src/core/domain/user/usecases/user_auth.dart';
// import '';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context)=> GetRecentAnthropometricInAdapter()),
        ChangeNotifierProvider(create: (context)=> GetAnthropometricsByFieldInAdapter()),
        ChangeNotifierProvider(create: (context)=> GetAllAnthropometricsInAdapter()),
        ChangeNotifierProvider(create: (context)=> RegisterAntrhopometricDataInAdapter()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: .fromSeed(seedColor: Colors.lightBlue),
          ),
          home: const AppHomeScreen(),
      ),
    );
  }
}




class AppHomeScreen extends StatefulWidget {
  const AppHomeScreen({super.key});

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {

  int _currentIndex = 0;

  // List of screens (as widgets) to navigate to
  final List<Widget> _pages = [
    BeginActivityTrackingScreen(),
    MainProgressPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Bottom Navigation Example')),
      body: _pages[_currentIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color(0xFF0559A2),
        // showUnselectedLabels: false,
        selectedItemColor: Colors.cyanAccent,
        unselectedItemColor: Colors.white,
        // elevation: 300,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.pedal_bike_rounded),
            label: 'Actividades',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_thresholding_rounded),
            label: 'Progreso',
          )
            // backgroundColor: Colors.green
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.run_circle_outlined),
          //   label: 'Actividad',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.data_thresholding_rounded),
          //   label: 'Progreso',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.group),
          //   label: 'Grupos',
          // ),
        ],
      ),
    );
  }
}
  
  