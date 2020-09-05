

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class FormPage extends StatelessWidget {
  // ignore: unused_field
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static const routeName = '/formpage';
  Map formData = {
    'Price' : null,
    'Place' : null,
    'Bedrooms' : null,
    'Bathrooms' : null,
    'description' : null
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
              child: Container(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          hintText: 'Price in Lakhs'
                        ),
                        onSaved: (val) {
                          formData['Price'] = val;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Place'
                        ),
                        onSaved: (val) {
                          formData['Place'] = val;
                        },
                        onChanged: (val) {
                          print(val);
                        },
                        validator: (val) {
                          if (val.length > 2) {
                            return 'greater than 2';
                          }
                          return null;
                        }
                        ,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          hintText: 'Bedrooms'
                        ),
                        onSaved: (val) {
                          formData['Bedrooms'] = val;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          hintText: 'Bathrooms'
                        ) ,
                        onSaved: (val) {
                          formData['Bathrooms'] = val;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'Description'
                        ) ,
                        onSaved: (val) {
                          formData['Description'] = val;
                        },
                      ),
                    ),
                    RaisedButton(
                      color: Colors.greenAccent,
                      onPressed: () {
                        _formKey.currentState.save();
                      }, 
                      child: Text('Save'),
                    )
                  ],
                ),
              )
              
            ],
          ),
        ),
      ),

    );
  }
}