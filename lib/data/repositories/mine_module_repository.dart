import 'package:bnv_opendata/data/models/closure_plan.dart';
import 'package:bnv_opendata/data/models/drill_hole.dart';
import 'package:bnv_opendata/data/models/mine_region.dart';
import 'package:bnv_opendata/data/models/mine_site.dart';

abstract class MineModuleRepository {
  Future<List<MineRegion>> getMineRegions();

  Future<List<MineSite>> getMineSitesByRegion(String regionId);

  Future<MineSite?> getMineSiteById(String siteId);

  Future<List<DrillHole>> getDrillHolesBySite(String siteId);

  Future<DrillHole?> getDrillHoleById(String drillHoleId);

  Future<List<ClosurePlan>> getClosurePlansBySite(String siteId);

  Future<ClosurePlan?> getClosurePlanById(String planId);
}
