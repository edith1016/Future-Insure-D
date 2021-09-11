import 'package:flutter/material.dart';
import '../../../state_management/appstate.dart';
import 'package:tezster_dart/tezster_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MnemonicView extends StatefulWidget {
  const MnemonicView({Key key, this.afterImport}) : super(key: key);
  final Function afterImport;
  @override
  _MnemonicViewState createState() => _MnemonicViewState();
}

class _MnemonicViewState extends State<MnemonicView> {
  String password = '';
  TextEditingController mneomics = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Seed phrase',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text('Mnemonic. Your secret twelve word phrase.'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                controller: mneomics,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            CupertinoButton(
              color: Colors.black,
              child: Text('Generate Menmonic'),
              onPressed: () {
                setState(() {
                  mneomics.text = TezsterDart.generateMnemonic();
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Password',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
                'Used for additional mnemonic derivation. That is NOT a wallet password. (Optional)'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                onChanged: (key) => password = key,
              ),
            ),
            SizedBox(height: 20),
            CupertinoButton(
              color: Colors.black,
              child: Text('Continue'),
              onPressed: () async {
                AppState.instance.showProgress();
                try {
                  List<String> keys =
                      await TezsterDart.getKeysFromMnemonicAndPassphrase(
                          mnemonic: mneomics.text, passphrase: password);
                  if (keys.length != 3) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Something went Wrong')));
                    return;
                  }
                  AppState.instance.addAccount(keys);
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('seedphrase', mneomics.text);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Something went Wrong')));
                  return;
                }
                AppState.instance.dismissprogress();
                widget.afterImport();
              },
            ),
          ],
        ));
  }
}
