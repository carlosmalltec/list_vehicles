import 'package:appvehicles/core/alerts/application_alerts.dart';
import 'package:appvehicles/core/enum/application_loading.dart';
import 'package:appvehicles/core/logger/application_print_logger.dart';
import 'package:appvehicles/modules/home/external/datasource/vehicle_datasource_impl.dart';
import 'package:appvehicles/modules/home/infra/models/vehicle_impl.dart';
import 'package:get/get.dart';

class VehicleController extends GetxController {
  final VehicleDatasourceImpl request;

  VehicleController({required this.request});

  final RxList<VehicleImpl> listVehicles = RxList<VehicleImpl>();
  final RxBool _pagination = RxBool(false);

  final Rx<ApplicationLoading> isLoading = Rx<ApplicationLoading>(ApplicationLoading.notLoading);

  static const _loadMorePageConst = 0.8;
  static const _pageOne = 1;

  final RxInt _page = RxInt(_pageOne);

  @override
  void onInit() async {
    super.onInit();
  }

  getFirstPage([isFirst = false]) async {
    if (isFirst) {
      isLoading.value = ApplicationLoading.shimmerLoading;
    } else {
      isLoading.value = ApplicationLoading.fullLoading;
    }
    listVehicles.clear();
    _pagination.value = false;
    _page.value = _pageOne;
    await _getFindVehicle();
  }

  onScroll(double scrollPosition, double scrollMax) async {
    if (_pagination.value) return;
    if (scrollPosition > scrollMax * _loadMorePageConst) {
      _pagination.value = false;
      getNextPage();
    }
  }

  getNextPage() async {
    if (isLoading.value != ApplicationLoading.notLoading) return;
    isLoading.value = ApplicationLoading.nextPageLoading;
    await _getFindVehicle();
  }

  swipeRefresh() async {
    _pagination.value = false;
    await getFirstPage(true);
  }

  _getFindVehicle() async {
    try {
      await 0.5.delay();
      final _response = await request.vehiclesDatasource(_page.value);
      if (_response.statusCode != 200) {
        await ApplicationAlerts.w(title: 'Oops!', body: 'failureList'.tr);
        isLoading.value = ApplicationLoading.notLoading;
        return;
      }

      /// Fim da paginação, evita requisitar dados para o server com scroll
      bool _isEmptyData = _response.model?.isEmpty ?? false;
      if (_isEmptyData && listVehicles.isNotEmpty) {
        _pagination.value = true;
        ApplicationAlerts.s(title: 'Oops!', body: 'allListVehicles'.tr);
        isLoading.value = ApplicationLoading.notLoading;
        return;
      }
      if (_response.model != null) listVehicles.addAll(_response.model!);
      isLoading.value = ApplicationLoading.notLoading;
      _page.value = _page.value + 1;
    } catch (e) {
      ApplicationPrintLogger.d('ERROR CONTROLLER VEICULO ===> $e', name: 'getFindVehicle');
      isLoading.value = ApplicationLoading.notLoading;
      _pagination.value = false;
      // ApplicationAlerts.d(title: 'Oops!', body: 'Não foi possível listar os dados');
    }
  }
}
