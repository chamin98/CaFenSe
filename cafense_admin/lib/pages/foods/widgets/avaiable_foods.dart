import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'add_food.dart';

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
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border.all(color: Color(0xffa4a6b3).withOpacity(.4), width: .5),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 6),
                color: Colors.grey.withOpacity(.1),
                blurRadius: 12)
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 30),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          //Table title
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
            Expanded(child: Container()),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xfff07749)),
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
                DataColumn2(label: Text("Food"), size: ColumnSize.S),
                DataColumn2(label: Text(''), size: ColumnSize.M),
                DataColumn2(label: Text('Price'), size: ColumnSize.S),
                DataColumn2(label: Text("Availability"), size: ColumnSize.S),
                DataColumn(label: Text(""))
              ],
              rows: List<DataRow>.generate(
                  7,
                  (index) => DataRow(cells: [
                        DataCell(Image.asset("assets/logo.png")),
                        DataCell(Text("Rice & Curry Chicken")),
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
                        DataCell(Container(
                            height: 30,
                            child: ToggleButtons(
                              borderColor: Colors.black,
                              fillColor: Colors.orange,
                              selectedBorderColor: Colors.black,
                              selectedColor: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              children: [Text('yes'), Text('No')],
                              onPressed: (int index) {
                                setState(() {
                                  for (int i = 0; i < isSelected.length; i++) {
                                    isSelected[i] = i == index;
                                  }
                                });
                              },
                              isSelected: isSelected,
                            ))),
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
                      ])))
        ]));
  }
}
