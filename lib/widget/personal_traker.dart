import 'package:flutter/material.dart';
import 'package:hcmumass/data/pills.dart';
import 'package:hcmumass/widget/pill_item.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PersonalTracker extends StatefulWidget {
  const PersonalTracker({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PersonalTrackerState();
  }
}

class _PersonalTrackerState extends State<PersonalTracker> {
   List<Map<String, dynamic>> _PillList = [];

  @override
  void initState() {
    _loadItem();
    super.initState();
  }

  void _loadItem() {
/*     if (_PillList.isEmpty) return;
    final url = Uri.http('172.16.2.38:4000', '/medicines/');
    final response = await http.get(url);
    final List<Map<String, dynamic>> listData = json.decode(response.body); */
    //final List<Map<String, dynamic>> _loadedItem = [];
    setState(() {
      _PillList = dummyData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Plan',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30,),
            Text('My List', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
            const SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemCount: _PillList.length,
                itemBuilder: (context, index) {
                  return PillItem(pill: _PillList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
