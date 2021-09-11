import 'package:flutter/material.dart';
import '../../state_management/appstate.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReceivePage extends StatefulWidget {
  const ReceivePage({Key key}) : super(key: key);

  @override
  _ReceivePageState createState() => _ReceivePageState();
}

class _ReceivePageState extends State<ReceivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Account address',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                      'Your current account address. Share it to receive funds.'),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text(
                            AppState.instance.getAccountAddressCurrent(),
                            style: TextStyle(fontSize: 18),
                          ),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(
                                text: AppState.instance
                                    .getAccountAddressCurrent()));
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Copied To clipboard')));
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black)),
                          child: Row(
                            children: [
                              Icon(Icons.copy),
                              SizedBox(
                                width: 20,
                              ),
                              Text('Copy To ClipBoard'),
                            ],
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                      child: Text(
                    'QR Code',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  )),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: QrImage(
                      data: AppState.instance.getAccountAddressCurrent(),
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
