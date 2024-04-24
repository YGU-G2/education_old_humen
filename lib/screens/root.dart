import 'dart:math';

import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    List<_SalesData> data = [
      _SalesData('ينابر', 35),
      _SalesData('فبراير', 8),
      _SalesData('مارس', 34),
      _SalesData('أبريل', 32),
      _SalesData('مايو', 40),
      _SalesData('يونيو', 5),
      _SalesData('يوليو', 15),
      _SalesData('أغسطس', 25),
      _SalesData('سبتمبر', 35),
      _SalesData('أكتوبر', 45),
      _SalesData('نوفمبر', 55),
      _SalesData('ديسمبر', 65)
    ];
    return Center(
      child: Column(
        children: [
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Chart title
            title: ChartTitle(text: 'رؤية سير عمليتك التعليمية'),
            // Enable legend
            legend: Legend(isVisible: true),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries<_SalesData, String>>[
              LineSeries<_SalesData, String>(
                  dataSource: data,
                  xValueMapper: (_SalesData sales, _) => sales.year,
                  yValueMapper: (_SalesData sales, _) => sales.sales,
                  name: 'الخطة التلعيمية',
                  // Enable data label
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ],
          ),
          CircularStepProgressIndicator(
            totalSteps: 5,
            currentStep: 3,
            stepSize: 20,
            selectedColor: Colors.blue,
            unselectedColor: Colors.grey,
            padding: pi / 80,
            width: 150,
            height: 150,
            startingAngle: pi * 2 / 180,
            arcSize: pi * 3 / 3 * 2,
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                " المراحل المنتهية",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
