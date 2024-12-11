import 'package:yashvi_graphql/services/network/api_client.dart';
import 'package:yashvi_graphql/services/network/endpoints/destinations.dart';

import '../../models/destination_model.dart';

class DestinationsRepo {
  static Future<DestinationModel> getDestinationsApi() async {
    final resp = await ApiService.performQuery(
        endpoint: DestinationEndpoints.getDestinationList, variables: {});

    return DestinationModel.fromJson(resp.data ?? {});
  }
}
