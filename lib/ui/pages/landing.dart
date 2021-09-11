import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../state_management/appstate.dart';
import '../../ui/pages/import_account.dart';
import '../../ui/pages/receive_page.dart';
import '../../ui/pages/send_transation.dart';
import '../../ui/widgets/landing_page/operationview.dart';
import '../../ui/widgets/landing_page/transaction_buttons.dart';
import '../../ui/widgets/topbar.dart';
import 'package:tezster_dart/tezster_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'viewtransactions.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    AppState.instance.init();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            actions: [
              TextButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ImportAccount())),
                  child: Text(
                    'Import Account',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Row(children: [
                      Text(
                        'Wallet Balance',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                          letterSpacing: 1,
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.refresh),
                          onPressed: () {
                            AppState.instance.refreshAccounts();
                          })
                    ]),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${AppState.instance.getBalanceAccountCurrent()}',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            fontSize: 50.0,
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Container(
                          height: 50.0,
                          child: Image.asset(
                            'assets/tezoslogo.png',
                            scale: 50,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Wallet address',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                        letterSpacing: 1,
                      ),
                    ),
                    Row(children: [
                      SafeArea(
                          child: Center(
                              child: Container(
                                  width: screenwidth / 1.5,
                                  child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text(
                                        AppState.instance
                                            .getAccountAddressCurrent(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.0,
                                          letterSpacing: 1,
                                        ),
                                      ))))),
                      IconButton(
                          icon: Icon(Icons.copy),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(
                                text: AppState.instance
                                    .getAccountAddressCurrent()));
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Copied To clipboard')));
                          })
                    ]),
                    SizedBox(height: 24.0),
                    SizedBox(height: 28.0),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      RaisedButton(
                        onPressed: () async {
                          // SharedPreferences prefs =
                          //     await SharedPreferences.getInstance();
                          // String seedphrase = prefs.getString('seedphrase');
                          // print(seedphrase);
                          AppState.instance.createcontract();
                        },
                        color: Color(0xff4336f1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                            bottom: 8.0,
                          ),
                          child: Text(
                            'Add Funds',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      Container(width: 30),
                      RaisedButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReceivePage()));
                        },
                        color: Color(0xff4336f1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        icon: Icon(
                          Icons.qr_code,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Receive Funds',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(height: 48.0),
                    Container(
                        width: screenwidth, height: 5, color: Colors.black),
                    SizedBox(height: 20),
                    Center(
                        child: CupertinoButton(
                      color: Colors.greenAccent,
                      child: Text('View Transactions'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewTransactions()));
                      },
                    )),
                  ],
                )),
          )),
    );
  }

  _handleSend() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SendTransactionPage()));
  }

  _handleReceive() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ReceivePage()));
  }
}
