import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(
    this.label,
    this.spendingAmount,
    this.spendingPctOfTotal,
  );
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            Container(
              height: constraints.maxHeight * 0.13,
              child: FittedBox(
                child: Text(
                  '₹${spendingAmount.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: 5,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.06,
            ),
            Container(
              height: constraints.maxHeight * 0.62,
              width: 15,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Colors.grey),
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.06),
            Container(
              height: constraints.maxHeight * 0.13,
              child: FittedBox(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 4,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
