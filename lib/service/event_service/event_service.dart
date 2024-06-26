import 'package:kreasi_nusantara/service/base_service/base_service.dart';

class BeritaService extends BaseService<Map<String, dynamic>> {
  @override
  String get endpoint => "events";

  @override
  Map<String, dynamic> decode(data) {
    return Map<String, dynamic>.from(data);
  }
}
