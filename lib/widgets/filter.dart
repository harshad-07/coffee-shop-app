import 'package:flutter/material.dart';

class FilterTab extends StatefulWidget {
  const FilterTab({super.key});

  @override
  State<FilterTab> createState() => _FilterTabState();
}

List<Tab> tab = [
  const Tab(text: "All"),
  const Tab(text: "Cappuccino"),
  const Tab(text: "Espresso"),
  const Tab(text: "Latte"),
  const Tab(text: "Flat White"),
  const Tab(text: "Caffè mocha")
];

class _FilterTabState extends State<FilterTab> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController =
        TabController(length: tab.length, vsync: this);
    return Theme(
      data: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: TabBar(
          labelStyle: const TextStyle(fontSize: 18),
          padding: EdgeInsets.zero,
          labelPadding: const EdgeInsets.only(right: 25, left: 5),
          automaticIndicatorColorAdjustment: false,
          controller: tabController,
          labelColor: const Color(0xFFD17842),
          unselectedLabelColor: const Color(0xff4e5053),
          isScrollable: true,
          indicator: const CircleTabIndicator(
            color: Color(0xFFD17842),
            radius: 4,
          ),
          tabs: tab),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({
    required this.color,
    required this.radius,
  });
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({
    required this.color,
    required this.radius,
  });
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2.8 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
