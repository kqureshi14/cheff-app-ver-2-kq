import 'package:chef/helpers/helpers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../order_screen.dart';
import 'order_screen_m.dart';
import 'order_screen_vm.dart';
// import '../schedule_screen_v.dart';
// import 'create_schedule_m.dart';
// import 'create_schedule_viewmodel.dart';

class OrderScreenView extends BaseView<OrderScreenViewModel> {
  OrderScreenView({Key? key}) : super(key: key);

  @override
  Widget buildScreen(
      {required BuildContext context, required ScreenSizeData screenSizeData}) {
    final appTheme = AppTheme.of(context).theme;

    return BlocBuilder<OrderScreenViewModel, OrderScreenState>(
        bloc: viewModel..initialize(),
        builder: (context, state) {
          return Scaffold(
            backgroundColor: appTheme.colors.primaryBackground,
            body: state.when(
                loading: _loading, loaded: () => displayLoaded(viewModel)),
          );
        });
  }

  Widget _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget displayLoaded(OrderScreenViewModel viewModel) {
    return OrderScreen();
  }
}
