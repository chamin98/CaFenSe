import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

AlertDialog editAccDetails() {
  return AlertDialog(
      content: SingleChildScrollView(
          child: Container(
              width: 400.0,
              child: Column(children: [
                Text(
                  "Edit user details",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 25.0),
                editAccDetailsForm(),
                SizedBox(height: 10.0),
              ]))));
}

class editAccDetailsForm extends StatefulWidget {
  @override
  _editAccDetailsFormState createState() => _editAccDetailsFormState();
}

class _editAccDetailsFormState extends State<editAccDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _nameController;
  TextEditingController? _emailController;
  File? _image;
  String password = "";
  String imgurl = "";

  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    super.initState();
  }

  void dispose() {
    _nameController!.dispose();
    _emailController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    _nameController!.text = user!.displayName!;
    _emailController!.text = user.email!;

    return Form(
        key: _formKey,
        child: Column(children: [
          TextField(
              controller: _nameController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Name",
                  hintText: _nameController!.text,
                  floatingLabelBehavior: FloatingLabelBehavior.always)),
          SizedBox(height: 10),
          TextField(
              controller: _nameController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: _emailController!.text,
                  floatingLabelBehavior: FloatingLabelBehavior.always)),
          SizedBox(height: 10),
          TextFormField(
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              validator: (value) =>
                  value!.length < 6 ? "Password is too short" : null,
              onChanged: (value) => setState(() {
                    password = value;
                  }),
              decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your new Password",
                  floatingLabelBehavior: FloatingLabelBehavior.always)),
          SizedBox(height: 10),
          ElevatedButton(
              onPressed: () async {
                try {
                  final image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (image == null) return;
                  setState(() {
                    _image = File(image.path);
                  });
                } on PlatformException catch (e) {
                  SnackBar(content: Text("failed :" + e.message!));
                } on FirebaseException catch (e) {
                  SnackBar(content: Text("failed :" + e.message!));
                }
              },
              child: Text(
                  _image == null ? "add image" : _image!.absolute.toString())),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xfff07749),
              ),
              onPressed: () {
                _nameController!.text != user.displayName
                    ? user.updateDisplayName(_nameController!.text.trim())
                    : null;
                password != '' ? user.updatePassword(password) : null;
                _emailController!.text != user.email!
                    ? user.updateEmail(_emailController!.text.trim())
                    : null;
                _uploadFile();
                imgurl != '' ? user.updatePhotoURL("") : null;
                Navigator.pop(context);
              },
              child: Text('Continue'))
        ]));
  }

  Future _uploadFile() async {
    if (_image == null) return;
    final destination = 'users/' + _nameController!.text.trim() + ".jpeg";
    try {
      String? url;
      await FirebaseStorage.instance
          .ref(destination)
          .putFile(_image!)
          .then((p0) {
        setState(() {
          imgurl = p0.ref.getDownloadURL().toString();
        });
      });
    } on FirebaseException catch (e) {
      SnackBar(content: Text(e.message!));
    }
  }
}
