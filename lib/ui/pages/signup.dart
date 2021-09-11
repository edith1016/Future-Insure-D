import 'package:flutter/material.dart';
import '../../ui/pages/landing.dart';
import '../../ui/widgets/import_account/fundraiser_view.dart';
import '../../ui/widgets/import_account/mnemonic_view.dart';
import '../../ui/widgets/import_account/private_keyview.dart';
import 'package:insured/homepage.dart';

class Signup extends StatefulWidget {
  const Signup({Key key, this.firstLogin = false}) : super(key: key);
  final bool firstLogin;
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Create Your Wallet',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            MnemonicView(
              afterImport: afterImport,
            ),
          ],
        ),
      ),
    );
  }

  void afterImport() {
    if (widget.firstLogin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    } else {
      Navigator.pop(context);
    }
  }

  Widget buttons(String text, int val) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ElevatedButton(
          onPressed: () => setState(() {
            selectedValue = val;
          }),
          child: Text(
            text,
            style: TextStyle(
                color: selectedValue == val ? Colors.black : Colors.grey[700]),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                selectedValue == val ? Colors.deepPurpleAccent : Colors.white),
          ),
        ));
  }
}
