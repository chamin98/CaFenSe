import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cafense_mobile/widgets/button1.dart';

class addCard extends StatefulWidget {
  const addCard({Key? key}) : super(key: key);

  @override
  _addCardState createState() => _addCardState();
}

class _addCardState extends State<addCard> {
  final cardHnameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    cardHnameController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Add Card',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          top: true,
          child: Column(
            children: [
              cardBar(),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    buildCardHname(),
                    SizedBox(
                      height: 30.0,
                    ),
                    cardNumber(),
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      children: [
                        validThru(),
                        SizedBox(
                          width: 30.0,
                        ),
                        cvv(),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    default_button(
                      bText: " ADD",
                      onPressed: () {
                        Navigator.pushNamed(context, '/paymentMethod');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget cardBar() => Stack(
      children: [
        Container(
            width: 411,
            height: 93,
            decoration: BoxDecoration(
              color: Color.fromRGBO(214, 192, 174, 0.1599999964237213),
            )),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/Mastercard.png'),
              Image.asset('assets/images/Visa.png'),
              Image.asset('assets/images/Amex.png'),
            ],
          ),
        ),
      ],
    );

Widget buildCardHname() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Card Holders Name',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(130, 59, 7, 1),
              fontFamily: 'Work Sans',
              fontSize: 18,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1),
        ),
        SizedBox(
          height: 10.0,
        ),
        TextFormField(
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromRGBO(230, 216, 205, 1),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(231, 112, 16, 1), width: 1)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(231, 112, 16, 1), width: 1)),
            hintText: 'Name',
          ),
        ),
      ],
    );

Widget cardNumber() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Card Number',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(130, 59, 7, 1),
              fontFamily: 'Work Sans',
              fontSize: 18,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1),
        ),
        SizedBox(
          height: 10.0,
        ),
        TextField(
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(230, 216, 205, 1),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(231, 112, 16, 1), width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(231, 112, 16, 1), width: 1)),
              hintText: '1234 5678 9123 456'),
        ),
      ],
    );

Widget validThru() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Valid Thru',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(130, 59, 7, 1),
              fontFamily: 'Work Sans',
              fontSize: 18,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          width: 125.0,
          child: TextField(
            keyboardType: TextInputType.datetime,
            decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(230, 216, 205, 1),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(231, 112, 16, 1), width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(231, 112, 16, 1), width: 1)),
                hintText: '01/23'),
          ),
        ),
      ],
    );

Widget cvv() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CVV',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(130, 59, 7, 1),
              fontFamily: 'Work Sans',
              fontSize: 18,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          width: 125.0,
          child: TextField(
            keyboardType:
                TextInputType.numberWithOptions(decimal: false, signed: true),
            decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(230, 216, 205, 1),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(231, 112, 16, 1), width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(231, 112, 16, 1), width: 1)),
                hintText: '123'),
          ),
        ),
      ],
    );
