import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Should display the main image when Dashboard is opened', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    final mainImage = find.byType(Image);
    expect(mainImage, findsOneWidget);
  });

  testWidgets('Should display the Transfer feature when Dashboard is opened', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    // busca com mais precisão e segurança
    // o icon e o text afirmam que o widget encontrado é o transfer
    final iconTransferFeatureItem = find.widgetWithIcon(FeatureItem, Icons.monetization_on);
    expect(iconTransferFeatureItem, findsOneWidget);
    final nameTransferFeatureItem = find.widgetWithText(FeatureItem, 'Transfer');
    expect(nameTransferFeatureItem, findsOneWidget);
  });
  testWidgets('Should display the Trannsaction Feed feature when Dashboard is opened', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    final iconTransactionFeedFeatureItem = find.widgetWithIcon(FeatureItem, Icons.description);
    expect(iconTransactionFeedFeatureItem, findsOneWidget);
    final nameTransactionFeedFeatureItem = find.widgetWithText(FeatureItem, 'Trannsaction Feed');
    expect(nameTransactionFeedFeatureItem, findsOneWidget);
  });
}