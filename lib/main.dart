import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(const HelperMethods());

class HelperMethods extends StatelessWidget {
  const HelperMethods({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalendarHelperMethods(),
    );
  }
}

class CalendarHelperMethods extends StatefulWidget {
  const CalendarHelperMethods({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => ScheduleExample();
}

class ScheduleExample extends State<CalendarHelperMethods> {
  late _AppointmentDataSource _dataSource;
  late Appointment recurrenceApp;

  @override
  void initState() {
    _dataSource = _getCalendarDataSource();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Center(
                child: TextButton(
                  onPressed: _showPatternAppointment,
                  child: const Text("Click to get pattern appointment"),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: _showOccurrenceAppointment,
                  child: const Text("Click to get occurrence appointment"),
                ),
              ),
              Expanded(
                child: SfCalendar(
                  view: CalendarView.week,
                  dataSource: _dataSource,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    recurrenceApp = Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 2)),
      subject: 'Meeting',
      color: Colors.green,
      startTimeZone: '',
      endTimeZone: '',
      recurrenceRule: 'FREQ=DAILY;INTERVAL=2;COUNT=5',
    );
    appointments.add(recurrenceApp);
    appointments.add(Appointment(
        startTime: DateTime(2021, 07, 28, 5),
        endTime: DateTime(2021, 07, 30, 7),
        subject: 'Discussion',
        color: Colors.orangeAccent,
        startTimeZone: '',
        endTimeZone: '',
        isAllDay: true));
    return _AppointmentDataSource(appointments);
  }

  _showPatternAppointment() async {
    final Appointment patternAppointment =
        _dataSource.getPatternAppointment(recurrenceApp, '') as Appointment;
    await showDialog(
      builder: (context) => AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: Text("Subject:" + patternAppointment.subject),
        actions: <Widget>[
          TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
      context: context,
    );
  }

  _showOccurrenceAppointment() async {
    final DateTime date = DateTime.now();
    final Appointment occurrenceAppointment = _dataSource
        .getOccurrenceAppointment(recurrenceApp, date, '') as Appointment;
    await showDialog(
      builder: (context) => AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Subject: " + occurrenceAppointment.subject.toString(),
            ),
            Text(
              "Recurrence rule: " +
                  occurrenceAppointment.recurrenceRule.toString(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
      context: context,
    );
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
