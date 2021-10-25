import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class AvailableOrdersTable extends StatefulWidget {
  const AvailableOrdersTable({Key? key}) : super(key: key);

  @override
  _AvailableOrdersTableState createState() => _AvailableOrdersTableState();
}

class _AvailableOrdersTableState extends State<AvailableOrdersTable> {
  final Stream<QuerySnapshot> _ordersStream = FirebaseFirestore.instance
      .collection('Available Orders')
      .orderBy("Need at")
      .snapshots();
      

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _ordersStream,
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
                  Row(
                    children: const [
                      SizedBox(width: 10),
                      Text("Orders",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  DataTable2(
                      columnSpacing: 12,
                      horizontalMargin: 12,
                      minWidth: 600,
                      columns: const [
                        DataColumn2(
                            label: Text("Order Details"), size: ColumnSize.L),
                        DataColumn2(label: Text('Qty'), size: ColumnSize.S),
                        DataColumn2(
                            label: Text('Username'), size: ColumnSize.M),
                        DataColumn(label: Text('Need at')),
                        DataColumn2(
                            label: Text("Other Details"), size: ColumnSize.L),
                        DataColumn2(
                            label: Text('Price'),
                            size: ColumnSize.S,
                            numeric: true),
                        DataColumn2(
                            label: Text('Accept / Cancel'), size: ColumnSize.S),
                      ],
                      rows:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return DataRow(cells: [
                          DataCell(Text(data['food'])),
                          DataCell(Text('x' + data['pcs'].toString())),
                          DataCell(Text(data['user'])),
                          DataCell(Text(DateFormat('hh:mm')
                              .format(data['Need at'].toDate()))),
                          DataCell(Text(data['other details'])),
                          DataCell(Text(data['price'].toString())),
                          DataCell(SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: [
                                IconButton(
                                    onPressed: () {
                                      orderButton(data['billId'], "accepted");
                                      document.reference.delete();
                                    },
                                    icon: const Icon(Icons.done_outline_rounded,
                                        color: Colors.green)),
                                IconButton(
                                    onPressed: () {
                                      print(document..toString());
                                      print(data['billId'].toString());
                                      orderButton(data['billId'], "rejected");
                                      document.reference.delete();
                                    },
                                    icon: const Icon(Icons.cancel,
                                        color: Colors.red))
                              ])))
                        ]);
                      }).toList())
                ]));
          }
        });
  }

  Future<void> orderButton(billId, status) async {
    try {
      await FirebaseFirestore.instance
          .collection("Bill")
          .doc(billId)
          .set({'status': status}).then((value) => Fluttertoast.showToast(
              timeInSecForIosWeb: 10, msg: "succesfully $status"));
    } on FirebaseException catch (e) {
      Fluttertoast.showToast(timeInSecForIosWeb: 30, msg: e.message!);
    }
  }
}
