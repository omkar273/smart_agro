import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class FinanceTab extends StatelessWidget {
  const FinanceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          _buildSummaryCard(),
          const SizedBox(height: 20),
          _buildDetailedExpensesTable(),
          const SizedBox(height: 20),
          _buildExpensesPieChart(),
        ],
      ),
    );
  }

  Widget _buildSummaryCard() {
    return const Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Total Expenses: \$5000',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Cash Flow: \$7000',
                    style: TextStyle(color: Colors.green)),
                Text('Profit Margin: 40%', style: TextStyle(color: Colors.red)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailedExpensesTable() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          columnWidths: const {
            0: FlexColumnWidth(1.5),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(2),
            3: FlexColumnWidth(1),
          },
          border: TableBorder.all(),
          children: [
            const TableRow(children: [
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Date',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Expense Category',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Description',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Amount',
                      style: TextStyle(fontWeight: FontWeight.bold))),
            ]),
            // Example TableRow
            ...List.generate(
                10,
                (index) => TableRow(children: [
                      const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('2024-08-01')),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Category $index')),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Description of expense $index')),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('\$${(index + 1) * 100}')),
                    ])),
          ],
        ),
      ),
    );
  }

  Widget _buildExpensesPieChart() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: AspectRatio(
          aspectRatio: 1.3,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                    value: 30, title: 'Seeds', color: Colors.green),
                PieChartSectionData(
                    value: 20, title: 'Fertilizers', color: Colors.yellow),
                PieChartSectionData(
                    value: 25, title: 'Labor', color: Colors.blue),
                PieChartSectionData(
                    value: 25, title: 'Maintenance', color: Colors.red),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
