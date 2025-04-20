import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLogin = true; // Giriş formu aktif mi?

  @override
  void dispose() {
    // TextEditingController'ları temizleyelim
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Formu doğrulama ve giriş/kayıt işlemi
  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_isLogin) {
        // Giriş yapma işlemi
        print(
            'Giriş Yapıldı: ${_emailController.text}, ${_passwordController.text}');
      } else {
        // Kayıt olma işlemi
        print(
            'Kayıt Olundu: ${_nameController.text} ${_surnameController.text}, ${_emailController.text}, ${_passwordController.text}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Temaya göre renkleri belirleyelim
    bool _isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final Color backgroundColor = _isDarkMode ? Colors.black : Colors.white;
    final Color textColor = _isDarkMode ? Colors.white : Colors.black;
    final Color buttonColor = _isDarkMode
        ? Colors.blueGrey
        : const Color.fromARGB(255, 132, 187, 232);
    final Color inputFieldColor =
        _isDarkMode ? Colors.grey[800]! : Colors.grey[200]!;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(_isLogin ? "Giriş Yap" : "Kayıt Ol"),
        backgroundColor: _isDarkMode
            ? Colors.grey[850]
            : const Color.fromARGB(255, 132, 187, 232),
        iconTheme:
            IconThemeData(color: _isDarkMode ? Colors.white : Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Ad ve Soyad (Kayıt Formunda Görünsün)
              if (!_isLogin) ...[
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Ad',
                    filled: true,
                    fillColor: inputFieldColor,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen adınızı girin';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _surnameController,
                  decoration: InputDecoration(
                    labelText: 'Soyad',
                    filled: true,
                    fillColor: inputFieldColor,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen soyadınızı girin';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
              ],

              // E-posta
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'E-posta',
                  filled: true,
                  fillColor: inputFieldColor,
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen e-posta adresinizi girin';
                  } else if (!RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                      .hasMatch(value)) {
                    return 'Geçersiz e-posta adresi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),

              // Şifre
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  filled: true,
                  fillColor: inputFieldColor,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen şifrenizi girin';
                  } else if (value.length < 6) {
                    return 'Şifre en az 6 karakter olmalıdır';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Giriş veya Kayıt Butonu
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor, // Button color
                ),
                child: Text(
                  _isLogin ? 'Giriş Yap' : 'Kayıt Ol',
                  style: TextStyle(
                      color: _isDarkMode ? Colors.black : Colors.white),
                ),
              ),

              const SizedBox(height: 20),

              // Kayıt Ol ve Giriş Yap arasında geçiş yapma
              TextButton(
                onPressed: () {
                  setState(() {
                    _isLogin = !_isLogin;
                  });
                },
                child: Text(
                  _isLogin
                      ? 'Hesabınız yok mu? Kayıt Ol'
                      : 'Zaten hesabınız var mı? Giriş Yap',
                  style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
