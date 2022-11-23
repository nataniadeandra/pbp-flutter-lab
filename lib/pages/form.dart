import 'package:flutter/material.dart';
import 'package:counter_7/pages/data.dart';
import 'package:counter_7/widget/drawer.dart';
import 'package:counter_7/main.dart';

class AddBudgetPage extends StatefulWidget {
  static List<List<Object>> listData = _AddBudgetPageState.list;
  const AddBudgetPage({super.key});

  @override
  State<AddBudgetPage> createState() => _AddBudgetPageState();
}

class _AddBudgetPageState extends State<AddBudgetPage> {
  static final List<List<Object>> list = [];
  final _formKey = GlobalKey<FormState>();
  String judul = '';
  int nominal = 0;
  DateTime tanggal = DateTime.now();

  String? jenis = null;
  List<String> listJenis = ['Pemasukan', 'Pengeluaran'];
  List<Object> listForm = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Budget')
      ),
      // Adding drawer menu
      drawer: const DrawerApp(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [

                // JUDUL
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      labelText: 'Judul',
                    ),

                    onChanged: (String? value) {
                      setState(() {
                        judul = value!;
                      });
                    },

                    onSaved: (String? value) {
                      setState(() {
                        judul = value!;
                      });
                    },

                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },

                  ),
                ),

                // NOMINAL
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      labelText: 'Nominal',
                    ),
                    // Menambahkan behavior saat data diubah
                    onChanged: (String? value) {
                      setState(() {
                        nominal = int.parse(value!);
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        nominal = int.parse(value!);
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak bisa kosong!';
                      }
                      return null;
                    },
                  ),
                ),

                // JENIS
                Center(
                  child: DropdownButton<String>(
                    icon: const Icon(Icons.keyboard_arrow_down),
                    hint: const Text(
                      "Pilih Jenis",
                      textAlign: TextAlign.center,
                    ),
                    value: jenis,
                    
                    items: listJenis
                    .map((String val) => DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        ))
                    .toList(),

                    onChanged: (String? value) {
                      setState(() {
                        jenis = value!;
                      });
                    },
                  ),
                ),

                // TANGGAL
                ListTile(
                  title: Text(tanggal.toString()),
                  leading: TextButton.icon(
                    icon: const Icon(Icons.calendar_today),
                    label: const Text("Pilih Tanggal"),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2099),
                      ).then((date) {
                        setState(() {
                          tanggal = date!;
                        });
                      });
                    },
                  ),
                ),

              ],
            ),
          ),
          
        ),
      ),
      
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextButton(
            onPressed: (){
              if (_formKey.currentState!.validate()) {
                listForm.add(judul);
                listForm.add(nominal);
                listForm.add(jenis.toString());
                listForm.add(tanggal);
                list.add(listForm);
                listForm = [];
              }
            },
            child: const Text("Simpan"),
          ),
        ]
      ),
          
    );
  }
}