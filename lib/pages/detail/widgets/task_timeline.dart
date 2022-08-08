import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/Animation/fadeAnimation.dart';
import 'package:flutter_todo/data/thems.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../Utils/modelClass.dart';

class TaskTimeline extends StatefulWidget {
  final TaskModel taskModel;

  TaskTimeline({required this.taskModel});

  @override
  State<TaskTimeline> createState() => _TaskTimelineState();
}

class _TaskTimelineState extends State<TaskTimeline> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _buildTimeline(context, Mytheme.tl_color),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: widget.taskModel != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                top: 0,
                              ),
                              child: FadeAnimation(
                                delay: 0.5,
                                child: Text(
                                  widget.taskModel.startTime,
                                  style: TextStyle(
                                    fontSize: 15.5,
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            _buildCard(context, Mytheme.prime_color2,
                                widget.taskModel.title)
                          ],
                        )
                      : const Text('Mo Task'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(context, Color bgColor, String title) {
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
      padding: const EdgeInsets.only(left: 5, top: 10),
      margin: const EdgeInsets.only(top: 5, bottom: 10),
      child: Container(
        margin: const EdgeInsets.only(
          top: 3,
          left: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  letterSpacing: 0.6,
                  color: Mytheme.date_color,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 3.5),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeline(context, Color tlColor) {
    return SizedBox(
      height: 80,
      width: 30,
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0,
        // isFirst: detail.containsKey('isLast') ? false : true,
        // isLast: detail.containsKey('isLast') ? true : false,
        isFirst: true,
        isLast: false,
        indicatorStyle: IndicatorStyle(
            indicatorXY: 0,
            width: 16,
            indicator: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).focusColor,
                shape: BoxShape.circle,
                border:
                    Border.all(width: 5, color: Theme.of(context).canvasColor),
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
