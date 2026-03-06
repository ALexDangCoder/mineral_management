import 'package:bnv_opendata/config/routes/router.dart';
import 'package:flutter/material.dart';

class MineFlowRoutes {
  const MineFlowRoutes._();

  static Future<void> pushMineSubList(BuildContext context, String regionId) {
    return Navigator.pushNamed(
      context,
      Routers.mineSubList,
      arguments: {'regionId': regionId},
    );
  }

  static Future<void> pushMineSiteDetail(BuildContext context, String siteId) {
    return Navigator.pushNamed(
      context,
      Routers.mineDetail,
      arguments: {'siteId': siteId},
    );
  }

  static Future<void> pushDrillHoleList(BuildContext context, String siteId) {
    return Navigator.pushNamed(
      context,
      Routers.drillHoleList,
      arguments: {'siteId': siteId},
    );
  }

  static Future<void> pushDrillHoleDetail(
    BuildContext context,
    String drillHoleId,
  ) {
    return Navigator.pushNamed(
      context,
      Routers.drillHoleDetail,
      arguments: {'drillHoleId': drillHoleId},
    );
  }

  static Future<void> pushClosurePlanList(BuildContext context, String siteId) {
    return Navigator.pushNamed(
      context,
      Routers.closurePlanList,
      arguments: {'siteId': siteId},
    );
  }

  static Future<void> pushClosurePlanDetail(
      BuildContext context, String planId) {
    return Navigator.pushNamed(
      context,
      Routers.closurePlanDetail,
      arguments: {'planId': planId},
    );
  }
}
