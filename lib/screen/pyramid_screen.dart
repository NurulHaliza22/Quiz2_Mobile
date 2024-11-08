import 'package:flutter/material.dart';

class PyramidScreen extends StatefulWidget {
  const PyramidScreen({super.key});

  @override
  _PyramidScreenState createState() => _PyramidScreenState();
}

class _PyramidScreenState extends State<PyramidScreen> {
  final TextEditingController _lengthController = TextEditingController();
  final TextEditingController _widthController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  String _result = '';

  void _calculate() {
    double length = double.parse(_lengthController.text);
    double width = double.parse(_widthController.text);
    double height = double.parse(_heightController.text);
    double volume = (length * width * height) / 3;
    double perimeter = 4 * (length + width);

    setState(() {
      _result = 'Volume: ${volume.toStringAsFixed(2)} m³\nKeliling: ${perimeter.toStringAsFixed(2)} m';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Piramida'),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Masukkan Dimensi Piramida',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            _buildTextField(_lengthController, 'Panjang Alas (m)'),
            const SizedBox(height: 10),

            _buildTextField(_widthController, 'Lebar Alas (m)'),
            const SizedBox(height: 10),

            _buildTextField(_heightController, 'Tinggi (m)'),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _calculate,
              child: const Text(
                'Hitung',
                style: TextStyle(
                  color: Colors.white,  
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
                backgroundColor: Colors.purple, 
                shadowColor: Colors.purpleAccent,  
                elevation: 5,  
              ),
            ),
            const SizedBox(height: 20),

            if (_result.isNotEmpty)
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _result,
                    style: const TextStyle(
                      fontSize: 18,
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

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), 
        ),
        filled: true,
        fillColor: Colors.purple[50], 
      ),
      keyboardType: TextInputType.number,
      style: const TextStyle(fontSize: 16),
    );
  }
}
