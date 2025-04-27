import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart'; // TableCalendar'ı import ediyoruz
import '../widgets/bottom_menu.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  final Map<DateTime, List<String>> _tasks = {};

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Takvim Ekranı"),
        backgroundColor:
            const Color.fromARGB(255, 244, 255, 196), // İsteğe bağlı renk
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day); // Seçilen günü kontrol et
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onPageChanged: (focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
              });
            },

            calendarFormat: CalendarFormat.month, // Aylık takvim formatı
            daysOfWeekVisible: true,
            headerVisible: true, // Başlık görünür
            availableGestures: AvailableGestures.all,

            // Takvim başlığını özelleştirme
            headerStyle: HeaderStyle(
              formatButtonVisible: false, // Format butonunu gizler (2 weeks)
              titleTextFormatter: (date, locale) {
                // Ay ismini yazdıracak şekilde başlık özelleştiriliyor
                return '${date.month} - ${date.year}'; // Ay ve yıl
              },
              titleCentered: true, // Başlık ortalanacak
            ),

            // Takvim stilini değiştirme
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: const Color.fromARGB(255, 15, 83, 112),
                shape: BoxShape.circle,
              ),
              todayTextStyle:
                  TextStyle(color: const Color.fromARGB(255, 244, 237, 237)),
              defaultTextStyle: TextStyle(
                color: const Color.fromARGB(
                    255, 218, 93, 191), // Gün numaralarının rengini değiştirme
              ),
              weekendTextStyle: TextStyle(
                color: const Color.fromARGB(255, 104, 181,
                    214), // Hafta sonu günlerinin rengini değiştirme
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Seçilen günün görevlerini gösterme
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Görevler: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 218, 93, 191),
                  ),
                ),
                ..._getTasksForSelectedDay().map((task) => ListTile(
                      title: Text(task),
                    )),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _showAddTaskDialog(),
                  child: const Text('Görev Ekle'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }

  List<String> _getTasksForSelectedDay() {
    return _tasks[_selectedDay] ?? [];
  }

  void _showAddTaskDialog() {
    final TextEditingController taskController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Görev Ekle'),
          content: TextField(
            controller: taskController,
            decoration: const InputDecoration(hintText: 'Görev adını girin'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Vazgeç'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (taskController.text.isNotEmpty) {
                    if (_tasks[_selectedDay] == null) {
                      _tasks[_selectedDay] = [];
                    }
                    _tasks[_selectedDay]!.add(taskController.text);
                  }
                });
                Navigator.pop(context);
              },
              child: const Text('Ekle'),
            ),
          ],
        );
      },
    );
  }
}
