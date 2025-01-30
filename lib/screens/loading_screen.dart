import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 198, 216, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo ve yükleme göstergesi bölümü
          Container(
            width: double.infinity,
            child: Column(
              children: [
                // Logo bölümü
                Container(
                  width: 150,
                  height: 150,
                  child: Image.asset(
                    'assets/images/logg.webp',
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 30),

                // Yükleme ikonu
                const CircularProgressIndicator(),

                const SizedBox(height: 30),

                // InkWell: Kullanıcıyı yönlendirecek bir tıklanabilir alan
                InkWell(
                  onTap: () => context.go("/home"), // Yönlendirme işlemi
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          250, 148, 170, 223), // Arka plan rengi
                      borderRadius: BorderRadius.circular(8), // Köşe yuvarlama
                    ),
                    child: const Text(
                      "Giriş Yap",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Yükleniyor yazısı
                const Text(
                  "Serenova'ya adım atın.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
