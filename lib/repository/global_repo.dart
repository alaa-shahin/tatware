import 'package:tatware/util/base_request.dart';

import '../models/category_model.dart';
import '../models/online_experts_model.dart';
import '../models/recommended_experts_model.dart';

class GlobalRepo {
  /// get recommended experts
  Future<List<RecommendedExperts>?> getRecommendedExperts() async {
    var response = await BaseRequest.dynamicRequest(
      path: 'recommended-experts',
    );
    return response == null
        ? []
        : List<RecommendedExperts>.from(
            response.map((e) => RecommendedExperts.fromJson(e)));
  }

  /// get online experts
  Future<List<OnlineExperts>?> getOnlineExperts() async {
    var response = await BaseRequest.dynamicRequest(
      path: 'online-experts',
    );
    return response == null
        ? []
        : List<OnlineExperts>.from(
            response.map((e) => OnlineExperts.fromJson(e)));
  }

  /// get categories
  Future<List<CategoryModel>?> getCategory() async {
    var response = await BaseRequest.dynamicRequest(
      path: 'category',
    );
    return response == null
        ? []
        : List<CategoryModel>.from(
            response.map((e) => CategoryModel.fromJson(e)));
  }
}
