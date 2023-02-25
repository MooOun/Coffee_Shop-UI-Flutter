import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class CoffeeType extends StatelessWidget {
  final String coffeeType;
  final bool isSelect;
  final VoidCallback Ontap;

  CoffeeType({
    required this.coffeeType,
    required this.isSelect,
    required this.Ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Ontap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Text(
          coffeeType,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isSelect ?  Colors.orange : Colors.white,
          ),
        ),
      ),
    );
  }
}
