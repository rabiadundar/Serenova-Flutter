import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/bottom_menu.dart';

class HeadphonesScreen extends StatelessWidget {
  const HeadphonesScreen({super.key});

  final List<Map<String, String>> meditationVideos = [
    {
      'title': 'Doğa Sesleri',
      'url': 'https://www.youtube.com/watch?v=2OEL4P1Rz04',
    },
    {
      'title': 'Derin Uyku Müzikleri',
      'url': 'https://www.youtube.com/watch?v=Mk7TuFQ_gGE',
    },
    {
      'title': 'Rahatlatıcı Piyano',
      'url': 'https://www.youtube.com/watch?v=lFcSrYw-ARY',
    },
  ];

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Açılamadı: $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 244, 255, 196),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Merhaba Rabia!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3B4A69),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Ana Sayfa'),
              onTap: () => context.go("/home"),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Takvim'),
              onTap: () => context.go("/calendar"),
            ),
            ListTile(
              leading: Icon(Icons.headphones),
              title: Text('Meditasyon'),
              onTap: () => context.go("/headphones"),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () => context.go("/profile"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Meditasyon Müzikleri"),
        backgroundColor: const Color.fromARGB(255, 244, 255, 196),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "🧘‍♀️ Zihnini Dinlendir",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3B4A69),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: meditationVideos.length,
                itemBuilder: (context, index) {
                  final video = meditationVideos[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    elevation: 4,
                    child: ListTile(
                      leading: const Icon(Icons.music_note,
                          color: Color(0xFF3B4A69)),
                      title: Text(video['title']!),
                      trailing: const Icon(Icons.play_circle_fill),
                      onTap: () => _launchURL(video['url']!),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
