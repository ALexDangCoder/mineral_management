import 'package:json_annotation/json_annotation.dart';

enum MineStatusEnum {
  @JsonValue(1)
  active,
  @JsonValue(2)
  pause,
  @JsonValue(0)
  inactive;

  String get title {
    switch (this) {
      case MineStatusEnum.active:
        return 'Đang hoạt động';
      case MineStatusEnum.pause:
        return 'Tạm dừng';
      case MineStatusEnum.inactive:
        return 'Không hoạt động';
    }
  }

  int get value {
    switch (this) {
      case MineStatusEnum.active:
        return 1;
      case MineStatusEnum.pause:
        return 2;
      case MineStatusEnum.inactive:
        return 0;
    }
  }

  static MineStatusEnum? fromValue(int? value) {
    switch (value) {
      case 1:
        return MineStatusEnum.active;
      case 2:
        return MineStatusEnum.pause;
      case 0:
        return MineStatusEnum.inactive;
      default:
        return null; // or throw an exception if the value is invalid
    }
  }

}
