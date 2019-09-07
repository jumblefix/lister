import 'package:lister/core/models/User.dart';
import 'package:lister/core/services/Api.dart';
import 'package:lister/core/services/AuthenticationService.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: Api())
];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<Api, AuthenticationService>(
    builder: (context, api, authenticationService) =>
        AuthenticationService(api: api),
  )
];

List<SingleChildCloneableWidget> uiConsumableProviders = [
  StreamProvider<User>(
    builder: (context) =>
        Provider.of<AuthenticationService>(context, listen: false).user,
  )
];

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];
