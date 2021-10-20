import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AvailableOrdersTable extends StatelessWidget {
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
        margin: EdgeInsets.only(bottom: 30),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(
            children: [
              const SizedBox(width: 10),
              const Text("Orders",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold)),
              Expanded(child: Container()),
              IconButton(onPressed: () {}, icon: Icon(Icons.sort)),
              const Text("Sort")
            ],
          ),
          DataTable2(
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 600,
              columns: const [
                DataColumn2(label: Text("Order Details"), size: ColumnSize.L),
                DataColumn2(label: Text('Qty'), size: ColumnSize.S),
                DataColumn2(label: Text('Username'), size: ColumnSize.M),
                DataColumn(label: Text('Need at')),
                DataColumn2(label: Text("Other Details"), size: ColumnSize.L),
                DataColumn2(label: Text('Price'), size: ColumnSize.S),
                DataColumn(label: Text('Done')),
              ],
              rows: List<DataRow>.generate(
                  7,
                  (index) => DataRow(cells: [
                        DataCell(Text("Rice & Curry Chicken")),
                        DataCell(Text("x" + "2")),
                        DataCell(Text("Tom Cruise")),
                        DataCell(Text("07.00 AM")),
                        DataCell(Text("Need Large Chcken pcs")),
                        DataCell(Text("400.00")),
                        DataCell(SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                                child: Row(children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.done_outline_rounded,
                                      color: Colors.green)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.cancel,
                                      color: Colors.red))
                            ]))))
                      ])))
        ]));
  }
}
