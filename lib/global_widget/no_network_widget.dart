import '../../../index.dart';

class NoNetworkWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.wifi_lock_outlined,
          size: 90,
        ),
      ),
    );
  }
}
