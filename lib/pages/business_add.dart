// ignore_for_file: camel_case_types, use_key_in_widget_constructors, sort_child_properties_last, avoid_unnecessary_containers, non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, no_logic_in_create_state, must_be_immutable, sized_box_for_whitespace, curly_braces_in_flow_control_structures, unused_local_variable
import 'package:flutter/material.dart';
import 'package:testApp/entities/business.dart';
import 'package:testApp/source/businesslist.dart';
import 'package:testApp/source/colorlist.dart';
import 'package:testApp/source/iconlist.dart';

class Business_add extends StatefulWidget {
  Business bbusiness = Business.NoBusiness();
  Business_add() {
    return;
  }
  Business_add.edit(Business business) {
    bbusiness = business;
  }

  @override
  State<StatefulWidget> createState() {
    return _business_add_state(bbusiness);
  }
}

class _business_add_state extends State {
  var formkey = GlobalKey<FormState>();
  Business AddedBusiness = Business.NoBusiness();

  _business_add_state(Business business) {
    AddedBusiness = business;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('data'),
        ),
        body: Container(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                prepareNameField(AddedBusiness.Name),
                prepareAddressField(AddedBusiness.Address),
                preparePhoneField(AddedBusiness.Phone),
                prepareSaveBusinessButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  prepareSaveBusinessButton() {
    return Container(
      width: 200,
      child: FloatingActionButton(
        onPressed: () {
          formkey.currentState?.save();

          if (AddedBusiness.ID == -1)
            BusinessList.AddBusinessNoObject(AddedBusiness.Name,
                AddedBusiness.Address, AddedBusiness.Phone, AddedBusiness.Icon);
          else {
            Business searchedBusiness = BusinessList.businesses
                .firstWhere((element) => element.ID == AddedBusiness.ID);
            searchedBusiness = AddedBusiness;
          }

          Navigator.pop(context);
        },
        child: Center(
          child: Row(
            children: [StringToIconConverter('add'), Text('Kaydet')],
          ),
        ),
        backgroundColor: ColorList.GetMyColour('OzelGrimsi'),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        foregroundColor: ColorList.GetMyColour('OzelKirmisi'),
      ),
    );
  }

  preparePhoneField(String val) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Firma telefonu", hintText: '+90252 413 41 45'),
      keyboardType: TextInputType.phone,
      initialValue: val,
      onSaved: (newValue) {
        AddedBusiness.Phone = newValue!;
        // Bu olay formKey.currentState?.save(); komutu ile değerlerin çekildiği bir olay
        // tabi bunun için mevcut textformfield objelerinin bir form içerisinde nemalanması lazım tabi birde
        // form objesinin bir keye ihtiyacı var bu key
        // var formKey = GlobalKey<FormState>();
        // şeklinde mevcut sayfa sınıfında tanımlanır.
      },
    );
  }

  prepareAddressField(String val) {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Firma adresi", hintText: 'Istanbul'),
      initialValue: val,
      onSaved: (newValue) {
        AddedBusiness.Phone = newValue!;
      },
    );
  }

  prepareNameField(String val) {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Firma adı", hintText: 'Software INC'),
      initialValue: val,
      onSaved: (newValue) {
        AddedBusiness.Name = newValue!;
      },
    );
  }
}
