import 'package:flutter/material.dart';
import 'package:insured/subpages/policypage.dart';
import '../state_management/appstate.dart';
import 'package:flutter/cupertino.dart';
import 'package:insured/homepage.dart';

class BuyPremium extends StatefulWidget {
  final double amount;
  final int years, suminsured;
  PolicyPageState parent;
  BuyPremium(this.amount, this.years, this.suminsured, this.parent);

  @override
  _BuyPremiumState createState() =>
      _BuyPremiumState(amount, years, suminsured, parent);
}

class _BuyPremiumState extends State<BuyPremium> {
  final double totalamount;
  final int years, suminsured;
  PolicyPageState parent;
  _BuyPremiumState(this.totalamount, this.years, this.suminsured, this.parent);
  String account = 'tz1d2tteZdCaybtCv8hYF4VrqQ3X7PURCMGS';
  double amount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
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
        body: pagestatus == 0
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Sender',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                    leading: Container(
                                        width: 40,
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Address',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        )),
                                    title: Text(
                                      AppState.instance
                                          .getAccountAddressCurrent(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    )),
                                ListTile(
                                  leading: Image.asset(
                                    'assets/tezoslogo.png',
                                    height: 24,
                                    width: 24,
                                  ),
                                  title: Text(
                                    '${AppState.instance.getBalanceAccountCurrent()} Tez',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Recipient',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'insureD Co. Ltd',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Amount',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          ListTile(
                            leading: Image.asset(
                              'assets/tezoslogo.png',
                              height: 24,
                              width: 24,
                            ),
                            title: Text(
                              '${totalamount}',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            ),
                          ),
                          Text(
                              'Additional gas fee of 10000 mutez will be charged',
                              style: TextStyle(color: Colors.grey)),
                          SizedBox(
                            height: 40,
                          ),
                          Center(
                              child: CupertinoButton(
                            color: Colors.black,
                            child: Text('Send'),
                            onPressed: _makeTransation,
                          )),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : pagestatus == 1
                ? Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Icon(Icons.check_circle,
                            color: Colors.greenAccent, size: 100),
                        Container(height: 30),
                        Text(
                          'PAYMENT SUCCESSFUL!',
                          style: TextStyle(fontSize: 30),
                        )
                      ]))
                : Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Icon(Icons.close_outlined,
                            color: Colors.red, size: 100),
                        Container(height: 30),
                        Text(
                          'PAYMENT FAILED!',
                          style: TextStyle(fontSize: 30),
                        )
                      ])));
  }

  int pagestatus = 0;
  void _makeTransation() async {
    bool a = await AppState.instance.makeTransaction(account, totalamount);

    if (a) {
      parent.setState(() {
        setState(() {
          pagestatus = 1;
          purchased = true;
          purchasesum = suminsured;
          purchaseyears = years;
          purchasepremium = totalamount;
        });
      });
    } else {
      setState(() {
        pagestatus = 2;
      });
    }
  }
}
