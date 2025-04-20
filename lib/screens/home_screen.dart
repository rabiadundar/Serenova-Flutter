import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/bottom_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Drawer (sol menü) widget'ı ekliyoruz
      drawer: Drawer(
        child: Container(
          color: Color.fromRGBO(
              203, 219, 253, 1), // Drawer'ın arka plan rengini sarı yapıyoruz
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(212, 224, 252, 1), // Açık Yeşil
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profil resmi olarak cat.jpg'yi kullandık
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/cat.jpg'),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Merhaba Rabia!",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 80, 97, 131)),
                    ),
                  ],
                ),
              ),

              // Drawer menüsündeki butonlar
              ListTile(
                leading: const Icon(Icons.home, size: 30),
                title: const Text('Ana Sayfa', style: TextStyle(fontSize: 18)),
                onTap: () => context.go("/home"),
                tileColor: const Color.fromARGB(
                    255, 225, 215, 125), // Sol menüde buton arka planı sarı
                textColor: Colors.black, // Metin rengini siyah yapıyoruz
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today, size: 30),
                title: const Text('Takvim', style: TextStyle(fontSize: 18)),
                onTap: () => context.go("/calendar"),
                tileColor: const Color.fromARGB(
                    255, 225, 215, 125), // Sol menüde buton arka planı sarı
                textColor: Colors.black, // Metin rengini siyah yapıyoruz
              ),
              ListTile(
                leading: const Icon(Icons.headphones, size: 30),
                title: const Text('Meditasyon', style: TextStyle(fontSize: 18)),
                onTap: () => context.go("/headphones"),
                tileColor: const Color.fromARGB(
                    255, 225, 215, 125), // Sol menüde buton arka planı sarı
                textColor: Colors.black, // Metin rengini siyah yapıyoruz
              ),
              ListTile(
                leading: const Icon(Icons.person, size: 30),
                title: const Text('Profil', style: TextStyle(fontSize: 18)),
                onTap: () => context.go("/profile"),
                tileColor: const Color.fromARGB(
                    255, 225, 215, 125), // Sol menüde buton arka planı sarı
                textColor: Colors.black, // Metin rengini siyah yapıyoruz
              ),
              const SizedBox(height: 280),
              // Giriş Yap ve Çıkış Yap ikonları
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // İkonlar arasına boşluk bırakıyoruz
                  children: [
                    // Giriş Yap ikonu
                    IconButton(
                      icon: const Icon(Icons.login, size: 30),
                      onPressed: () {
                        // Giriş yapma işlemi
                        print("Giriş Yap");
                      },
                    ),
                    // Çıkış Yap ikonu
                    IconButton(
                      icon: const Icon(Icons.exit_to_app, size: 30),
                      onPressed: () {
                        // Çıkış yapma işlemi
                        print("Çıkış Yap");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // AppBar'ı düzenliyoruz
      appBar: AppBar(
        title: const Text(
          "SERENOVA",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold, // Kalın yazı tipi
            color: Color.fromARGB(
                255, 3, 20, 38), // Yazı rengini değiştirebilirsiniz
            fontFamily: 'Kalam', // Kalam fontu
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 244, 255, 196), // Açık Yeşil
      ),

      // Arka plan görselini buraya ekliyoruz
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wall.jpg'), // Arka plan görseli
            fit: BoxFit.cover, // Görseli tüm ekranı kaplayacak şekilde yayar
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                // Profil resminiz ve Hoş geldin metni
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      // Profil resmi
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/cat.jpg'),
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "Hoş Geldin Rabia!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 80, 97, 131),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // Butonları sarı yapıyoruz
                ElevatedButton(
                  onPressed: () {
                    context.go("/yoga-pozlari");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color.fromRGBO(255, 143, 149, 1), // Sarı arka plan
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "🧘 Yoga Başlat",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'Kalam', // Kalam fontu
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Popüler Yoga Pozları",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 80, 97, 131),
                  ),
                ),
                const SizedBox(height: 15),
              ]),
            ),
            // Yoga pozları kısmı kaydırılabilir olacak
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  // Yaratıcı kedili poz isimleri
                  List<String> pozIsimleri = [
                    'Cheetah Charge Pose', // Çita
                    'Persian Plow Pose', // Persian Kedisi
                    'Bengal Balance Pose', // Bengal Kedisi
                    'Sphynx Stretch Pose', // Sphynx Kedisi
                    'Maine Coon Mountain Pose', // Maine Coon
                    'Siberian Savasana Pose', // Sibirya Kedisi
                    'Ragdoll Reach Pose', // Ragdoll Kedisi
                    'Scottish Fold Flow Pose' // Scottish Fold
                  ];

                  // Kedili pozların renkleri
                  List<Color> pozRenkleri = [
                    const Color.fromARGB(255, 238, 172, 84), // Çita
                    const Color.fromARGB(255, 157, 155, 155)!, // Persian Kedisi
                    const Color.fromARGB(255, 171, 117, 97), // Bengal Kedisi
                    const Color.fromARGB(255, 122, 172, 197), // Sphynx Kedisi
                    const Color.fromARGB(255, 98, 194, 101), // Maine Coon
                    const Color.fromARGB(255, 4, 170, 154), // Sibirya Kedisi
                    const Color.fromARGB(255, 71, 137, 192), // Ragdoll Kedisi
                    const Color.fromARGB(255, 182, 97, 197), // Scottish Fold
                  ];

                  return Card(
                    elevation: 5, // Gölgeyi büyütüyoruz
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    // BoxDecoration kullanarak arka planı değiştirelim
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                            255, 243, 218, 199), // Soft Mavi
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Fotoğrafı büyütme ve kesilmeden gösterme
                          Image.asset(
                            'assets/images/yoga_pose_${index}.jpg',
                            width: 170, // Fotoğraf boyutunu artırdık
                            height: 170, // Fotoğraf boyutunu artırdık
                            fit: BoxFit
                                .contain, // Kesilmemesi için BoxFit.contain
                          ),
                          const SizedBox(
                              height: 10), // Görsel ile metin arasındaki boşluk
                          Text(
                            pozIsimleri[
                                index], // Poz ismini burada kullanıyoruz
                            style: TextStyle(
                              fontSize: 18, // Metin boyutunu biraz küçülttük
                              fontWeight: FontWeight.bold,
                              color: pozRenkleri[index], // Pozun renkleri
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: 8, // 8 yoga pozu
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 kolon
                crossAxisSpacing: 15, // Kolonlar arası mesafe
                mainAxisSpacing: 15, // Satırlar arası mesafe
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 244, 255, 196), // Sarı arka plan
        child: const BottomMenu(),
      ),
    );
  }
}
