import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<List<Users>> fetchData() async {
  Uri uri = Uri.https('random-data-api.com', '/api/v2/users', {'size': '20'});
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => Users.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}

class Users {
  final String firstName;
  final String lastName;
  final String email;
  final String username;

  Users({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
  });

  // Factory constructor to create a User from JSON
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      username: json['username'],
    );
  }
}

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  late Future<List<Users>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: FutureBuilder<List<Users>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
              'Error: ${snapshot.error}',
              style: textTheme.titleSmall,
            ));
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(
                    '${user.firstName} ${user.lastName}',
                    style: textTheme.titleSmall,
                  ),
                  subtitle: Text(
                    '${user.email} | ${user.username}',
                    style: textTheme.titleSmall,
                  ),
                );
              },
            );
          } else {
            return Center(
                child: Text(
              'No data available',
              style: textTheme.titleSmall,
            ));
          }
        },
      ),
    );
  }
}
