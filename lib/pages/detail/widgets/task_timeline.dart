import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/data/thems.dart';
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
                        margin: const EdgeInsets.only(top:4,),
                        decoration:BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Mytheme.prime_color1.withOpacity(0.2),
                              offset: const Offset(-4, 5),
                              spreadRadius: 0.4,
                              blurRadius: 20,
                            ),
                          ],
                        ) ,
                          child: Text(
                              detail['time'],
                          style: TextStyle(
                            fontSize: 15.5,
                            color: Mytheme.primary_color1.withOpacity(0.6),
                          ),
                          ),

                      ),
                      !detail.containsKey('isLast')
                          ? detail['title'].isNotEmpty
                          ? _buildCard(detail['bgColor'], detail['title'],
                          detail['slot'])
                          : _buildCard(Mytheme.prime_color1, '', '')
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
      height: 60,
      width: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Mytheme.tl_color.withOpacity(0.5),
            Mytheme.bg_color.withOpacity(0.4),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Mytheme.bg_color.withOpacity(0.35),
            offset: const Offset(-6, 6),
            spreadRadius: 3,
            blurRadius: 16,
          ),
        ],
          // color: Mytheme.primary_color.withOpacity(0.09),
          borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.only(left: 5,top: 8),
      margin: const EdgeInsets.only(top:7,bottom: 10),
      child: Container(
        margin: const EdgeInsets.only(top: 3, left: 15,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  letterSpacing: 0.6,
                  color: Mytheme.date_color,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 3.5),
            Text(
              slot,
              style: TextStyle(color: Mytheme.tl_card_tx2 ),
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
                color: Mytheme.primary_color1,
                shape: BoxShape.circle,
                border: Border.all(width: 5,
                    color: Mytheme.prime_color1),
                boxShadow: [
                  BoxShadow(
                    color: Mytheme.prime_color1.withOpacity(0.7),
                    // offset: const Offset(8, 16),
                    spreadRadius: 2,
                    blurRadius: 15,
                  ),
                ],
              ),
            )),
        afterLineStyle: LineStyle(
          thickness: 2,
          color: tlColor,
        ),
      ),
    );
  }
}
