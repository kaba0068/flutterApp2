import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/lamb.avif'), fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
              child: Container(
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Transform.rotate(
                angle: -math.pi * 0.1,
                child: Text(
                  'Lost Lamb',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
