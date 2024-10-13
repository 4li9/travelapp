import 'package:flutter/material.dart';

//لصندوق الادخال
class CustonTextFormAuth extends StatelessWidget {
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;

  const CustonTextFormAuth(
      {Key? key,
      required this.labeltext,
      required this.iconData,
      required this.mycontroller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 0),
      child: TextFormField(
        controller: mycontroller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[100],
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(labeltext)),
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

//لصندوق الادخال كلمه السر

class CustomTextFormAuthPassword extends StatefulWidget {
  final String labelText;
  final IconData iconData;
  final TextEditingController? controller;

  const CustomTextFormAuthPassword({
    Key? key,
    required this.labelText,
    required this.iconData,
    required this.controller,
  }) : super(key: key);

  @override
  _CustomTextFormAuthPasswordState createState() =>
      _CustomTextFormAuthPasswordState();
}

class _CustomTextFormAuthPasswordState
    extends State<CustomTextFormAuthPassword> {
       
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: !_passwordVisible,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          fillColor: Colors.grey[100],
          labelText: widget.labelText,
          filled: true,
          prefixIcon: Icon(widget.iconData),
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
