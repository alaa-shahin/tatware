import 'package:go_router/go_router.dart';
import 'package:tatware/util/constants.dart';

import '../../index.dart';
import '../../routes/app_routes.dart';
import '../../util/widget_util.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/welcome.png',
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Column(
            children: [
              Spacer(flex: 2),
              SvgPicture.asset('assets/images/logo.svg'),
              addVerticalSpace(3),
              Text('Expert From Every Planet'),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  context.go(Routes.GetStart);
                },
                child: Text('Get Started'),
              ),
              addVerticalSpace(3),
              Text.rich(
                TextSpan(
                  text: 'Don’t have an account?',
                  style: Theme.of(context).textTheme.bodyText1,
                  children: [
                    TextSpan(
                      text: ' SignUp',
                      style: TextStyle(color: Constants.mainColor),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              addVerticalSpace(2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/language.svg'),
                  addHorizontalSpace(2),
                  Text(
                    'English',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
              addVerticalSpace(2),
            ],
          ),
        ],
      ),
    );
  }
}
