class InfoState {
  InfoState({
    this.temperature = "",
    this.temperatureUnit = "",
    this.temperatureRange = "",
    this.condition = "",
    this.location = "",
  })  : assert(temperature != null),
        assert(temperatureUnit != null),
        assert(temperatureRange != null),
        assert(condition != null),
        assert(location != null);

  factory InfoState.empty() => InfoState();

  final String temperature;
  final String temperatureUnit;
  final String temperatureRange;
  final String condition;
  final String location;
}
