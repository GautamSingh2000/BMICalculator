import 'dart:ffi';

import 'package:bmi_app/screens/ResultScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import '../Constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int userHeight = 128;
  int age = 18;
  int weight = 60;
  Color femaleWidgetColor = blueColor;
  Color maleWidgetColor = blueColor;

  void setWidgetColor(bool male){
    if(male){
      setState(() {
        maleWidgetColor = backGroundColor;
        femaleWidgetColor = blueColor;
      });
       }else{
      setState(() {
        maleWidgetColor = blueColor;
        femaleWidgetColor = backGroundColor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: Center(child: Text("BMI Calculator", style: TextStyle(color: Colors.white))),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap:(){
                        setWidgetColor(true);
                      },
                      child: ReUsableWidget(
                        colour: maleWidgetColor,
                        childWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          FaIcon(
                                FontAwesomeIcons.mars,
                                color: Colors.white,
                                size: 80,
                              ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text("Male", style: defaultTextStyle),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap:(){
                        setWidgetColor(false);
                      },
                      child: ReUsableWidget(
                        colour: femaleWidgetColor,
                        childWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                                FontAwesomeIcons.venus,
                                color: Colors.white,
                                size: 80,
                              ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text("Female", style: defaultTextStyle),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReUsableWidget(
                colour: blueColor,
                childWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Height", style: defaultTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${userHeight}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          "cm",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),

                    Slider(
                      min: 120,
                      max: 200,
                      activeColor: Colors.white,
                      inactiveColor: Colors.white54,
                      thumbColor: Colors.pink,
                      value: userHeight.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          userHeight = value.toInt();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ReUsableWidget(
                      colour: blueColor,
                      childWidget: Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Column(children: [
                          Text(
                            "Age",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 30,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap:(){
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: greenColor,
                                      borderRadius: BorderRadius.circular(100)
                                    ),
                                    child: Center(
                                      child: FaIcon(FontAwesomeIcons.minus,
                                      size: 20,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                                Text(
                                  "$age",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30
                                  ),
                                ),
                                GestureDetector(
                                  onTap:(){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: greenColor,
                                        borderRadius: BorderRadius.circular(100)
                                    ),
                                    child: Center(
                                      child: FaIcon(FontAwesomeIcons.add,
                                          size: 20,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReUsableWidget(
                      colour: blueColor,
                      childWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Text(
                          "Weight",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 30,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap:(){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: greenColor,
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                  child: Center(
                                    child: FaIcon(FontAwesomeIcons.minus,
                                        size: 20,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              Text(
                                "$weight",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30
                                ),
                              ),
                              GestureDetector(
                                onTap:(){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: greenColor,
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                  child: Center(
                                    child: FaIcon(FontAwesomeIcons.add,
                                        size: 20,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap:() {
                int result = CalculateBMI();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultScreen(bmiResult: result)),
                );
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
                    "Calculate BMI",
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
      ),
    );
  }

  int CalculateBMI(){
    // Logic to calculate BMI based on userHeight, weight, and age
    // This function can be called when the user taps the "Calculate BMI" button
    int bmi = 0;
   return bmi = (weight / ((userHeight / 100) * (userHeight / 100))).round();
  }
}

class ReUsableWidget extends StatelessWidget {
  Color colour;
  Widget childWidget;

  ReUsableWidget({required this.colour, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childWidget,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      height: 150,
      width: MediaQuery.of(context).size.width,
    );
  }
}
