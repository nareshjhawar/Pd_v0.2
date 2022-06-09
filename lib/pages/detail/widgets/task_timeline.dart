import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:glass/glass.dart';


class TaskTimeline extends StatelessWidget {
  final Map<String, dynamic> detail;

  TaskTimeline({required this.detail});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          _buildTimeline(detail['tlColor']),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 4,),
                          child: Text(
                              detail['time'],
                          style: TextStyle(color: Color(0xFFCEBCF8).withOpacity(0.7),),),

                      ),
                      !detail.containsKey('isLast')
                          ? detail['title'].isNotEmpty
                          ? _buildCard(detail['bgColor'], detail['title'],
                          detail['slot'])
                          : _buildCard(Colors.white, '', '')
                          : Container()
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCard(Color bgColor, String title, String slot) {
    return Container(
      width: 215,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFA3B6EE).withOpacity(0.9),
            Color(0xFF6A88E5).withOpacity(0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF5C5292).withOpacity(0.2),
            offset: const Offset(0, 0),
            blurRadius: 3,
          ),
        ],
          color: Colors.black.withOpacity(0.09),
          borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 10,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  letterSpacing: 1.0,
                  color: Color(0xFFAE94DE),
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            Text(
              slot,
              style: const TextStyle(color: Colors.grey ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTimeline(Color tlColor) {
    return SizedBox(
      height: 80,
      width: 30,
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0,
        isFirst: detail.containsKey('isLast') ? false : true,
        isLast: detail.containsKey('isLast') ? true : false,
        indicatorStyle: IndicatorStyle(
            indicatorXY: 0,
            width: 18,
            indicator: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(width: 5, color: Color(0xFF9974DC)),
              ),
            )),
        afterLineStyle: LineStyle(
          thickness: 3,
          color: tlColor,
        ),
      ),
    );
  }
}
