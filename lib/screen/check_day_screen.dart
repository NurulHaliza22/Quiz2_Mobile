import 'package:flutter/material.dart';

class CheckDayScreen extends StatefulWidget {
  const CheckDayScreen({super.key});

  @override
  _CheckDayScreenState createState() => _CheckDayScreenState();
}

class _CheckDayScreenState extends State<CheckDayScreen> {
  final TextEditingController _dayController = TextEditingController();
  String _dayName = '';

  void _checkDay() {
    int dayNumber = int.parse(_dayController.text);
    List<String> days = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'];
    setState(() {
      _dayName = 'Hari: ${days[dayNumber - 1]}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cek Hari'),
        backgroundColor: Colors.purple,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Masukkan Nomor Hari (1-7)',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purpleAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _dayController,
              decoration: InputDecoration(
                labelText: 'Nomor Hari (1-7)',
                labelStyle: TextStyle(color: Colors.purple),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), 
                ),
                filled: true,
                fillColor: Colors.purple[50],
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity, 
              child: ElevatedButton(
                onPressed: _checkDay,
                child: const Text(
                  'Cek Hari',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadowColor: Colors.deepPurple,
                  elevation: 5,
                ),
              ),
            ),
            const SizedBox(height: 20),

            if (_dayName.isNotEmpty)
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _dayName,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.purpleAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
