import 'package:bitbro/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

// TODO: rimuovere questo e aggiungere la vera implementazione di Diego
class TempScore {
  final String name;
  final List<double> datapoints;
  TempScore(this.name, this.datapoints);
}

// TODO: dati presi da un Bloc? questi sono per test
final List<TempScore> tempScores = [
  TempScore('Tizio', [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]),
  TempScore('Sempronio', [5, 6, 7, 8, 9, 10, 9, 8, 7, 6]),
  TempScore('Caio', [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]),
];

class ScoreboardPoint extends StatelessWidget {
  final int position;
  final String name;
  final bool isYou;
  final List<double> datapoints;

  const ScoreboardPoint(
      {super.key,
      required this.position,
      required this.name,
      required this.datapoints,
      this.isYou = false});

  @override
  Widget build(BuildContext context) {
    final List<FlSpot> spots = datapoints
        .asMap()
        .entries
        .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
        .toList();

    final double score = datapoints[datapoints.length - 1];

    Color color = score < datapoints[0] // se il punteggio è in discesa
        ? Colors.red
        : Colors.green;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
      decoration: BoxDecoration(
        color: bluMenoScuro,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 28,
              child: Text('$position.',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    // fontWeight: FontWeight.w700,
                  )),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                decoration: BoxDecoration(
                  color: griginoSfondo,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text(
                          name + (isYou ? ' (You)' : ''),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    SizedBox(
                      width: 60,
                      height: 25,
                      child: LineChart(LineChartData(
                        titlesData: const FlTitlesData(show: false),
                        borderData: FlBorderData(show: false),
                        gridData: const FlGridData(show: false),
                        lineTouchData: const LineTouchData(enabled: false),
                        lineBarsData: [
                          LineChartBarData(
                            isCurved: true,
                            color: color,
                            barWidth: 2,
                            isStrokeCapRound: true,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              gradient: LinearGradient(
                                colors: [
                                  color.withOpacity(0.8),
                                  color.withOpacity(0)
                                ],
                                stops: const [0.0, 0.8],
                                transform: const GradientRotation(0.5 * 3.14),
                              ),
                            ),
                            spots: spots,
                          ),
                        ],
                      )),
                    ),
                    SizedBox(
                        width: 60,
                        child: Text(
                          '\$${score.toStringAsFixed(2)}',
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}

class Scoreboard extends StatelessWidget {
  const Scoreboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title:
            Text("Scoreboard", style: Theme.of(context).textTheme.titleLarge),
        leading: IconButton(
          icon: const Icon(Ionicons.arrow_back, color: Colors.white),
          onPressed: () {
            context.push('/');
          },
        ),
      ),
      backgroundColor: bluScuro,
      body: ListView.builder(
        itemCount: tempScores.length,
        itemBuilder: (context, index) => ScoreboardPoint(
          position: index + 1,
          name: tempScores[index].name,
          datapoints: tempScores[index].datapoints,
          isYou: index == 1,
        ),
      ),
    );
  }
}
