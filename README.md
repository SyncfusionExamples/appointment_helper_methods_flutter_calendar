# How to use the CalendarDataSource's helper method in the Flutter Calendar (SfCalendar)?

This example demonstrates how to use the CalendarDataSource's helper method in the Flutter Calendar.

Using the [getPatternAppointment](https://pub.dev/documentation/syncfusion_flutter_calendar/latest/calendar/CalendarDataSource/getPatternAppointment.html) and [getOccurrenceAppointment](https://pub.dev/documentation/syncfusion_flutter_calendar/latest/calendar/CalendarDataSource/getOccurrenceAppointment.html) helper methods of [CalendarDataSource](https://pub.dev/documentation/syncfusion_flutter_calendar/latest/calendar/CalendarDataSource-class.html), you can get the Pattern and Occurrence data of the recurrence appointment in the Flutter Calendar.

## Getting the pattern appointment

You can collect the information of the pattern appointment from the Flutter calendar by using the getPatternAppointment method. 

```
Center(
child: TextButton(
onPressed: _showPatternAppointment,
child: const Text("Click to get pattern appointment"),
),
),
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

```

## Getting the occurrence appointment

You can collect the information of the occurrence appointment from the Flutter calendar by using the getOccurrenceAppointment method.

```
Center(
child: TextButton(
onPressed: _showOccurrenceAppointment,
child: const Text("Click to get occurrence appointment"),
),
),

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

```

You can also refer our UG documentation to know more about [getPatternAppointment](https://help.syncfusion.com/flutter/calendar/appointments#get-pattern-appointment) and [getOccurrenceAppointment](https://help.syncfusion.com/flutter/calendar/appointments#get-occurrence-appointment) in the Flutter calendar.

## Requirements to run the demo
* [VS Code](https://code.visualstudio.com/download)
* [Flutter SDK v1.22+](https://flutter.dev/docs/development/tools/sdk/overview)
* [For more development tools](https://flutter.dev/docs/development/tools/devtools/overview)

## How to run this application
To run this application, you need to first clone or download the ‘create a flutter maps widget in 10 minutes’ repository and open it in your preferred IDE. Then, build and run your project to view the output.

## Further help
For more help, check the [Syncfusion Flutter documentation](https://help.syncfusion.com/flutter/introduction/overview),
 [Flutter documentation](https://flutter.dev/docs/get-started/install).