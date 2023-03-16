import 'package:dashboard/config/styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CasesBarChart extends StatelessWidget {
  final List<double> theCases;

  const CasesBarChart({Key? key, required this.theCases}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Daily New Cases',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: BarChart(
              BarChartData(
                  maxY: 16,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(),
                        margin: 10,
                        showTitles: true,
                        textStyle: Styles.chartLabelsTextStyle,
                        getTitles: (double value) {
                          switch (value.toInt()) {
                            case 0:
                              return 'May 24';
                            case 1:
                              return 'May 25';
                            case 2:
                              return 'May 26';
                            case 3:
                              return 'May 27';
                            case 4:
                              return 'May 28';
                            case 5:
                              return 'May 29';
                            case 6:
                              return 'May 30';
                            default:
                              return '';
                          }
                        }),
                  ),
                  barGroups: theCases
                      .asMap()
                      .map((key, value) => MapEntry(
                            key,
                            BarChartGroupData(
                              x: key,
                              barRods: [
                                BarChartRodData(toY: value, color: Colors.red)
                              ],
                            ),
                          ))
                      .values
                      .toList()),
            ),
          )
        ],
      ),
    );
  }
}
