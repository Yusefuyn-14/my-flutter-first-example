// ignore_for_file: library_private_types_in_public_api, no_leading_underscores_for_local_identifiers, prefer_const_constructors_in_immutables, prefer_const_constructors, non_constant_identifier_names, must_be_immutable, sort_child_properties_last, unused_element, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:testApp/entities/business.dart';
import 'package:testApp/pages/business_add.dart';
import 'package:testApp/source/businesslist.dart';
import 'package:testApp/source/colorlist.dart';
import 'package:testApp/source/iconlist.dart';
import 'package:testApp/source/lingualist.dart';
import 'viewmodels/mainpagemodel.dart';

void main() => runApp(MyMainPage());

class MyMainPage extends StatefulWidget {
  MyMainPage({super.key});

  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  final List<PageModel> _pages = [
    PageModel(0, 'Home', Page1(), ColorList.GetMyColour('OzelGri'), 'home'),
    PageModel(
        1, 'Business', Page2(), ColorList.GetMyColour('OzelYesil'), 'map'),
    PageModel(
        2, 'Profil', Page2(), ColorList.GetMyColour('OzelMavi2'), 'person'),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Row(
        children: [PrepareLeftMenu(), PrepareMainPage()],
      ),
    );
  }

  Expanded PrepareMainPage() {
    return Expanded(
      child: _pages[_selectedIndex].widget,
    );
  }

  Container PrepareLeftMenu() {
    return Container(
      margin: EdgeInsets.only(bottom: 5, left: 5, right: 5, top: 5),
      width: 65,
      child: Column(
        children: _pages.map((page) {
          return Container(
            margin: EdgeInsets.only(bottom: 5, left: 5, right: 5, top: 5),
            child: FloatingActionButton(
              backgroundColor: page.color,
              onPressed: () {
                setState(() {
                  _selectedIndex = page.Index;
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: StringToIconConverter(page.pIcon),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Page1State();
  }
}

class _Page1State extends State {
  Business SelectedBusiness = Business.NoBusiness();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Material(
            child: ListeyiHazirla(),
          ),
        ),
        Text(
          SelectedBusiness.Name,
          style: TextStyle(
            color: ColorList.GetMyColour('OzelSiyah'),
            decoration: TextDecoration.none,
          ),
        ),
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: TuslariHazirla())
      ],
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(WordList.GetWord('warning')),
          content: Text(WordList.GetWord('areyousure')),
          actions: <Widget>[
            TextButton(
              child: Text(WordList.GetWord('yes')),
              onPressed: () {
                setState(() {
                  BusinessList.businesses.remove(SelectedBusiness);
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(WordList.GetWord('no')),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  List<Widget> TuslariHazirla() {
    return <Widget>[
      Flexible(
        fit: FlexFit.tight,
        flex: 3,
        child: Container(
          margin: EdgeInsets.only(bottom: 5.0, left: 5, right: 5, top: 5),
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Business_add()));
              });
            },
            child: Row(children: [
              StringToIconConverter('add'),
              Text(WordList.GetWord('add'))
            ]),
            backgroundColor: ColorList.GetMyColour('OzelGrimsi'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            foregroundColor: ColorList.GetMyColour('OzelKirmisi'),
          ),
        ),
      ),
      Flexible(
        fit: FlexFit.tight,
        flex: 3,
        child: Container(
          margin: EdgeInsets.only(bottom: 5.0, left: 5, right: 5, top: 5),
          child: FloatingActionButton(
            onPressed: () {
              _showConfirmationDialog(context);
            },
            child: Row(children: [
              StringToIconConverter('delete'),
              Text(WordList.GetWord('delete'))
            ]),
            backgroundColor: ColorList.GetMyColour('OzelGrimsi'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            foregroundColor: ColorList.GetMyColour('OzelKirmisi'),
          ),
        ),
      ),
      Flexible(
        fit: FlexFit.tight,
        flex: 2,
        child: Container(
          margin: EdgeInsets.only(bottom: 5.0, left: 5, right: 5, top: 5),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Business_add.edit(SelectedBusiness)));
            },
            child: Row(children: [
              StringToIconConverter('edit'),
              Text(WordList.GetWord('edit'))
            ]),
            backgroundColor: ColorList.GetMyColour('OzelGrimsi'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            foregroundColor: ColorList.GetMyColour('OzelKirmisi'),
          ),
        ),
      ),
    ];
  }

  ListView ListeyiHazirla() {
    return ListView.builder(
        itemCount: BusinessList.businesses.length,
        itemBuilder: (context, index) {
          final isSelected =
              BusinessList.businesses[index].ID == SelectedBusiness.ID;
          return ListTile(
            onTap: () {
              setState(() {
                SelectedBusiness = BusinessList.businesses[index];
              });
            },
            selected: isSelected,
            tileColor: isSelected ? Colors.yellow[200] : null,
            title: Text(
              BusinessList.businesses[index].Name,
            ),
            subtitle: Text(BusinessList.businesses[index].Phone),
            leading: isSelected
                ? StringToIconConverter('push_pin')
                : StringToIconConverter(BusinessList.businesses[index].Icon),
          );
        });
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(WordList.GetWord('test'));
  }
}
