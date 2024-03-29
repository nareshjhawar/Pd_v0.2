import 'package:animate_do/animate_do.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Chart extends StatefulWidget {

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 50,right: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Weekly",
            style: GoogleFonts.lato(
                fontSize: 20,
                color: Theme.of(context).focusColor,
                fontWeight: FontWeight.w500),
          ),
          FadeInDown(
            duration: Duration(milliseconds: 400),
            child: Container(
              // decoration: BoxDecoration(
              //   shape: BoxShape.circle,
              //     boxShadow: [
              //   BoxShadow(
              //       color: Theme.of(context).shadowColor.withAlpha(40),
              //       // offset: const Offset(1.5, 1.5),
              //       spreadRadius: 1,
              //       blurRadius: 40)
              // ]),
              width: 200,
              height: 80,
              // color: Colors.red,
              child: LineChart(
                LineChartData(
                    borderData: FlBorderData(show: false),
                    gridData:
                        FlGridData(drawHorizontalLine: false, show: false),
                    minX: 0,
                    maxX: 11,
                    minY: 0,
                    maxY: 6,
                    titlesData: FlTitlesData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                          spots: const [
                            FlSpot(0, 1),
                            FlSpot(1, 2),
                            FlSpot(2, 1),
                            FlSpot(3, 2),
                            FlSpot(4, 1),
                            FlSpot(5, 4),
                            FlSpot(6, 2),
                            FlSpot(7, 1),
                            FlSpot(8, 2),
                            FlSpot(9, 4),
                            FlSpot(10, 3),
                          ],
                          isCurved: true,
                          color: Color(0xFF9B96E7),
                          barWidth: 1,
                          dotData: FlDotData(show: false)
                      )
                    ]),
                swapAnimationCurve: Curves.bounceInOut,
                swapAnimationDuration: const Duration(milliseconds: 1000),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Daily Report",
            style: GoogleFonts.lato(
                fontSize: 20,
                color: Theme.of(context).focusColor,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Text(
                "80% ",
                style: GoogleFonts.lato(
                    color: Theme.of(context).cardColor,
                    fontSize: 25, fontWeight: FontWeight.w800),
              ),
              Text(
                " Productive",
                style: GoogleFonts.lato(
                    color: Theme.of(context).focusColor,
                    fontSize: 18),
              )
            ],
          ),
        ],
      ),
    );
  }
}
