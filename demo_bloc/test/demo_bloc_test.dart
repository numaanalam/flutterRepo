import 'package:flutter_test/flutter_test.dart';
import 'package:demo_bloc/blocs/internet_bloc/internet_bloc.dart';

void main() {
  test('testing eligibility for addition', () {
    TestWidgetsFlutterBinding.ensureInitialized();
    InternetBloc obj = InternetBloc();

    int ans = obj.xyz(5, 3);

    expect(ans, 8);
  });

  test('testing eligibility for multiplication', () {
    TestWidgetsFlutterBinding.ensureInitialized();
    InternetBloc obj = InternetBloc();

    int ans = obj.pqr(5, 3);

    expect(ans, 15);
  });
}
