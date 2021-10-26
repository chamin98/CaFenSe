import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker_web/image_picker_web.dart';

AlertDialog addFood() {
  return AlertDialog(
      content: SingleChildScrollView(
          child: Container(
              height: 400,
              width: 500,
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                const Text("Add New Food",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    )),
                Row(children: [
                  Expanded(child: Container(color: Colors.black, height: 5))
                ]),
                const SizedBox(height: 20.0),
                Padding(padding: const EdgeInsets.all(25), child: addFoodForm())
              ]))));
}

class addFoodForm extends StatefulWidget {
  @override
  _addFoodFormState createState() => _addFoodFormState();
}

class _addFoodFormState extends State<addFoodForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _nameController;
  String? dropdownValue;
  TextEditingController? _priceController;
  File? _imageFile;
  String? imgurl;

  void initState() {
    _nameController = TextEditingController();
    _priceController = TextEditingController();
    super.initState();
  }

  void dispose() {
    _nameController!.dispose();
    _priceController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          Row(children: [
            const Text("Food Name : "),
            Flexible(
                child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: "Enter Food Name",
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
            const Text("Category : "),
            Flexible(
                child: DropdownButton(
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
                      "Breakfast",
                      "Bevarages",
                      "Fast Food",
                      "Desserts",
                      "Other"
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value, child: Text(value));
                    }).toList()))
          ]),
          const SizedBox(height: 10),
          Row(children: [
            const Text("Price : "),
            Flexible(
                child: TextFormField(
                    controller: _priceController,
                    decoration: InputDecoration(
                        labelText: "Enter the price",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide:
                                const BorderSide(color: Colors.black45)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide:
                                const BorderSide(color: Colors.black45)))))
          ]),
          const SizedBox(height: 20),
          Row(children: [
            const Text("Add Image : "),
            ElevatedButton(
                child: const Text('UPLOAD an Image'),
                onPressed: () async {
                  _pickImage();
                }),
            const Spacer(),
            Text(_imageFile != null ? _imageFile!.name : '')
          ]),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            ElevatedButton(
                style:
                    ElevatedButton.styleFrom(primary: const Color(0xfff07749)),
                onPressed: () async {
                  await firebaseAddFood();
                  Navigator.pop(context);
                },
                child: const Text("Save")),
            const SizedBox(width: 30),
            ElevatedButton(
                style:
                    ElevatedButton.styleFrom(primary: const Color(0xfff07749)),
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"))
          ])
        ]));
  }

  Future _pickImage() async {
    try {
      File selected =
          await ImagePickerWeb.getImage(outputType: ImageType.file) as File;
      setState(() => _imageFile = selected);
    } on PlatformException catch (e) {
      Fluttertoast.showToast(timeInSecForIosWeb: 30, msg: e.message!);
    }
  }

  Future _uploadFile() async {
    if (_imageFile == null) return;
    final destination = 'Foods/' + _nameController!.text.trim() + ".jpeg";
    try {
      TaskSnapshot? x;
      await FirebaseStorage.instance
          .ref(destination)
          .putBlob(_imageFile)
          .then((p0) => x = p0);
      setState(() {
        imgurl = x!.ref.getDownloadURL() as String?;
      });
    } on FirebaseException catch (e) {
      Fluttertoast.showToast(timeInSecForIosWeb: 30, msg: e.message!);
    }
  }

  Future<void> firebaseAddFood() async {
    try {
      await _uploadFile();
      String fname = _nameController!.text.trim();
      await FirebaseFirestore.instance
          .collection(dropdownValue!)
          .doc(fname)
          .set({
        'price': double.parse(_priceController!.text),
        'availability': false,
        'iurl': imgurl
      }).then((value) => Fluttertoast.showToast(
              timeInSecForIosWeb: 10, msg: "succesfully adde $fname"));
    } on FirebaseException catch (e) {
      Fluttertoast.showToast(timeInSecForIosWeb: 30, msg: e.message!);
    }
  }
}
