class InfoState {
  InfoState({
    this.temperature = "",
    this.temperatureRange = "",
    this.condition = "",
    this.location = "",
  })  : assert(temperature != null),
        assert(temperatureRange != null),
        assert(condition != null),
        assert(location != null);

  final String temperature;
  final String temperatureRange;
  final String condition;
  final String location;
}
