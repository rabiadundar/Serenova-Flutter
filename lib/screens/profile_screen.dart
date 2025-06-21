import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/bottom_menu.dart';

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

  bool _isLogin = true;

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_isLogin) {
        print(
            'Giriş Yapıldı: ${_emailController.text}, ${_passwordController.text}');
      } else {
        print(
            'Kayıt Olundu: ${_nameController.text} ${_surnameController.text}, ${_emailController.text}, ${_passwordController.text}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool _isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final Color backgroundColor = _isDarkMode ? Colors.black : Colors.white;
    final Color buttonColorStart =
        _isDarkMode ? Colors.teal.shade700 : Colors.orange.shade400;
    final Color buttonColorEnd = _isDarkMode
        ? Colors.teal.shade300
        : const Color.fromARGB(255, 255, 230, 192);
    final Color inputFieldColor = _isDarkMode
        ? Colors.grey[900]!
        : const Color.fromARGB(255, 243, 213, 165).withOpacity(0.9);

    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? "Giriş Yap" : "Kayıt Ol"),
        backgroundColor: _isDarkMode
            ? Colors.grey[900]
            : const Color.fromARGB(255, 244, 255, 196),
        iconTheme: IconThemeData(
            color: _isDarkMode
                ? const Color.fromARGB(255, 219, 206, 206)
                : Colors.black),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/wall.jpg',
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.3),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Container(
                decoration: BoxDecoration(
                  color: _isDarkMode
                      ? Colors.black.withOpacity(0.75)
                      : Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        _isLogin ? "Giriş Yap" : "Yeni Hesap Oluştur",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: _isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 246, 153, 60),
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),

                      if (!_isLogin) ...[
                        _buildInputField(
                            "Ad", _nameController, inputFieldColor),
                        const SizedBox(height: 16),
                        _buildInputField(
                            "Soyad", _surnameController, inputFieldColor),
                        const SizedBox(height: 24),
                      ],

                      _buildInputField(
                          "E-posta", _emailController, inputFieldColor,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Lütfen e-posta adresinizi girin';
                        if (!RegExp(
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                            .hasMatch(value)) {
                          return 'Geçersiz e-posta adresi';
                        }
                        return null;
                      }),
                      const SizedBox(height: 16),
                      _buildInputField(
                          "Şifre", _passwordController, inputFieldColor,
                          obscureText: true, validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Lütfen şifrenizi girin';
                        if (value.length < 6)
                          return 'Şifre en az 6 karakter olmalıdır';
                        return null;
                      }),
                      const SizedBox(height: 32),

                      // Buton degrade renkli
                      Container(
                        height: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          gradient: LinearGradient(
                            colors: [buttonColorStart, buttonColorEnd],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: buttonColorEnd.withOpacity(0.6),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            )
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: _submitForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32)),
                          ),
                          child: Text(
                            _isLogin ? 'Giriş Yap' : 'Kayıt Ol',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Center(
                        child: TextButton(
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
                              fontSize: 14,
                              color: _isDarkMode
                                  ? Colors.white70
                                  : const Color.fromARGB(255, 244, 149, 54),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 244, 255, 196),
        child: const BottomMenu(),
      ),
    );
  }

  Widget _buildInputField(
    String label,
    TextEditingController controller,
    Color fillColor, {
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(color: Colors.black87),
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: fillColor,
        labelStyle: const TextStyle(color: Colors.grey),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none),
      ),
    );
  }
}
