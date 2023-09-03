import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() {
    return _AddItemScreenState();
  }
}


class _AddItemScreenState extends State<AddItemScreen> {
  List<bool> _selectedDosage = [false, false, false];
  final format = DateFormat('hh:mma');
  
  final _PillNameController = TextEditingController();
  final _AmountController = TextEditingController();
  final _DuratrionController = TextEditingController();
  //final _ScheduleController = TextEditingController();
  DateTime _TimeController = DateTime.now();

void _onAddPill() {
    print(_PillNameController.text);
    print(_AmountController.text);
    print(_DuratrionController.text);
    String _ScheduleController='None';
    for (int i=0;i<3;i++){
      if (_selectedDosage[i] == true){
        if (i==0) _ScheduleController = 'Before meal';
        if (i==1) _ScheduleController = 'In meal';
        if (i==2) _ScheduleController = 'After meal';
      }
    }
    print(_ScheduleController);
    int notiHour = _TimeController.hour;
    int notiMinute = _TimeController.minute;
    print (notiHour);
    print(notiMinute);
/*     final url = Uri.http('172.16.2.38:4000', '/medicines/add');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          'pillName': _PillNameController.text,
          'pillAmount': int.tryParse( _AmountController.text),
          'pillTotal': (int.tryParse(_DuratrionController.text)! * int.tryParse(_AmountController.text)!),
          'dosage': _ScheduleController,
          'notiTimeHour': notiHour,
          'notiTimeMinute': notiMinute,
        },
      ),
    ); 
    print(response.statusCode);*/
    Navigator.of(context).pop({
      'pillName': _PillNameController.text,
          'pillAmount': int.tryParse( _AmountController.text),
          'pillTotal': (int.tryParse(_DuratrionController.text)! * int.tryParse(_AmountController.text)!),
          'dosage': _ScheduleController,
          'notiTimeHour': notiHour,
          'notiTimeMinute': notiMinute,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Add Plan',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('Pill name'),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                //alignment: Alignment.center,
                //padding: EdgeInsets.only(left: 40),
                width: double.infinity,
                height: 70,
                child: TextField(
                  controller: _PillNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Oxycodone, Humira, Amebismo,... ',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 165, 164, 164),
                      fontSize: 15,
                    ),
                    fillColor: Color(0xFFF8F8F6),
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('Amount & How Long?'),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    width: 160,
                    height: 70,
                    child: TextField(
                      controller: _AmountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        suffixText: 'Units',

                        prefixIcon: Icon(Icons.forest_outlined),
                        //hintText: 'Oxycodone, Humira, Amebismo,... ',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 165, 164, 164),
                          fontSize: 15,
                        ),
                        fillColor: Color(0xFFF8F8F6),
                        filled: true,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 160,
                    height: 70,
                    child: TextField(
                      controller: _DuratrionController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today),
                        suffixText: 'Days',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        //hintText: 'Oxycodone, Humira, Amebismo,... ',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 165, 164, 164),
                          fontSize: 15,
                        ),
                        fillColor: Color(0xFFF8F8F6),
                        filled: true,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text('Medicaltion Schedule'),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 0, vertical: 10),
                alignment: Alignment.center,
                child: ToggleButtons(
                  //direction: vertical ? Axis.vertical : Axis.horizontal,
                  onPressed: (int index) {
                    setState(() {
                      // The button that is tapped is set to true, and the others to false.
                      for (int i = 0; i < _selectedDosage.length; i++) {
                        _selectedDosage[i] = i == index;
                      }
                    });
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  //selectedBorderColor: Colors.red[700],
                  //selectedColor: Color(0xFF003D86),
                  fillColor: Color(0xFF003D86),
                  //color: Colors.red[400],
                  constraints: const BoxConstraints(
                    minHeight: 120.0,
                    minWidth: 120.0,
                  ),
                  isSelected: _selectedDosage,
                  children: [
                    //Text('Hello'),
                    //Text('Good bye'),
                    //Text('byebye'),
                    Image.asset('assets/image/before_meal.png'),
                    //SizedBox(width: 10),
                    Image.asset('assets/image/in_meal.png'),
                    //SizedBox(width: 10),
                    Image.asset('assets/image/after_meal.png'),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('Notifications'),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: DateTimeField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.alarm),
                    //suffixText: 'Days',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Color(0xFFF8F8F6),
                    filled: true,
                  ),
                  format: format,
                  onShowPicker: (context, currentvalue) async {
                    final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                            currentvalue ?? DateTime.now()));
                    _TimeController = DateTimeField.convert(time)!;
                    return _TimeController;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: _onAddPill,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF003D86),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                    minimumSize: const Size(300, 60),
                  ),
                  child: Text(
                    'Done',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
