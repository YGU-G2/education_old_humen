import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  'assets/images/OIP.jpg',
                  width: 340,
                ),
              ),
              Container(
                  child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Card(
                    child: Text(
                  'محموع من المطورين\n المبتدئين في  مجال \nتطوير تطبيقات الموبايل ',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 40,
                      fontFamily: 'Cascadia Code'),
                  textAlign: TextAlign.center,
                ),),
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
