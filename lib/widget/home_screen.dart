import 'package:flutter/material.dart';
import 'package:hcmumass/data/pills.dart';
import 'package:hcmumass/widget/add_item.dart';
import 'pill_list.dart';
import 'personal_traker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {

  List<Widget> Screens = [
    HomeScreen(),
    PersonalTracker(),
    AddItemScreen(),
    AddItemScreen(),
    AddItemScreen(),
  ];

  void _navigateTo(int index) async{
    final PillDetail = await Navigator.push<Map<String,dynamic>>(
        context, MaterialPageRoute(builder: (context) => Screens[index]));
    dummyData.insert(0, PillDetail!);
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: NavigationBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        //onTap: () {},
        height: 60,
        //selectedIndex: index,
        onDestinationSelected: (index) => {
          _navigateTo(index),
        },
        destinations: <Widget>[
          NavigationDestination(
            icon: Icon(Icons.grid_view_rounded, color: Color(0xFF003D86)),
            label: '',
          ),
          NavigationDestination(
            icon:
                Icon(Icons.calendar_view_day_rounded, color: Color(0xFF003D86)),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.add_circle_rounded,
              size: 70,
              color: Color(0xFF003D86),
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat, color: Color(0xFF003D86)),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.supervised_user_circle_rounded,
                color: Color(0xFF003D86)),
            label: '',
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 35,
          horizontal: 25,
        ),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              //width: double.infinity,
              height: 35,
              child: Expanded(
                child: Row(
                  children: [
                    Text(
                      'Hello, Son',
                      style: TextStyle(
                        //color: Colors.white,
                        fontSize: 28,
                        fontFamily: 'Alegreya',
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/plain_avatar.jpq',),
                      radius: 40,
                    )
                  ],
                ),
              ),
            ),
            Image.asset(
              'assets/image/HomeScreenImage.png',
              fit: BoxFit.cover,
              width: 500,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Daily Review',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            //const SizedBox(height: 10,),
            Expanded(child: PillList()),
          ],
        ),
      ),
    );
  }
}
