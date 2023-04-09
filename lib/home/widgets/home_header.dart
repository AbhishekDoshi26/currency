import 'package:currency/utils/utils.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 150,
        left: 30,
        right: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Hello!',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: ColorConstants.primaryColorLight,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Are you ready to get your currency exchanged? 💸',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
