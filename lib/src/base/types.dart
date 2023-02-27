class GeoLocation {
  final double latitude;
  final double longitude;

  GeoLocation(this.latitude, this.longitude);

  @override
  String toString() => '$latitude - $longitude';
}
