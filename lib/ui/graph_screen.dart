import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:task_07/constants/constants_resources.dart';

import '../constants/dimentions_resources.dart';
import '../constants/string_resources.dart';
import '../data/data_model/data_model.dart';

class GraphScreen extends StatefulWidget {
  final DataModel? data;

  const GraphScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  @override
  Widget build(BuildContext context) {
    final data = widget.data ??
        DataModel(
          name: StringResources.DEFAULT_NAME,
          value2: ConstantsResources.DEFAULT_VALUE,
          value3: ConstantsResources.DEFAULT_VALUE,
          value4: ConstantsResources.DEFAULT_VALUE,
          value5: ConstantsResources.DEFAULT_VALUE,
          value1: ConstantsResources.DEFAULT_VALUE,
        );
    return Scaffold(
      appBar: AppBar(
        title: Text(data.name),
      ),
      body: LineChart(
        LineChartData(
          minX: DimensionResources.D_0,
          minY: DimensionResources.D_0,
          maxX: DimensionResources.D_4,
          maxY: DimensionResources.D_1000,
          borderData: FlBorderData(border: Border.all(color: Colors.green)),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              color: Colors.blue.shade800,
              barWidth: DimensionResources.D_6,
              dotData: const FlDotData(show: false),
              spots: [
                FlSpot(DimensionResources.D_0, data.value1.toDouble()),
                FlSpot(DimensionResources.D_1, data.value2.toDouble()),
                FlSpot(DimensionResources.D_2, data.value3.toDouble()),
                FlSpot(DimensionResources.D_3, data.value4.toDouble()),
                FlSpot(DimensionResources.D_4, data.value5.toDouble()),
              ],
            ),
          ],
          gridData: const FlGridData(),
          lineTouchData: const LineTouchData(enabled: true),
          extraLinesData: ExtraLinesData(
            horizontalLines: [
              HorizontalLine(y: DimensionResources.D_1, color: Colors.black)
            ],
            verticalLines: [VerticalLine(x: DimensionResources.D_5)],
          ),
          backgroundColor: Colors.white24,
        ),
      ),
    );
  }
}
