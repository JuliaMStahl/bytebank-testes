import 'package:bytebank/main.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:bytebank/screens/contacts_list.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:mockito/mockito.dart';
import 'matchers.dart';
import 'mocks.mocks.dart';

@GenerateMocks([ContactDao])
void main() {
  testWidgets('Should save a contact', (tester) async {
    final mockContactDao = MockContactDao();

    when(mockContactDao.findAll()).thenAnswer((_) async => []);
    when(mockContactDao.save(any)).thenAnswer((_) async => 1);

    await tester.pumpWidget(BytebankApp(contactDao: mockContactDao,));

    final dashboard = find.byType(Dashboard);
    expect(dashboard, findsOneWidget);

    final transferFeatureItem = find.byWidgetPredicate((widget) => featureItemMatcher(widget, 'Transfer', Icons.monetization_on));
    expect(transferFeatureItem, findsOneWidget);
    await tester.tap(transferFeatureItem);
    await tester.pump();
    await tester.pump();

    final contactsList = find.byType(ContactsList);
    expect(contactsList, findsOneWidget);

    final fabNewContact = find.widgetWithIcon(FloatingActionButton, Icons.add);
    expect(fabNewContact, findsOneWidget);
    await tester.tap(fabNewContact);
    await tester.pumpAndSettle();

    final contactForm = find.byType(ContactForm);
    expect(contactForm, findsOneWidget);

    final nameTextField = find.byWidgetPredicate((widget) {
      if(widget is TextField){
        return widget.decoration!.labelText == 'Full name';
      }
      return false;
    });
    expect(nameTextField, findsOneWidget);
    await tester.enterText(nameTextField, 'Julia');

    final accountNumberTextField = find.byWidgetPredicate((widget) {
      if(widget is TextField){
        return widget.decoration!.labelText == 'Account number';
      }
      return false;
    });
    expect(accountNumberTextField, findsOneWidget);
    await tester.enterText(accountNumberTextField, '1000');

    final createButton = find.widgetWithText(ElevatedButton, 'Create');
    expect(createButton, findsOneWidget);
    await tester.tap(createButton);
    await tester.pumpAndSettle();

    final contactsListBack = find.byType(ContactsList);
    expect(contactsListBack, findsOneWidget);
  });
}