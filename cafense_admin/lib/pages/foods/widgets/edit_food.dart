import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class editFoodForm extends StatefulWidget {
  final String foodname;
  final double price;
  final String type;
  const editFoodForm(
      {Key? key,
      required this.foodname,
      required this.price,
      required this.type})
      : super(key: key);

  @override
  _editFoodFormState createState() => _editFoodFormState();
}

class _editFoodFormState extends State<editFoodForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _nameController;
  TextEditingController? _priceController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _priceController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController!.dispose();
    _priceController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _nameController?.text = widget.foodname;
    _priceController?.text = widget.price.toString();
    return Form(
        key: _formKey,
        child: Column(children: [
          Row(children: [
            const Text("Food Name : "),
            Flexible(
                child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: _nameController?.text,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: const BorderSide(color: Colors.black45),
                        gapPadding: 10,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: const BorderSide(color: Colors.black45)),
                    )))
          ]),
          const SizedBox(height: 10),
          Row(children: [
            const Text("Price : "),
            Flexible(
                child: TextFormField(
                    controller: _priceController,
                    decoration: InputDecoration(
                        labelText: _priceController?.text,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(color: Colors.black45)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(color: Colors.black45)))))
          ]),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0xfff07749)),
                  onPressed: () {
                    firebaseEditFood(_nameController!.text.trim(),
                        double.parse(_priceController!.text), widget.type);
                    Navigator.pop(context);
                  },
                  child: const Text("Save")),
              const SizedBox(width: 30),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0xfff07749)),
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"))
            ],
          )
        ]));
  }

  Future<void> firebaseEditFood(fname, fprice, ftype) async {
    try {
      await FirebaseFirestore.instance
          .collection(ftype)
          .doc(fname)
          .set({'price': fprice, 'availability': false}).then((value) =>
              Fluttertoast.showToast(
                  timeInSecForIosWeb: 10, msg: "succesfully changed $fname"));
    } on FirebaseException catch (e) {
      Fluttertoast.showToast(timeInSecForIosWeb: 30, msg: e.message!);
    }
  }
}
