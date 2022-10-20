import 'package:tatware/models/category_model.dart';
import 'package:tatware/models/online_experts_model.dart';

import '../../index.dart';
import '../../models/recommended_experts_model.dart';
import '../../repository/global_repo.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  GlobalRepo _globalRepo = GlobalRepo();

  List<RecommendedExperts>? recommendedModel = [];
  List<OnlineExperts>? onlineExperts = [];
  List<CategoryModel>? categoryModel = [];

  getRecommendedExperts() async {
    emit(HomeRecommendedExpertsLoadingState());
    recommendedModel = await _globalRepo.getRecommendedExperts();
    emit(HomeGetRecommendedExpertsState());
    return recommendedModel;
  }

  getOnlineExperts() async {
    emit(HomeOnlineExpertsLoadingState());
    onlineExperts = await _globalRepo.getOnlineExperts();
    emit(HomeGetOnlineExpertsState());
    return onlineExperts;
  }

  getCategory() async {
    emit(HomeCategoryLoadingState());
    categoryModel = await _globalRepo.getCategory();
    emit(HomeGetCategoryState());
    return categoryModel;
  }
}
