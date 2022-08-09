import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/Animation/fadeAnimation.dart';
import 'package:flutter_todo/data/thems.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TaskTimeline extends StatelessWidget {
  final Map<String, dynamic> detail;

  TaskTimeline({required this.detail});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _buildTimeline(context,detail['tlColor']),
          Expanded(
            flex: 1,
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
                        margin: const EdgeInsets.only(top:0,),
                        // decoration:BoxDecoration(
                        //   boxShadow: [
                        //     BoxShadow(
                        //       color: Theme.of(context).shadowColor.withOpacity(0.1),
                        //       offset: const Offset(-4, 5),
                        //       spreadRadius: 0.4,
                        //       blurRadius: 15,
                        //     ),
                        //   ],
                        // ) ,
                          child: FadeAnimation(
                            delay: 0.5,
                            child: Text(
                                detail['time'],
                            style: TextStyle(
                              fontSize: 15.5,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                            ),
                          ),

                      ),
                      !detail.containsKey('isLast')
                          ? detail['title'].isNotEmpty
                          ? FadeAnimation(
                              delay: 1.0,
                            child: _buildCard(context,detail['bgColor'], detail['title'],
                            detail['slot']),
                          )
                          : _buildCard(context,Mytheme.prime_color2, '', '')
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(context,Color bgColor, String title, String slot) {
    return Container(
      height: 65,
      width: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).canvasColor.withOpacity(0.8),
            Theme.of(context).cardColor.withOpacity(0.9),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withAlpha(20),
            offset: const Offset(-5, 5),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
          // color: Mytheme.primary_color.withOpacity(0.09),
          borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.only(left: 5,top: 10),
      margin: const EdgeInsets.only(top:5,bottom: 10),
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
              style: TextStyle(
                  // color: Theme.of(context).primaryColor.withOpacity(0.7)
                color: Colors.white.withOpacity(0.8),

              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTimeline(context,Color tlColor) {
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
            width: 16,
            indicator: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).focusColor,
                shape: BoxShape.circle,
                border: Border.all(width: 5,
                    color: Theme.of(context).canvasColor),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor.withOpacity(0.2),
                    offset: const Offset(-4, 4),
                    spreadRadius: 1,
                    blurRadius: 10,
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
