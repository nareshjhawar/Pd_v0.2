import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String task;
  DetailPage(this.task);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        
      )
    );
  }
  Widget _buildAppbar(BuildContext context){
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: Colors.black,

    );
  }
}
