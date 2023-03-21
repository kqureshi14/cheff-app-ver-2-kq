
import 'package:chef/base/base_viewmodel.dart';
import 'package:chef/helpers/url_helper.dart';
import 'package:chef/services/network/network_service.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:chef/models/experience/schedule_request.dart' as scheduleReuqest;

import '../../../constants/api.dart';
import 'create_schedule_m.dart';

@injectable
class  ScheduleScreenViewModel extends BaseViewModel<ScheduleScreenState> {
  ScheduleScreenViewModel({
    required INetworkService network,
  }) : _network = network, super(const Loading());


  final INetworkService _network;


  initialize(){
    emit(const Loaded());
  }

  Future<void> sendScheduleData() async {
    final url =
    InfininURLHelpers.getRestApiURL(Api.baseURL + Api.scheduleSave);

    emit(const Loading());

    scheduleReuqest.ScehduleData? scheduleDataAdd;


    final ScheduleRequest = scheduleReuqest.ScheduleRequest(
      t: scheduleDataAdd,
    ).toJson();

    final response = await _network.post(
      path: url,
      data: ScheduleRequest,
    );


    response.body != "" || response.body != null ?  emit(Loaded()) : emit(const Loading());
  }
}