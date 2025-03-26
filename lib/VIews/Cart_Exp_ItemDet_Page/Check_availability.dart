import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  bool isAvailable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.now(), // Start from today
              lastDay: DateTime.utc(2030, 12, 31), // End at a future date
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              enabledDayPredicate: (day) {
                // Disable past dates
                return day
                    .isAfter(DateTime.now().subtract(const Duration(days: 1)));
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isAvailable = !isAvailable;
                });
              },
              // onPressed: _selectedDay == null
              //     ? null
              //     : () {
              //         // Uncomment and use this to navigate to the details page
              //         // Navigator.push(
              //         //   context,
              //         //   MaterialPageRoute(
              //         //     builder: (context) => DetailsPage(
              //         //       selectedDate: _selectedDay!,
              //         //     ),
              //         //   ),
              //         // );
              //       },
              child: isAvailable
                  ? const Text('Available')
                  : const Text('Check availibility'),
            ),
          ],
        ),
      ),
    );
  }
}
