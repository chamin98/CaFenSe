import 'package:flutter/material.dart';

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
                Padding(padding: EdgeInsets.all(25), child: addFoodForm())
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
                        borderSide: BorderSide(color: Colors.black45),
                        gapPadding: 10,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Colors.black45)),
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
                child: TextField(
                    controller: _priceController,
                    decoration: InputDecoration(
                        labelText: "Enter the price",
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
                  onPressed: () {},
                  child: const Text("Save")),
              SizedBox(width: 30),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0xfff07749)),
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"))
            ],
          )
        ]));
  }
}
