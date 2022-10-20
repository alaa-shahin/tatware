import '../../../index.dart';
import '../util/constants.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(10.0),
        child: CircularProgressIndicator(
          strokeWidth: 1,
          color: Constants.mainColor,
        ),
      ),
    );
  }
}
