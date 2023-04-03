import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:testdemo/model/chart_model.dart';

class PerformanceChartWidget extends StatelessWidget {
  PerformanceChartWidget({
    Key? key,
  }) : super(key: key);

  TooltipBehavior tooltipBehavior = TooltipBehavior(enable: true);
  final List<ChartData> chartData = <ChartData>[
    ChartData(x: 'Jan', yValue1: 200, yValue2: 45),
    ChartData(x: 'Feb', yValue1: 200, yValue2: 100),
    ChartData(x: 'Mar', yValue1: 200, yValue2: 125),
    ChartData(x: 'Apr', yValue1: 200, yValue2: 90),
    ChartData(x: 'May', yValue1: 200, yValue2: 60),
    ChartData(x: 'June', yValue1: 200, yValue2: 140)
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: CategoryAxis(isVisible: true),
        primaryYAxis: NumericAxis(isVisible: true),
        tooltipBehavior: tooltipBehavior,
        series: <ChartSeries>[
          ColumnSeries<ChartData, String>(
            color: Color.fromRGBO(239, 241, 253, 1),
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.yValue1,
          ),
          SplineSeries<ChartData, String>(
            dataSource: chartData,
            splineType: SplineType.cardinal,
            color: Colors.blue,
            cardinalSplineTension: 0.9,
            xValueMapper: (ChartData data, _) {
              return data.x;
            },
            yValueMapper: (ChartData data, _) {
              return data.yValue2;
            },
            animationDuration: 4000,
          )
        ],
      ),
    );
  }
}
