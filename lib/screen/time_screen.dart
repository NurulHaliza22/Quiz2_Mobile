import 'package:flutter/material.dart';

class TimeConversionScreen extends StatefulWidget {
  const TimeConversionScreen({super.key});

  @override
  _TimeConversionScreenState createState() => _TimeConversionScreenState();
}

class _TimeConversionScreenState extends State<TimeConversionScreen> {
  final TextEditingController _timeController = TextEditingController();
  String _convertedTime = '';

  void _convertTime() {
    int timeInHours = int.parse(_timeController.text);
    int wib = timeInHours + 7;
    int wit = timeInHours + 9;
    int wita = timeInHours + 8;

    setState(() {
      _convertedTime = 'WIB: $wib:00\nWITA: $wita:00\nWIT: $wit:00';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konversi Waktu'),
        backgroundColor: Colors.purple,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Masukkan Waktu (Jam) untuk Konversi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            _buildTextField(_timeController, 'Masukkan Waktu (Jam)', 'Ex: 10'),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _convertTime,
              child: const Text(
                'Konversi',
                style: TextStyle(
                  color: Colors.white, 
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, 
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadowColor: Colors.purpleAccent,
                elevation: 5,
              ),
            ),
            const SizedBox(height: 20),

            if (_convertedTime.isNotEmpty)
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _convertedTime,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
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

  Widget _buildTextField(TextEditingController controller, String label, String hint) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), 
        ),
        filled: true,
        fillColor: Colors.purple[50], 
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      keyboardType: TextInputType.number,
      style: const TextStyle(fontSize: 16),
    );
  }
}
