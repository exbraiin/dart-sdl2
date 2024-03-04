// ignore_for_file: constant_identifier_names, camel_case_types

/// The different sensors defined by SDL
enum SDL_SensorType {
  /// Returned for an invalid sensor
  SDL_SENSOR_INVALID(-1),

  /// Unknown sensor type
  SDL_SENSOR_UNKNOWN(0),

  /// Accelerometer
  SDL_SENSOR_ACCEL(1),

  /// Gyroscope
  SDL_SENSOR_GYRO(2),

  /// Accelerometer for left Joy-Con controller and Wii nunchuk
  SDL_SENSOR_ACCEL_L(3),

  /// Gyroscope for left Joy-Con controller
  SDL_SENSOR_GYRO_L(4),

  /// Accelerometer for right Joy-Con controller
  SDL_SENSOR_ACCEL_R(5),

  /// Gyroscope for right Joy-Con controller
  SDL_SENSOR_GYRO_R(6);

  final int value;
  const SDL_SensorType(this.value);
}
