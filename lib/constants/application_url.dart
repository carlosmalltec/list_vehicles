class ApplicationUrl {
  ApplicationUrl._();

  /// Lista de veículos
  static String findAllVehicles(int page) => '$_vehicles/?Page=$page';
  static String get _vehicles => '/OnlineChallenge/Vehicles';

  ///
}
