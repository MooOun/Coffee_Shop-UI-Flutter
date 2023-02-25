import 'package:drippincafe/utils/coffee_tile.dart';
import 'package:drippincafe/utils/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeeType = [
    [
      'กาแฟ',
      true,
    ],
    [
      'ชา',
      false,
    ],
    [
      'เครื่องดื่มอื่นๆ',
      false,
    ],
    [
      'เบเกอรี่',
      false,
    ]
  ];

  void coffeeTypeSelect(int index) {
   setState(() {
    for(int i = 0; i<coffeeType.length; i++){
      coffeeType[i][1] = false;
    }
     coffeeType[index][1] = true;
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'ชื่นชอบ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'เเจ้งเตือน',
          ),
        ],
      ),
      // ignore: prefer_const_literals_to_create_immutables
      body: Column(
        children: [
          // Find the best coffe for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Drippin café',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),

          //Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'ค้นหากาแฟ ...',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade500),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 25,
          ),

          //horizontal list coffe
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                  coffeeType: coffeeType[index][0],
                  isSelect: coffeeType[index][1],
                  Ontap: () {
                    coffeeTypeSelect(index);
                  },
                );
              },
            ),
          ),

          //Coffee List
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeeImagePath: 'assets/images/hotcoffee.jpg',
                  coffeeName: 'Dirty - Brazil',
                  coffeePrice: '190',
                  coffeeDescription: 'Dirty - Brazil Santos      เมนูเเนะนำประจำร้าน Drippin Coffee Roaster ☕️ 📌'
                ),
                CoffeeTile(
                  coffeeImagePath: 'assets/images/colddrip.jpg',
                  coffeeName: 'DARK ROAST',
                  coffeePrice: '170',
                  coffeeDescription: 'New Arrival!! DARK ROAST Clean , Sweet , Balance Delivery Only 🛵 💨'
                ),
                CoffeeTile(
                  coffeeImagePath: 'assets/images/thaitea.jpg',
                  coffeeName: 'Iced Matcha',
                  coffeePrice: '150',
                  coffeeDescription: 'สัมผัสรสชาติจากญี่ปุ่นเเท้ๆ    กับเมนู Iced Matcha  Delivery Only 🛵 💨'
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
