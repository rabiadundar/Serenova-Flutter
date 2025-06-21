import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/bottom_menu.dart';

class HeadphonesScreen extends StatefulWidget {
  const HeadphonesScreen({super.key});

  @override
  State<HeadphonesScreen> createState() => _HeadphonesScreenState();
}

class _HeadphonesScreenState extends State<HeadphonesScreen> {
  int selectedModeIndex = 0;

  final List<_Mode> modes = [
    _Mode(
      name: "Spor Modu",
      icon: Icons.fitness_center,
      color: Colors.orange.shade400,
      songs: [
        {"title": "Eye of the Tiger", "artist": "Survivor"},
        {"title": "Stronger", "artist": "Kanye West"},
        {"title": "Can't Hold Us", "artist": "Macklemore"},
      ],
    ),
    _Mode(
      name: "Meditasyon",
      icon: Icons.spa,
      color: Colors.teal.shade400,
      songs: [
        {"title": "Weightless", "artist": "Marconi Union"},
        {"title": "Sunrise Meditation", "artist": "Meditation Music Zone"},
        {"title": "Calm Seas", "artist": "Relaxing Music"},
      ],
    ),
    _Mode(
      name: "Gece Modu",
      icon: Icons.nights_stay,
      color: Colors.indigo.shade600,
      songs: [
        {"title": "Night Owl", "artist": "Galimatias"},
        {"title": "Moonlight Sonata", "artist": "Beethoven"},
        {"title": "Stars", "artist": "Imagine Dragons"},
      ],
    ),
    _Mode(
      name: "Rahatlama",
      icon: Icons.self_improvement,
      color: Colors.lightBlue.shade400,
      songs: [
        {"title": "Ocean Waves", "artist": "Nature Sounds"},
        {"title": "Soft Rain", "artist": "Relaxation"},
        {"title": "Peaceful Mind", "artist": "Yoga Music"},
      ],
    ),
    _Mode(
      name: "Odaklanma",
      icon: Icons.visibility,
      color: Colors.deepPurple.shade400,
      songs: [
        {"title": "Focus", "artist": "Hans Zimmer"},
        {"title": "Concentration Music", "artist": "Brain.fm"},
        {"title": "Ambient Study Music", "artist": "Chillhop"},
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final selectedMode = modes[selectedModeIndex];

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 244, 255, 196)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/profile.jpg')),
                  SizedBox(height: 10),
                  Text("Merhaba Rabia!",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3B4A69))),
                ],
              ),
            ),
            ListTile(
                leading: Icon(Icons.home),
                title: Text('Ana Sayfa'),
                onTap: () => context.go("/home"),
                tileColor: Colors.blue[100]),
            ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('Takvim'),
                onTap: () => context.go("/calendar"),
                tileColor: Colors.blue[100]),
            ListTile(
                leading: Icon(Icons.headphones),
                title: Text('Meditasyon'),
                onTap: () => context.go("/headphones"),
                tileColor: Colors.blue[100]),
            ListTile(
                leading: Icon(Icons.person),
                title: Text('Profil'),
                onTap: () => context.go("/profile"),
                tileColor: Colors.blue[100]),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Meditasyon Müzikleri"),
        backgroundColor: const Color.fromARGB(255, 244, 255, 196),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/wall.jpg'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("🧘‍♀️ Zihnini Dinlendir",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3B4A69))),
              const SizedBox(height: 20),

              // Mod seçici yatay liste, iconlu, renkli kutular
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: modes.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    final mode = modes[index];
                    final isSelected = selectedModeIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedModeIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 140,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? mode.color
                              : mode.color.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: mode.color.withOpacity(0.6),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ]
                              : null,
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(mode.icon, size: 40, color: Colors.white),
                            const SizedBox(height: 10),
                            Text(
                              mode.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 4,
                                    color: Colors.black45,
                                    offset: Offset(1, 1),
                                  )
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Önerilen Müzikler:",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3B4A69)),
              ),
              const SizedBox(height: 10),

              // Şarkı listesi
              Expanded(
                child: ListView.separated(
                  itemCount: selectedMode.songs.length,
                  separatorBuilder: (_, __) =>
                      const Divider(color: Colors.grey),
                  itemBuilder: (context, index) {
                    final song = selectedMode.songs[index];
                    return ListTile(
                      leading:
                          const Icon(Icons.music_note, color: Colors.blueGrey),
                      title: Text(
                        song["title"]!,
                        style: const TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        song["artist"]!,
                        style: const TextStyle(color: Colors.black54),
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("${song['title']} çalıyor...")),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 244, 255, 196),
        child: const BottomMenu(),
      ),
    );
  }
}

class _Mode {
  final String name;
  final IconData icon;
  final Color color;
  final List<Map<String, String>> songs;

  _Mode({
    required this.name,
    required this.icon,
    required this.color,
    required this.songs,
  });
}
