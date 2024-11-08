import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center( 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,  
            crossAxisAlignment: CrossAxisAlignment.center,  
            children: [
              Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.purple, width: 4), 
                ),
                child: const CircleAvatar(
                  radius: 65, 
                  backgroundImage: AssetImage('assets/kelinci.jpeg'),
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),  
              Card(
                elevation: 5,  
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), 
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Nama: Nurul Haliza',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple[800],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'NIM: 124220079',
                        style: TextStyle(fontSize: 18, color: Colors.purple[600]),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Tempat, Tanggal Lahir: Yogyakarta, 02 Juni 2004',
                        style: TextStyle(fontSize: 18, color: Colors.purple[600]),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Hobi: Menggambar',
                        style: TextStyle(fontSize: 18, color: Colors.purple[600]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
