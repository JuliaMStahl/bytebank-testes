import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return the value when create a transaction', () {
    final Transaction transaction = Transaction('1', 200, Contact(1, 'Julia', 1000));
    expect(transaction.value, 200);
  });
  
  test('Should display error when create a transaction with value less than zero', () {
    expect(() => Transaction('2', 0, Contact(2, 'Karen', 2000)) , throwsAssertionError);
  });
  
}