import 'package:chef/base/base_viewmodel.dart';
import 'package:chef/helpers/url_helper.dart';
import 'package:chef/services/network/network_service.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:chef/models/experience/schedule_request.dart'
    as scheduleReuqest;

import '../../../constants/api.dart';
import '../../../models/experience/schedule_response.dart';
import '../../../services/application_state.dart';
import '../../../setup.dart';
import 'order_screen_m.dart';
// import 'create_schedule_m.dart';

@injectable
class OrderScreenViewModel extends BaseViewModel<OrderScreenState> {
  OrderScreenViewModel({
    required INetworkService network,
  })  : _network = network,
        super(const Loading());

  final INetworkService _network;

  void initialize() {
    emit(const Loaded());
  }
}
