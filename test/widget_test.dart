import 'package:flutter_test/flutter_test.dart';
import 'package:test_task_2/Module-API/api_service.dart';

void main(){
  test("Fetching Test",() async {

    // Arrange & Act
    int expected = 63;
    int? total = (await ApiService.fetchProducts())?.result.length;

    //Assert
    expect(total, expected);
  });
}