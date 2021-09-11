import 'package:flutter/material.dart';
import 'subpages/policypage.dart';
import 'subpages/docscanhomepage.dart';
import 'subpages/profilepage.dart';
import 'ui/pages/landing.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: const TabBar(
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            tabs: [
              Tab(icon: Icon(Icons.policy)),
              Tab(icon: Icon(Icons.scanner_outlined)),
              Tab(icon: Icon(Icons.person)),
            ],
          ),
          body: TabBarView(
            children: [PolicyPage(), DocScanHomepage(), LandingPage()],
          ),
        ));
  }
}
