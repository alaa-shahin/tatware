import 'package:tatware/index.dart';

import '../../routes/app_routes.dart';
import '../../util/widget_util.dart';

class GetStartView extends StatelessWidget {
  const GetStartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            addVerticalSpace(15),
            Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: SvgPicture.asset('assets/icons/rectangle.svg'),
                ),
                PositionedDirectional(
                  top: 7.h,
                  start: 20.w,
                  child: Column(
                    children: [
                      Text(
                        'Hi, My name is Oranobot\n I will always be there to\n help and assist you.',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      addVerticalSpace(2),
                      Text(
                        'Say Start To go to Next.',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            addVerticalSpace(3),
            Center(
              child: SvgPicture.asset(
                'assets/images/bot.svg',
                height: 30.h,
              ),
            ),
            addVerticalSpace(3),
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: Size(40.w, 7.h)),
              onPressed: () {
                Navigator.pushNamed(context, Routes.Chat);
              },
              child: Text('Next'),
            ),
            addVerticalSpace(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/language.svg'),
                addHorizontalSpace(2),
                Text(
                  'English',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
