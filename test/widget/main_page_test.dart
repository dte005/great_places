import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_places/main.dart';
import 'package:great_places/providers/auth_provider.dart';
import 'package:great_places/routes.dart' as app_routes;
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class _MockAuthProvider extends Mock implements AuthProvider {}

class _FakeHome extends StatelessWidget {
  const _FakeHome({super.key});
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(body: Center(child: Text(authProvider.email!)));
  }
}

void main() {
  late _MockAuthProvider authMock;

  late Map<String, WidgetBuilder> original;

  setUp(() {
    //Setting a new AuthProvider MOCK
    authMock = _MockAuthProvider();
    when(() => authMock.email).thenReturn('teste@teste.com');

    original = Map.of(app_routes.Routes.routes);
    app_routes.Routes.routes
      ..clear()
      ..addAll({
        "/": (ctx) => ChangeNotifierProvider<AuthProvider>.value(
          //Injecting a new ChangeNotifierProvider
          value: authMock,
          child: _FakeHome(),
        ),
      });
  });

  tearDown(() {
    // restaura as rotas reais
    app_routes.Routes.routes
      ..clear()
      ..addAll(original);
  });

  testWidgets('Tests on main component - loading - routes / providers', (
    tester,
  ) async {
    await tester.pumpWidget(MyApp());
    //Testing text on title on my widget
    final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(materialApp.title, equals('Great Places'));
    expect(find.text('teste@teste.com'), findsOneWidget);
  });
}
