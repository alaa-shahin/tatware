import 'package:tatware/util/constants.dart';

import '../../../index.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  MessageBubble({
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        if (!isMe) SvgPicture.asset('assets/icons/chat_bot.svg'),
        Container(
          decoration: BoxDecoration(
            color: isMe ? Constants.mainColor : Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          width: 65.w,
          padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 3.w),
          margin: EdgeInsets.symmetric(vertical: 3.h, horizontal: 2.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                message,
                style: isMe
                    ? Theme.of(context).textTheme.subtitle1
                    : Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
        if (isMe) SvgPicture.asset('assets/icons/check.svg'),
      ],
    );
  }
}
