import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  final MyData _data = MyData();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Form(
          key: _formStateKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Spacer(),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: colorScheme.primary,
                      ),
                      hintText: 'Enter your name',
                      labelText: 'Name',
                      hintStyle: textTheme.titleSmall,
                      labelStyle: textTheme.titleSmall,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(color: colorScheme.primary)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide:
                              BorderSide(color: colorScheme.secondary))),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _data.name = value!;
                  },
                  autofocus: true,
                  keyboardType: TextInputType.name,
                ),
                Spacer(),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.mail,
                        color: colorScheme.primary,
                      ),
                      hintText: 'Enter your email address',
                      labelText: 'Email',
                      hintStyle: textTheme.titleSmall,
                      labelStyle: textTheme.titleSmall,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(color: colorScheme.primary)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide:
                              BorderSide(color: colorScheme.secondary))),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _data.email = value!;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                Spacer(),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.message,
                        color: colorScheme.primary,
                      ),
                      hintText: 'Enter your message here',
                      labelText: 'Message',
                      hintStyle: textTheme.titleSmall,
                      labelStyle: textTheme.titleSmall,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(color: colorScheme.primary)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide:
                              BorderSide(color: colorScheme.secondary))),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your message for us';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _data.message = value!;
                  },
                  maxLines: 4,
                  keyboardType: TextInputType.multiline,
                ),
                Spacer(),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_formStateKey.currentState!.validate()) {
                      //validate returns true if form fields are good
                      _formStateKey.currentState?.save();
                      //triggers the onSave functions in the TextFormFields
                    } else {
                      //form data not valid
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    backgroundColor: colorScheme.onPrimary,
                  ),
                  icon: Icon(
                    Icons.send,
                    color: colorScheme.primary,
                  ),
                  label: const Text('Send'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyData {
  //this is like a plain Object in JS to hold properties
  late String name;
  late String email;
  late String message;
}
