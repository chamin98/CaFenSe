import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:cafense_admin/pages/foods/widgets/add_food.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'edit_food.dart';

class AvailableFoodsTable extends StatefulWidget {
  const AvailableFoodsTable({Key? key}) : super(key: key);

  @override
  _AvailableFoodsTableState createState() => _AvailableFoodsTableState();
}

class _AvailableFoodsTableState extends State<AvailableFoodsTable> {
  TextEditingController? _priceController;
  String dropdownValue = "Lunch";
  late List<bool> isSelected;

  void initState() {
    _priceController = TextEditingController();
    isSelected = [true, false];
    super.initState();
  }

  void dispose() {
    _priceController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _foodsStream = FirebaseFirestore.instance
        .collection(dropdownValue)
        .orderBy("availability")
        .snapshots();
    return StreamBuilder<QuerySnapshot>(
        stream: _foodsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LinearProgressIndicator();
          }
          if (snapshot.data == null) {
            return Center(child: Image.asset("assets/Nothing.png"));
          } else {
            return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: const Color(0xffa4a6b3).withOpacity(.4),
                      width: .5),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 6),
                        color: Colors.grey.withOpacity(.1),
                        blurRadius: 12)
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 30),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Row(children: [
                    const SizedBox(width: 10),
                    DropdownButton(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>[
                        "Lunch",
                        "Bevarages",
                        "Fast Food",
                        "Desserts",
                        "Other"
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                    ),
                    const Spacer(),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xfff07749)),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return addFood();
                              });
                        },
                        child: const Text("Add New Food"))
                  ]),
                  DataTable2(
                      columnSpacing: 12,
                      horizontalMargin: 12,
                      minWidth: 600,
                      columns: const [
                        DataColumn2(label: Text(''), size: ColumnSize.S),
                        DataColumn2(label: Text('Food'), size: ColumnSize.M),
                        DataColumn2(label: Text('Price'), size: ColumnSize.S),
                        DataColumn2(
                            label: Text("Availability"), size: ColumnSize.S),
                        DataColumn2(label: Text("Delete"), size: ColumnSize.S)
                      ],
                      rows:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return DataRow(cells: [
                          DataCell(Image.asset("assets/logo.png")),
                          DataCell(Text(document.id), showEditIcon: true,
                              onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      content: SingleChildScrollView(
                                          child: Container(
                                              height: 400,
                                              width: 500,
                                              padding: const EdgeInsets.all(10),
                                              child: Column(children: [
                                                const Text("Edit Food",
                                                    style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                                Row(children: [
                                                  Expanded(
                                                      child: Container(
                                                          color: Colors.black,
                                                          height: 5))
                                                ]),
                                                const SizedBox(height: 20.0),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            25),
                                                    child: editFoodForm(
                                                        foodname: document.id,
                                                        price: data['price'],
                                                        type: dropdownValue))
                                              ]))));
                                });
                            document.reference.delete();
                          }),
                          DataCell(Text(data['price'].toString())),
                          DataCell(Switch(
                              value: data['availability'],
                              onChanged: (value) async {
                                try {
                                  await FirebaseFirestore.instance
                                      .collection(dropdownValue)
                                      .doc(document.id)
                                      .update({'availability': value}).then(
                                          (val) => Fluttertoast.showToast(
                                              timeInSecForIosWeb: 10,
                                              msg: "data['food'] is " +
                                                  (value ? "now" : "not") +
                                                  " available"));
                                } on FirebaseException catch (e) {
                                  Fluttertoast.showToast(
                                      timeInSecForIosWeb: 30, msg: e.message!);
                                }
                              })),
                          DataCell(IconButton(
                              onPressed: () {
                                document.reference.delete();
                              },
                              icon:
                                  const Icon(Icons.delete, color: Colors.red))),
                        ]);
                      }).toList())
                ]));
          }
        });
  }
}
              /*                                
                        DataCell(SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(children: [
                              Text("Price : "),
                              Container(
                                  height: 30,
                                  width: 75,
                                  child: TextField(
                                      controller: _priceController,
                                      style: TextStyle(fontSize: 12),
                                      decoration: InputDecoration(
                                          labelText: "200",
                                          hintText: "Set price",
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(28),
                                              borderSide: BorderSide(
                                                  color: Colors.black45)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(28),
                                              borderSide: BorderSide(
                                                  color: Colors.black45)))))
                            ]))),
                        
                        DataCell(Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.save, color: Colors.green)),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.delete, color: Colors.red))
                          ],
                        )),
                      ]) */