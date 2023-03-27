import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:school_project/view/widgets/customfont.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StudentDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 9, 46, 77),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(221, 11, 48, 128),
        title: Text('Student Dashboard'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomFont(
                text: 'Data Study %: ${80.toStringAsFixed(2)}%', size: 18),
            SizedBox(height: 16.0),
            CustomFont(
              text: 'Sports %: ${70.toStringAsFixed(2)}%',
              size: 18,
            ),
            SizedBox(height: 16.0),
            CustomFont(text: 'Arts %: ${60.toStringAsFixed(2)}%', size: 18),
            SizedBox(height: 16.0),
            Expanded(
              flex: 3,
              child: ListView(
                children: [
                  CustomFont(text: 'Arts', size: 20),
                  SfCartesianChart(
                      borderColor: Colors.black,
                      backgroundColor: Color.fromARGB(255, 9, 46, 77),
                      // Initialize category axis
                      primaryXAxis: CategoryAxis(),
                      series: <LineSeries<StudentData, String>>[
                        LineSeries<StudentData, String>(
                            // Bind data source
                            dataSource: <StudentData>[
                              StudentData('Jan', 35),
                              StudentData('Feb', 28),
                              StudentData('Mar', 34),
                              StudentData('Apr', 32),
                              StudentData('May', 40)
                            ],
                            xValueMapper: (StudentData data, _) =>
                                data.category,
                            yValueMapper: (StudentData data, _) =>
                                data.percentage)
                      ]),
                  CustomFont(text: 'Study', size: 20),
                  SfCartesianChart(
                      borderColor: Colors.black,
                      backgroundColor: Color.fromARGB(255, 9, 46, 77),
                      // Initialize category axis
                      primaryXAxis: CategoryAxis(),
                      series: <LineSeries<StudentData, String>>[
                        LineSeries<StudentData, String>(
                          // Bind data source
                          dataSource: <StudentData>[
                            StudentData('Jan', 35),
                            StudentData('Feb', 28),
                            StudentData('Mar', 34),
                            StudentData('Apr', 32),
                            StudentData('May', 40)
                          ],
                          xValueMapper: (StudentData data, _) => data.category,
                          yValueMapper: (StudentData data, _) =>
                              data.percentage,
                        )
                      ]),
                  CustomFont(text: 'Sports', size: 20),
                  SfCartesianChart(
                      borderColor: Colors.black,
                      backgroundColor: Color.fromARGB(255, 9, 46, 77)
                      // Initialize category axis
                      ,
                      primaryXAxis: CategoryAxis(),
                      series: <LineSeries<StudentData, String>>[
                        LineSeries<StudentData, String>(
                            // Bind data source
                            dataSource: <StudentData>[
                              StudentData('Jan', 35),
                              StudentData('Feb', 28),
                              StudentData('Mar', 34),
                              StudentData('Apr', 32),
                              StudentData('May', 40)
                            ],
                            xValueMapper: (StudentData data, _) =>
                                data.category,
                            yValueMapper: (StudentData data, _) =>
                                data.percentage)
                      ]),
                  SfCircularChart(
                      title: ChartTitle(
                          text: 'Over All',
                          textStyle: TextStyle(color: Colors.white)),
                      legend: Legend(isVisible: true),
                      series: <PieSeries<StudentDataoverall, String>>[
                        PieSeries<StudentDataoverall, String>(
                            explode: true,
                            explodeIndex: 0,
                            dataSource: [
                              StudentDataoverall('', 70, 'Sports'),
                              StudentDataoverall('Arts', 20, 'Arts'),
                              StudentDataoverall('Study', 10, 'Study'),
                            ],
                            xValueMapper: (StudentDataoverall data, _) =>
                                data.category,
                            yValueMapper: (StudentDataoverall data, _) =>
                                data.percentage,
                            dataLabelMapper: (StudentDataoverall data, _) =>
                                data.text,
                            dataLabelSettings: DataLabelSettings(
                                isVisible: true,
                                textStyle: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold))),
                      ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
