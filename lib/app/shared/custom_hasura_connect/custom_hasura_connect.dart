import 'package:covid19app/app/shared/constants.dart';
import 'package:hasura_connect/hasura_connect.dart';

class CustomHasuraConnect{
  HasuraConnect hasura;

  CustomHasuraConnect(this.hasura){
    hasura = HasuraConnect(HASURA_URL, headers: {"x-hasura-admin-secret":"hasura9384docker"});
  }
}