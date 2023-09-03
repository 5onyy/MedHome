import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

final format = DateFormat('hh:mma');

class PillDetail extends StatelessWidget {
  const PillDetail({super.key, required this.pill});

  final Map<String, dynamic> pill;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine Details: '),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pill['pillName'],
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                    format
                        .format(DateTimeField.convert(TimeOfDay(
                            hour: pill['notiTimeHour'],
                            minute: pill['notiTimeMinute']))!)
                        .toString(),
                    style: TextStyle(
                      fontSize: 18,
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(children: [
              Text('Amount: ${pill['pillAmount']}',
                  style: TextStyle(
                    fontSize: 18,
                  )),
              Spacer(),
              Text('Duration:  ${pill['duration']}',
                  style: TextStyle(
                    fontSize: 18,
                  )),
            ]),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Note: ',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                Text('Plase Take the medicine ${pill['dosage']}',
                    style: TextStyle(
                      fontSize: 18,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
