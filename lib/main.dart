import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login StatefulWidget',
      theme: ThemeData(
        primarySwatch: Colors.purple, // warna tema ungu di gambar 
      ),
      home: const LoginStatefulPage(),
    );
  }
}

class LoginStatefulPage extends StatefulWidget {
  const LoginStatefulPage({super.key});

  @override
  State<LoginStatefulPage> createState() => _LoginStatefulPageState();
}

class _LoginStatefulPageState extends State<LoginStatefulPage> {
  // Controller untuk menangkap input teks
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Variabel state untuk menyimpan data yang akan ditampilkan di bawah tombol
  String _displayedUsername = '';
  String _displayedPassword = '';

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    // Ketentuan E.5: Memunculkan teks di console log
    print("Aksi Login");

    // Ketentuan F.3: Memperbarui state untuk menampilkan username & password di bawah tombol
    setState(() {
      _displayedUsername = _usernameController.text;
      _displayedPassword = _passwordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login StatefulWidget'),
        backgroundColor: Colors.purple[100], // Menyesuaikan warna appbar di gambar F
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ketentuan E.1: Widget Text judul form
            const Text(
              'Form Login',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Ketentuan E.2: TextField Username dengan icon user, maxLength, dan helperText
            TextField(
              controller: _usernameController,
              maxLength: 15, // Maksimal inputan 15 karakter
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person), // Icon user
                labelText: 'Username',
                helperText: 'Masukkan hanya 15 Karakter saja', // Teks bantuan kecil
              ),
            ),
            const SizedBox(height: 10),

            // Ketentuan E.3: TextField Password dengan icon lock dan teks tersembunyi
            TextField(
              controller: _passwordController,
              obscureText: true, // Sembunyikan text yang diketik
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock), // Icon lock
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20),

            // Ketentuan E.4: ElevatedButton.icon dengan icon login
            ElevatedButton.icon(
              onPressed: _onLoginPressed,
              icon: const Icon(Icons.login), // Icon login
              label: const Text('Login'),
            ),
            const SizedBox(height: 30),

            // Ketentuan F.3: Menampilkan username & password di bawah tombol jika data sudah diisi
            if (_displayedUsername.isNotEmpty || _displayedPassword.isNotEmpty) ...[
              Text(
                _displayedUsername,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 5),
              Text(
                _displayedPassword,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ],
        ),
      ),
    );
  }
}