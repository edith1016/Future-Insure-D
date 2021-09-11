import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';

class DocScanHomepage extends StatefulWidget {
  @override
  _DocScanHomepageState createState() => _DocScanHomepageState();
}

class _DocScanHomepageState extends State<DocScanHomepage> {
  List<String> pickedfiles = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Container(
          padding: EdgeInsets.only(top: 100),
          child: ListView.builder(
            itemCount: pickedfiles.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.file_present),
                title: Text(pickedfiles[index].split("/").last),
                onTap: () {
                  OpenFile.open(pickedfiles[index]);
                },
              );
            },
          )),
      floatingActionButton: ElevatedButton.icon(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))),
          onPressed: () async {
            FilePickerResult result = await FilePicker.platform.pickFiles();

            if (result != null) {
              File file = File(result.files.single.path);
              setState(() {
                pickedfiles.add(file.path);
              });
            } else {
              // User canceled the picker
            }
          },
          icon: Icon(Icons.add),
          label: Text('Add Docs')),
    );
  }
}
