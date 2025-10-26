import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BIKE SIMULATOR 2025',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent, brightness: Brightness.dark),
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      home: const BikeSimulatorPage(title: 'BIKE SIMULATOR 2025'),
    );
  }
}

class BikeSimulatorPage extends StatefulWidget {
  const BikeSimulatorPage({super.key, required this.title});

  final String title;

  @override
  State<BikeSimulatorPage> createState() => _BikeSimulatorPageState();
}

class _BikeSimulatorPageState extends State<BikeSimulatorPage> {
  double _speed = 0.0;
  int _gear = 1;
  final int _maxGear = 6;

  void _accelerate() {
    setState(() {
      _speed += 2.0 * _gear;
      if (_speed > 200) {
        _speed = 200; // Max speed
      }
    });
  }

  void _brake() {
    setState(() {
      _speed -= 5.0;
      if (_speed < 0) {
        _speed = 0.0;
      }
    });
  }

  void _gearUp() {
    setState(() {
      if (_gear < _maxGear) {
        _gear++;
      }
    });
  }

  void _gearDown() {
    setState(() {
      if (_gear > 1) {
        _gear--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.greenAccent)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('SPEED', style: TextStyle(fontSize: 24, color: Colors.grey[400])),
            Text(
              _speed.toStringAsFixed(1),
              style: const TextStyle(fontSize: 90, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text('km/h', style: TextStyle(fontSize: 20, color: Colors.grey[400])),
            const SizedBox(height: 40),
            Text('GEAR', style: TextStyle(fontSize: 24, color: Colors.grey[400])),
            Text(
              '$_gear',
              style: const TextStyle(fontSize: 70, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _gearDown,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  child: const Icon(Icons.arrow_downward, size: 30),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _gearUp,
                   style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  child: const Icon(Icons.arrow_upward, size: 30),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[900],
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             Expanded(
               child: ElevatedButton(
                onPressed: _accelerate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('ACCELERATE', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                           ),
             ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: _brake,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('BRAKE', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
