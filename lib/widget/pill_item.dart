import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'pill_detail.dart';

class PillItem extends StatelessWidget{
  const PillItem({super.key, required this.pill});

  final Map<String,dynamic> pill;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (ctx) => PillDetail(pill: pill)));
        },
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  Color(0xFFF8F8F6),
                  Color.fromARGB(255, 190, 190, 190),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/image/drugs 1.png'),
                Expanded(
                  child: Column(
                    children: [
                      Text(pill['pillName']),
                      Text(pill['notiTimeHour'].toString() + ':' + pill['notiTimeMinute'].toString()),
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                Icon(Icons.play_circle_outline_rounded),
              ],
            ),
        ),
      );
  }
}