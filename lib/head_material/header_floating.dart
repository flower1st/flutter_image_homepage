import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      snap: false,
      expandedHeight: 200,
      collapsedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('Sliver AppBar'),
        background: Image.network(
          'https://mdc.mo.gov/sites/default/files/mo_nature/media/images/2013/11/great_horned_owl_closeup_11-19-13.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
