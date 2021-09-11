import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../ui/pages/landing.dart';
import '../../ui/widgets/import_account/fundraiser_view.dart';
import '../../ui/widgets/import_account/mnemonic_view.dart';
import '../../ui/widgets/import_account/private_keyview.dart';
import 'signup.dart';
import 'login.dart';

class ImportAccount extends StatefulWidget {
  const ImportAccount({Key key, this.firstLogin = false}) : super(key: key);
  final bool firstLogin;
  @override
  State<ImportAccount> createState() => _ImportAccountState();
}

class _ImportAccountState extends State<ImportAccount> {
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: widget.firstLogin
              ? null
              : IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 32.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'InsureD',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 62,
                          ),
                        ),
                        Text(
                          'Decentralised insurance Of the Future',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: Container(
                    width: double.maxFinite,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Signup(
                              firstLogin: true,
                            ),
                          ),
                        );
                      },
                      color: Color(0xff4336f1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 16.0,
                          bottom: 16.0,
                        ),
                        child: Text(
                          'Generate wallet',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: Container(
                    width: double.maxFinite,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Login(
                              firstLogin: true,
                            ),
                          ),
                        );
                      },
                      color: Color(0xff4336f1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 16.0,
                          bottom: 16.0,
                        ),
                        child: Text(
                          'Log in to existing wallet',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
