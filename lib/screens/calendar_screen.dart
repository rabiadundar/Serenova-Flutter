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

  bool get isDark => Theme.of(context).brightness == Brightness.dark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Takvim Ekranı"),
        backgroundColor:
            isDark ? Colors.blueGrey[900] : const Color(0xFFF4FFBC),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/wall.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.darken,
            ),
          ),
          gradient: LinearGradient(
            colors: isDark
                ? [
                    Colors.transparent,
                    Colors.blueGrey.shade900.withOpacity(0.7)
                  ]
                : [Colors.transparent, Colors.pink.shade100.withOpacity(0.7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
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
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: isDark ? Colors.white : Colors.deepPurple,
                ),
                leftChevronIcon: Icon(Icons.chevron_left,
                    color: isDark ? Colors.white : Colors.deepPurple),
                rightChevronIcon: Icon(Icons.chevron_right,
                    color: isDark ? Colors.white : Colors.deepPurple),
              ),
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.deepPurple,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurpleAccent.withOpacity(0.6),
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ],
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pinkAccent.withOpacity(0.8),
                      blurRadius: 12,
                      spreadRadius: 3,
                    )
                  ],
                ),
                defaultDecoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  shape: BoxShape.rectangle,
                ),
                weekendDecoration: BoxDecoration(
                  border: Border.all(color: Colors.pink.shade200),
                  shape: BoxShape.rectangle,
                ),
                selectedTextStyle: const TextStyle(color: Colors.white),
                todayTextStyle:
                    const TextStyle(color: Color.fromARGB(255, 244, 237, 237)),
                defaultTextStyle: TextStyle(
                  color: isDark ? Colors.white70 : Colors.deepPurple.shade700,
                  fontWeight: FontWeight.bold,
                ),
                weekendTextStyle: TextStyle(
                  color: Colors.pink.shade400,
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
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:
                            isDark ? Colors.pink.shade200 : Colors.deepPurple,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _getTasksForSelectedDay()
                        .asMap()
                        .entries
                        .map((entry) => Card(
                              color: isDark
                                  ? Colors.grey[900]?.withOpacity(0.7)
                                  : Colors.white.withOpacity(0.9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                    color: isDark
                                        ? Colors.pink.shade200
                                        : Colors.purple,
                                    width: 1),
                              ),
                              elevation: 5,
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              child: ListTile(
                                title: Text(
                                  entry.value,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: isDark
                                        ? Colors.pink.shade100
                                        : Colors.deepPurple.shade900,
                                  ),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.edit,
                                          color: isDark
                                              ? Colors.orange
                                              : Colors.orange),
                                      onPressed: () =>
                                          _editTask(entry.key, entry.value),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete,
                                          color:
                                              isDark ? Colors.red : Colors.red),
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isDark ? Colors.pink.shade300 : Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: _showAddTaskDialog,
                      child: Text(
                        'Görev Ekle',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: isDark ? Colors.deepPurple[900] : Colors.white,
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
        color: isDark ? Colors.blueGrey[900] : const Color(0xFFF4FFBC),
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
          backgroundColor: isDark
              ? Colors.grey[900]
              : const Color.fromARGB(255, 234, 202, 160),
          title: const Text('Görev Ekle'),
          content: TextField(
            controller: taskController,
            decoration: InputDecoration(
              hintText: 'Görev adını girin',
              hintStyle:
                  TextStyle(color: isDark ? Colors.pink[200] : Colors.purple),
            ),
            style: TextStyle(color: isDark ? Colors.white : Colors.black),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Vazgeç',
                  style: TextStyle(
                      color: isDark ? Colors.pink[200] : Colors.purple)),
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
              child: Text('Ekle',
                  style: TextStyle(
                      color: isDark ? Colors.pink[200] : Colors.purple)),
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
          backgroundColor: isDark
              ? Colors.grey[900]
              : const Color.fromARGB(255, 234, 202, 160),
          title: const Text('Görevi Düzenle'),
          content: TextField(
            controller: editController,
            decoration: InputDecoration(
              hintText: 'Yeni görev adını gir',
              hintStyle:
                  TextStyle(color: isDark ? Colors.pink[200] : Colors.purple),
            ),
            style: TextStyle(color: isDark ? Colors.white : Colors.black),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('İptal',
                  style: TextStyle(
                      color: isDark ? Colors.pink[200] : Colors.purple)),
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
              child: Text('Kaydet',
                  style: TextStyle(
                      color: isDark ? Colors.pink[200] : Colors.purple)),
            ),
          ],
        );
      },
    );
  }
}
