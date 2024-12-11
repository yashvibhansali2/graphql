import 'package:graphql_flutter/graphql_flutter.dart';

class ApiService {
  static final GraphQLClient _client =
      GraphQLClient(link: link, cache: GraphQLCache());

  static HttpLink link = HttpLink('https://devapi.thehosteller.com/api/');

  static Future<QueryResult> performQuery(
      {required String endpoint, Map<String, dynamic>? variables}) async {
    QueryOptions options =
        QueryOptions(document: gql(endpoint), variables: variables ?? {});

    final result = await _client.query(options);
    print(result.data);

    return result;
  }

  static Future<QueryResult> performMutation(
      {required String endpoint, Map<String, dynamic>? variables}) async {
    MutationOptions options =
        MutationOptions(document: gql(endpoint), variables: variables ?? {});

    final result = await _client.mutate(options);

    // print(result);

    return result;
  }
}
