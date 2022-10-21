import 'package:tatware/index.dart';
import 'package:tatware/modules/chat_module/chat_states.dart';
import 'package:tatware/modules/chat_module/local_widgets/message_bubble.dart';
import 'package:tatware/routes/app_routes.dart';
import 'package:tatware/util/constants.dart';
import 'package:tatware/util/widget_util.dart';
import 'chat_cubit.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: BouncingScrollPhysics(),
        child: BlocProvider<ChatCubit>(
          create: (_) => ChatCubit()
            ..getChatMessages()
            ..getCategory(),
          child: BlocConsumer<ChatCubit, ChatStates>(
            listener: (context, state) {
              if (state is ChatMessagesLoadingState) {
                Center(child: CircularProgressIndicator());
              }
            },
            builder: (context, state) {
              var cubit = ChatCubit.get(context);
              return Column(
                children: [
                  ListView.builder(
                    itemCount: cubit.chatModel!.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var message = cubit.chatModel![index];
                      return MessageBubble(
                        message: message.message!,
                        isMe: message.isMe!,
                      );
                    },
                  ),
                  BlocConsumer<ChatCubit, ChatStates>(
                    listener: (context, state) {
                      if (state is ChatGetCategoryLoadingState) {
                        Center(child: CircularProgressIndicator());
                      }
                    },
                    builder: (context, state) {
                      var cubit = ChatCubit.get(context);
                      return ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        itemCount: cubit.categoryModel!.length,
                        itemBuilder: (context, index) {
                          var category = cubit.categoryModel![index];
                          return Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                activeColor: Constants.mainColor,
                                value: category.selected,
                                onChanged: (newValue) {
                                  category.selected = newValue;
                                  cubit.emit(ChatToggleRadioButtonState());
                                },
                              ),
                              Text(
                                category.name!,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  addVerticalSpace(1),
                  Padding(
                    padding: EdgeInsetsDirectional.only(end: 22.w),
                    child: Text(
                      'Say Done, Or Press Send to Apply',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  addVerticalSpace(3),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: Theme.of(context).textTheme.bodyText1,
                          decoration: InputDecoration(
                            labelText: 'Type something…',
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            prefixIcon: SvgPicture.asset(
                              'assets/icons/language.svg',
                              fit: BoxFit.scaleDown,
                            ),
                            suffixIcon: SvgPicture.asset(
                              'assets/icons/voice.svg',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.Home);
                        },
                        icon: SvgPicture.asset('assets/icons/send.svg'),
                      ),
                    ],
                  ),
                  addVerticalSpace(3),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
