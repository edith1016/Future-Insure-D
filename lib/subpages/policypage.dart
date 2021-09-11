import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'buypremium.dart';
import '../state_management/appstate.dart';

class PolicyPage extends StatefulWidget {
  @override
  PolicyPageState createState() => PolicyPageState();
}

class PolicyPageState extends State<PolicyPage> {
  List<String> policies = ['policy1', 'policy2', 'policy3'];
  int amount = 2;
  int yearsvalid = 0;
  @override
  void initState() {
    super.initState();
    setState(() {});
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
            automaticallyImplyLeading: false,
            title: TabBar(
              labelColor: Colors.black,
              tabs: [
                Container(
                    padding: EdgeInsets.all(10), child: Text('Buy a policy')),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Text('Purchased Policies'))
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Column(
                children: [
                  Container(height: 100),
                  Text('Choose sum insured'),
                  Container(height: 10),
                  Text(
                    '₹ $amount lakhs',
                    style: TextStyle(fontSize: 40),
                  ),
                  Slider(
                    value: amount.toDouble(),
                    min: 2,
                    max: 100,
                    divisions: 7,
                    label: amount.round().toString(),
                    activeColor: Color(0xff4b37f4),
                    onChanged: (value) {
                      setState(() {
                        amount = value.toInt();
                      });
                    },
                  ),
                  Container(height: 30),
                  Text(
                    'Choose Years covered',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(height: 10),
                  CupertinoSlidingSegmentedControl(
                      groupValue: yearsvalid,
                      backgroundColor: Colors.blue.shade200,
                      children: const <int, Widget>{
                        0: Text('1 Year'),
                        1: Text('2 Years'),
                        2: Text('3 Years')
                      },
                      onValueChanged: (value) {
                        setState(() {
                          yearsvalid = value;
                        });
                      }),
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                        Container(
                            color: Colors.black,
                            height: 100,
                            padding: EdgeInsets.only(left: 20, right: 20),
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Total Price',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        '${(3000 + amount * 1000 + (yearsvalid + 1) * 2000) * 0.005} ꜩ',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      )
                                    ]),
                                CupertinoButton(
                                  color: Colors.white,
                                  child: Text(
                                    'Continue',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  onPressed: () {
                                    double a = (3000 +
                                            amount * 1000 +
                                            (yearsvalid + 1) * 2000) *
                                        0.005;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BuyPremium(a,
                                                yearsvalid + 1, amount, this)));
                                  },
                                )
                              ],
                            ))
                      ])),
                ],
              ),
              Column(children: [
                purchased
                    ? Container(
                        padding: EdgeInsets.all(20),
                        width: screenwidth,
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blueAccent),
                        child: Column(
                          children: [
                            Text('Sum insured'),
                            Text(
                              '₹ $purchasesum lakhs',
                              style: TextStyle(fontSize: 40),
                            ),
                            Text('Years covered'),
                            Text(
                              '$purchaseyears Year',
                              style: TextStyle(fontSize: 20),
                            ),
                            ListTile(
                              leading: Text('Group id:'),
                              title: Text('$purchasegroupid'),
                            ),
                            ListTile(
                              leading: Text('Premium Amount'),
                              title: Text('$purchasepremium'),
                            ),
                            CupertinoButton(
                                color: Colors.white,
                                child: Text(
                                  'CLAIM',
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {
                                  AppState.instance.createcontract();
                                })
                          ],
                        ),
                      )
                    : Container()
              ])
            ],
          ),
        ));
  }
}

bool purchased = false;
int purchasesum = 2;
int purchaseyears = 1;
String purchasegroupid = 'saknaslnflsan';
double purchasepremium = 7000;
