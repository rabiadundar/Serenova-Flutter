import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:dotlottie_loader/dotlottie_loader.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 198, 216, 255),
      body: Center(
        // Tüm içeriği ortalamak için Center widget'ı ekledim
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              CrossAxisAlignment.center, // Kolon içindeki öğeleri ortalıyoruz
          children: [
            // Logo bölümü
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset(
                'assets/images/logg.webp',
                fit: BoxFit.contain,
              ),
            ),

            // Lottie Animasyonu
            SizedBox(
              width: 70,
              height: 70,
              child: DotLottieLoader.fromAsset(
                "assets/motions/aa.lottie",
                frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                  if (dotlottie != null) {
                    return Lottie.memory(
                      dotlottie.animations.values.single,
                      fit: BoxFit.contain,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            const SizedBox(height: 20),

            // Giriş butonu
            InkWell(
              onTap: () => context.go("/home"),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 244, 255, 196),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Giriş Yap",
                  style: TextStyle(
                    color: Color.fromRGBO(255, 143, 149, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Yükleniyor yazısı
            const Text(
              "Serenova'ya adım atın.",
              style: TextStyle(
                fontFamily: 'Kalam',
                fontSize: 20,
                color: Color.fromARGB(255, 80, 97, 131),
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
