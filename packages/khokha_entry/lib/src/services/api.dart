import 'package:khokha_entry/src/globals/endpoints.dart';
import 'package:khokha_entry/src/models/entry_details.dart';
import 'package:onestop_kit/onestop_kit.dart';

class APIService extends OneStopApi {
  APIService()
      : super(
          onestopBaseUrl: Endpoints.onestopBaseUrl,
          serverBaseUrl: Endpoints.gateLogServerUrl,
          onestopSecurityKey: Endpoints.onestopSecurityKey,
        );

  Future<String> getUserId() async {
    final res = await onestopDio.get("/user/getUserId");
    return res.data['userId'];
  }

  Future<List<EntryDetails>> getLogHistory(int pageNumber, int pageSize) async {
    final res = await serverDio.get(Endpoints.getAllLogs, queryParameters: {
      'page': pageNumber.toString(),
      'size': pageSize.toString()
    });
    List<EntryDetails> entriesPage = (res.data['history'] as List)
        .map((e) => EntryDetails.fromJson(e))
        .toList();
    return entriesPage;
  }
}
