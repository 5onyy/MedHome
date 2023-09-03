import 'package:hcmumass/data/pills.dart';
import 'package:hcmumass/widget/pill_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hcmumass/widget/pill_item.dart';

class PillList extends StatefulWidget {
  const PillList({super.key});

  @override
  State<PillList> createState() {
    return _PillListState();
  }
}

class _PillListState extends State<PillList> {
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
    return Container(
      
      width: double.infinity,
      //padding: EdgeInsets.all(20),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _PillList.length,
        itemBuilder: ((context, index) {
          return PillItem(pill: _PillList[index]);
        }),
      ),
    );
  }
}
