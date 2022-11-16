import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/form.dart' as form;
import 'package:counter_7/main.dart';

class DataBudgetPage extends StatefulWidget {
  const DataBudgetPage({super.key});

  @override
  State<DataBudgetPage> createState() => _DataBudgetState();
}

class _DataBudgetState extends State<DataBudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Budget'),
      ),
      drawer: const DrawerApp(),
      body: Center(
        child: ListView.builder(
          itemCount: form.AddBudgetPage.listData.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.circular(5.0),
                shadowColor: Colors.blueGrey,
                child: ListTile(
                  title: Text(form.AddBudgetPage.listData[index][0].toString()),
                  subtitle: Text(form.AddBudgetPage.listData[index][1].toString()),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(form.AddBudgetPage.listData[index][2].toString()),
                      Text(
                        form.AddBudgetPage.listData[index][3].toString(),
                        style: const TextStyle(color: Colors.grey),
                      )
                    ]
                  ),
                )),
            );
          }),
        )
      ),
    );
  }
}