import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FeedbackTable extends StatelessWidget {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Feedbacks').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LinearProgressIndicator();
          }

          return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: Color(0xffa4a6b3).withOpacity(.4), width: .5),
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
                Row(children: const [
                  SizedBox(width: 10),
                  Text("Feedbacks",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold))
                ]),
                SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(1.2),
                    child: DataTable(
                            columns: const [
                              DataColumn(label: Text("Feedback")),
                              DataColumn(label: Text('Username')),
                              DataColumn(label: Text('Food'))
                            ],
                            rows: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data()! as Map<String, dynamic>;
                              return DataRow(cells: [
                                DataCell(Text(data['feedback'])),
                                DataCell(Text(data['user'])),
                                DataCell(Text(data['food'])),
                              ]);
                            }).toList()))
              ]));
        });
  }
}
