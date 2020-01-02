class InfoState {
  InfoState({
    this.temperature = "",
    this.shortTemperatureUnit = "",
    this.temperatureUnit = "",
    this.temperatureRange = "",
    this.condition = "",
    this.location = "",
  })  : assert(temperature != null),
        assert(shortTemperatureUnit != null),
        assert(temperatureUnit != null),
        assert(temperatureRange != null),
        assert(condition != null),
        assert(location != null);

  factory InfoState.empty() => InfoState();

  final String temperature;
  final String shortTemperatureUnit;
  final String temperatureUnit;
  final String temperatureRange;
  final String condition;
  final String location;
}
