import 'package:chef/base/base_viewmodel.dart';
import 'package:chef/helpers/url_helper.dart';
import 'package:chef/services/network/network_service.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../../constants/api.dart';
import '../../../models/booking/accept_booking_response.dart';
import '../../../models/booking/booking_status.dart';
import '../../../models/booking/order_detail_response.dart';
import '../../../models/foodie/foodie_details_response.dart';
import '../../../models/home/food_menu_request.dart';
import '../../../services/application_state.dart';
import '../../../setup.dart';
import 'foodie_profile_decision_screen_m.dart';
// import 'order_screen_m.dart';

import 'dart:developer' as developer;

@injectable
class FoodieProfileDecisionScreenViewModel
    extends BaseViewModel<FoodieProfileDecisionScreenState> {
  FoodieProfileDecisionScreenViewModel({
    required INetworkService network,
  })  : _network = network,
        super(const Loading());

  final INetworkService _network;

  String bookingId = "0";

  void initialize(String _bookingId) {
    developer.log(' Booking Id is ' + '${_bookingId}');
    bookingId = _bookingId;
    // emit(const Loading());
    loadOrderDetails();
  }

  Future<void> loadOrderDetails() async {
    final url = InfininHelpers.getRestApiURL(Api.baseURL + Api.findById);
    // emit(const Loading());

    final _appService = locateService<ApplicationService>();

    emit(const Loading());

    final foodMenuRequest = FoodMenuRequest(
      // t: int.parse(_appService.state.userInfo!.t.id.toString()),
      t: int.parse(bookingId),
    ).toJson();

    final response = await _network.post(
      path: url,
      data: foodMenuRequest,
    );

    if (response != null) {
      // FoodieDetails foodieDetails = foodieDetailsFromJson(response.body);
      developer
          .log(' Response body of order details are ' + '${response.body}');

      OrderDetails orderDetails = orderDetailsFromJson(response.body);
      emit(Loaded(orderDetails));
    }
  }

  Future<void> sendAcceptRequest() async {
    final url = InfininHelpers.getRestApiURL(Api.baseURL + Api.acceptBooking);
    // emit(const Loading());

    final _appService = locateService<ApplicationService>();

    //  emit(const Loading());

    final foodMenuRequest = FoodMenuRequest(
      // t: int.parse(_appService.state.userInfo!.t.id.toString()),
      t: int.parse(bookingId),
    ).toJson();

    final response = await _network.post(
      path: url,
      data: foodMenuRequest,
    );

    if (response != null) {
      OrderStatusResponse acceptResponse =
          orderStatusResponseFromJson(response.body);
      developer.log('acceptResponse is  ' + '${acceptResponse.t.brandName}');

      //  emit(Loaded(foodieDetails));
    }
  }

  Future<void> sendDeclineRequest() async {
    final url = InfininHelpers.getRestApiURL(Api.baseURL + Api.declineBooking);
    // emit(const Loading());

    final _appService = locateService<ApplicationService>();

    //  emit(const Loading());

    final foodMenuRequest = FoodMenuRequest(
      // t: int.parse(_appService.state.userInfo!.t.id.toString()),
      t: int.parse(bookingId),
    ).toJson();

    final response = await _network.post(
      path: url,
      data: foodMenuRequest,
    );

    if (response != null) {
      OrderStatusResponse declineResponse =
          orderStatusResponseFromJson(response.body);
      developer.log('declineResponse is  ' + '${declineResponse.t.brandName}');

      //  emit(Loaded(foodieDetails));
    }
  }

  String getDisplayDate(
    DateTime providedDate,
    String providedTime,
  ) {
    // DateTime date = DateTime.parse(item.scheduleScheduledDate ?? '');
    String formattedDate =
        "${providedDate.day} ${InfininHelpers.getMonthName(providedDate.month)}";

    // final DateFormat formatter = DateFormat('yyyy-MM-dd');
    // final String formatted = formatter.format(providedDate);

    // final String formatted = formatter.format(now);
    //String timeString = providedTime ?? '';
    DateFormat inputFormat = DateFormat('HH:mm:ss');
    DateTime dateTime = inputFormat.parse(providedTime);
    DateFormat outputFormat = DateFormat('hh a');
    String formattedTime = outputFormat.format(dateTime);

    developer.log(' Formatted Time is ' + '${formattedTime}');

    return formattedTime;
  }

  String getFormattedDate(DateTime providedDate) {
    String formattedDate =
        "${providedDate.day} ${InfininHelpers.getMonthName(providedDate.month)}";

    return formattedDate;
  }

  String displayFormatedDateAndTime(
      DateTime providedDate, String providedTime) {
    String formattedDate = getFormattedDate(providedDate) +
        " @ " +
        getDisplayDate(providedDate, providedTime);

    return formattedDate;
  }

  String getDateDisplay(
    DateTime providedDate,
  ) {
    final DateFormat formatter = DateFormat('dd-MM-yy');
    final String formatted = formatter.format(providedDate);

    return formatted;
  }

  String getDayAndMonth(DateTime _givenDate) {
    var _date = InfininHelpers.dayOfMonth(_givenDate);
    var dayOfMonth = _givenDate.day;
    var _month = InfininHelpers.months[_givenDate.month - 1];
    var _productDetailSelectionDate = _date.toUpperCase() +
        ',  ' +
        (dayOfMonth.toString())! +
        "   " +
        _month.toString().toUpperCase();
    return _productDetailSelectionDate;
  }
}
