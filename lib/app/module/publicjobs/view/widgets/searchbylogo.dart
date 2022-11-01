import 'package:flutter/material.dart';

Container browsbylogowidget() {
    return Container(
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 10.0, right: 5.0, left: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.grey.shade300, // red as border color
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Image.asset(
                      'assets/images/icons8-facebook-500.png',
                      width: 35,
                      height: 35,
                    ),
                  ),
                ),
              ),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Image.asset(
                      'assets/images/3d-fluency-google-logo.png',
                      width: 35,
                      height: 35,
                    ),
                  ),
                ),
              ),
              Container(
                width: 70,
                height: 70,
                padding: const EdgeInsets.only(right: 4.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Image.asset(
                      'assets/images/3d-fluency-github-logo.png',
                      width: 35,
                      height: 35,
                    ),
                  ),
                ),
              ),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.grey.shade300, 
                    
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Image.asset(
                      'assets/images/icons8-facebook-500.png',
                      width: 35,
                      height: 35,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
  }