import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
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
        backgroundColor: const Color.fromARGB(255, 244, 255, 196),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wall.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              calendarFormat: CalendarFormat.month,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextFormatter: (date, locale) =>
                    '${date.month} - ${date.year}',
              ),
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: const TextStyle(color: Colors.white),
                todayDecoration: const BoxDecoration(
                  color: Color.fromARGB(255, 15, 83, 112),
                  shape: BoxShape.circle,
                ),
                todayTextStyle:
                    const TextStyle(color: Color.fromARGB(255, 244, 237, 237)),
                defaultTextStyle: const TextStyle(
                  color: Color.fromARGB(255, 218, 93, 191),
                  fontWeight: FontWeight.bold,
                ),
                weekendTextStyle: const TextStyle(
                  color: Color.fromARGB(255, 104, 181, 214),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Görevler:',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 218, 93, 191),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _getTasksForSelectedDay()
                        .asMap()
                        .entries
                        .map((entry) => Card(
                              color: const Color.fromARGB(230, 255, 255, 255),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                    color: Colors.purple, width: 1),
                              ),
                              elevation: 5,
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              child: ListTile(
                                title: Text(
                                  entry.value,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 10, 40, 90),
                                  ),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit,
                                          color: Colors.orange),
                                      onPressed: () =>
                                          _editTask(entry.key, entry.value),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                      onPressed: () => _deleteTask(entry.key),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: _showAddTaskDialog,
                      child: const Text(
                        'Görev Ekle',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 94, 163, 219),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(
            255, 244, 255, 196), // Alt kısmın arka plan rengi
        child: const BottomMenu(),
      ),
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
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          title: const Text('Görev Ekle'),
          content: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 234, 202, 160),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: taskController,
                decoration: const InputDecoration(
                  hintText: 'Görev adını girin',
                  hintStyle: TextStyle(color: Colors.purple),
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Vazgeç'),
            ),
            TextButton(
              onPressed: () {
                if (taskController.text.trim().isNotEmpty) {
                  setState(() {
                    _tasks[_selectedDay] = [
                      ..._getTasksForSelectedDay(),
                      taskController.text.trim()
                    ];
                  });
                }
                Navigator.pop(context);
              },
              child: const Text('Ekle'),
            ),
          ],
        );
      },
    );
  }

  void _deleteTask(int index) {
    setState(() {
      _getTasksForSelectedDay().removeAt(index);
    });
  }

  void _editTask(int index, String currentTask) {
    final TextEditingController editController =
        TextEditingController(text: currentTask);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Görevi Düzenle'),
          content: TextField(
            controller: editController,
            decoration: const InputDecoration(hintText: 'Yeni görev adını gir'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('İptal'),
            ),
            TextButton(
              onPressed: () {
                if (editController.text.trim().isNotEmpty) {
                  setState(() {
                    _getTasksForSelectedDay()[index] =
                        editController.text.trim();
                  });
                }
                Navigator.pop(context);
              },
              child: const Text('Kaydet'),
            ),
          ],
        );
      },
    );
  }
}
