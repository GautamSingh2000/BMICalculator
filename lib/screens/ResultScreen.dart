import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';

class ResultScreen extends StatefulWidget {
  final int bmiResult ; // This variable can be used to store the BMI result
  const ResultScreen({super.key, required this.bmiResult});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backGroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: backGroundColor,
      body: Column(
        children: [
          Container(
            width: width,
            height: 200,
            decoration: BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Your BMI is:',
                  style: defaultTextStyle,
                ),
                const SizedBox(height: 20),
                Text(
                  "${widget.bmiResult}", // This should be replaced with the actual BMI value
                  style: defaultTextStyle.copyWith(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.05),
          Image.asset(
            getBmiImage(widget.bmiResult),
            width: width * 0.8,
            height: height * 0.4,
          ),
          const Spacer(),
          GestureDetector(
            onTap:() {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  "Calculate Again",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


String getBmiImage(int bmi) {
  if (bmi < 16) {
    return 'assets/underweightImage.png'; // Severe Thinness
  } else if (bmi < 17) {
    return 'assets/underweightImage.png'; // Moderate Thinness
  } else if (bmi < 18.5) {
    return 'assets/underweightImage.png'; // Mild Thinness
  } else if (bmi < 25) {
    return 'assets/normalImage.png'; // Normal
  } else if (bmi < 30) {
    return 'assets/obeseImage.png'; // Overweight
  } else if (bmi < 35) {
    return 'assets/overweightImage.png'; // Obese Class I
  } else if (bmi < 40) {
    return 'assets/overweightImage.png'; // Obese Class II
  } else {
    return 'assets/overweightImage.png'; // Obese Class III
  }
}