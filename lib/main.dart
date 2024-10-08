import 'package:flutter/material.dart';

import 'chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TrainDuel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(236, 0, 22, 2)),
        useMaterial3: true,
      ),
      home: const Chat(),// MyHomePage(title: 'TrainDuell'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _station = 'Gera'; // Station Placeholder
  TimeOfDay _selectedTime = TimeOfDay(hour: 13, minute: 05); // Uhrzeit Placeholder

  // Funktion zur Auswahl der Uhrzeit
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // "Zug Suchen" Button
            ElevatedButton(
              onPressed: () {
                // Hier kommt die Suchfunktion
              },
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Zug Suchen'),
            ),
            const SizedBox(height: 20),
            // Eingestiegen in: Gera
            Row(
              children: [
                const Text('Eingestiegen in:', style: TextStyle(fontSize: 18)),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: _station,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _station = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Uhrzeit Auswahl Button
            Row(
              children: [
                const Text('Uhrzeit:', style: TextStyle(fontSize: 18)),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _selectTime(context),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: Text(
                      '${_selectedTime.format(context)}',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Platzhalter für weitere Informationen
            Container(
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: const Center(
                child: Text(
                  'Weitere Informationen',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(

                  ),
                  child: const Text('Zurück'),
                ),
                ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(

                  ),
                  child: const Text('Weiter zum Strecke'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
