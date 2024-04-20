import 'package:bitbro/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomeGraphLegend extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  const HomeGraphLegend(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: bluScuro,
            border: Border.all(color: color, width: 2)),
        margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
        padding: const EdgeInsets.fromLTRB(26, 4, 26, 4),
        child: Column(
          children: [
            Text(
              subtitle,
              style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  height: 1),
            ),
            Text(title,
                style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                    height: 1))
          ],
        ));
  }
}

class HomeGraph extends StatelessWidget {
  final String top;
  final String bottom;
  final String you;
  final List<double> topData;
  final List<double> bottomData;
  final List<double> youData;
  final Function? navigateToFullScoreboard;
  const HomeGraph({
    super.key,
    required this.top,
    required this.bottom,
    required this.you,
    required this.topData,
    required this.bottomData,
    required this.youData,
    this.navigateToFullScoreboard,
  });

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    );

    final List<FlSpot> topSpots = topData
        .asMap()
        .entries
        .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
        .toList();
    final List<FlSpot> bottomSpots = bottomData
        .asMap()
        .entries
        .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
        .toList();
    final List<FlSpot> youSpots = youData
        .asMap()
        .entries
        .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
        .toList();

    return Column(children: [
      const SizedBox(
        width: 200,
        height: 60,
      ),
      TextButton(
          onPressed: () => {navigateToFullScoreboard!()},
          style: TextButton.styleFrom(
            foregroundColor: Colors.white.withAlpha(150),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(
                flex: 1,
              ),
              Text('Full Scoreboard', style: TextStyle(fontSize: 16)),
              Icon(
                Ionicons.arrow_forward_outline,
                size: 24,
              ),
            ],
          )),
      SizedBox(
        height: 250,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: LineChart(LineChartData(
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                axisNameWidget: const Text(
                  'Day',
                  style: titleStyle,
                ),
                axisNameSize: 24,
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) =>
                      Text(value.toString().split('.')[0], style: titleStyle),
                ),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) =>
                      Text(value.toString().split('.')[0], style: titleStyle),
                ),
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border(
                bottom: BorderSide(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    width: 4),
                left: const BorderSide(color: Colors.transparent),
                right: const BorderSide(color: Colors.transparent),
                top: const BorderSide(color: Colors.transparent),
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                isCurved: true,
                color: Colors.green,
                barWidth: 4,
                isStrokeCapRound: true,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.green.withOpacity(0.3),
                ),
                spots: topSpots,
              ),
              LineChartBarData(
                isCurved: true,
                color: Colors.white,
                barWidth: 4,
                isStrokeCapRound: true,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.white.withOpacity(0.3),
                ),
                spots: youSpots,
              ),
              LineChartBarData(
                isCurved: true,
                color: Colors.red,
                barWidth: 4,
                isStrokeCapRound: true,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.red.withOpacity(0.3),
                ),
                spots: bottomSpots,
              ),
            ],
          )),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HomeGraphLegend(title: top, subtitle: "top", color: Colors.green),
          HomeGraphLegend(title: you, subtitle: "you", color: Colors.white),
          HomeGraphLegend(title: bottom, subtitle: "bottom", color: Colors.red),
        ],
      ),
    ]);
  }
}
