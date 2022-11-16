import 'package:flutter/material.dart';
import 'package:counter_7/data.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/main.dart';

class DrawerApp extends StatelessWidget{
  const DrawerApp({super.key});

  @override 
  Widget build(BuildContext context){
    
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: const Text('counter_7'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Add Budget'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AddBudgetPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Budget Data'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const DataBudgetPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}