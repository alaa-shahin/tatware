import 'package:tatware/models/category_model.dart';
import 'package:tatware/models/chat_model.dart';
import '../../index.dart';
import '../../repository/global_repo.dart';
import 'chat_states.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInitialState());

  static ChatCubit get(context) => BlocProvider.of(context);

  GlobalRepo _globalRepo = GlobalRepo();

  List<ChatModel>? chatModel = [];
  List<CategoryModel>? categoryModel = [];

  Future<List<ChatModel>?> getChatMessages() async {
    emit(ChatMessagesLoadingState());
    chatModel = await _globalRepo.getChatMessages();
    emit(ChatGetMessagesState());
    return chatModel;
  }

  Future<List<CategoryModel>?> getCategory() async {
    emit(ChatGetCategoryLoadingState());
    categoryModel = await _globalRepo.getCategory();
    emit(ChatGetCategoryState());
    return categoryModel;
  }
}
