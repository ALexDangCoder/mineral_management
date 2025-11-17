import 'package:bnv_opendata/data/model/mine_model.dart';

class MineRepository {
  Future<MineModel> fetchMine3DModel() async {
    await Future.delayed(const Duration(seconds: 1));
    return MineModel(
      id: 'mine_001',
      name: 'Khu mỏ Thạch Khê',
      modelUrl: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
    );
  }
}
