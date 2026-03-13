import 'package:bnv_opendata/data/models/closure_plan.dart';
import 'package:bnv_opendata/data/models/drill_hole.dart';
import 'package:bnv_opendata/data/models/mine_document.dart';
import 'package:bnv_opendata/data/models/mine_region.dart';
import 'package:bnv_opendata/data/models/mine_site.dart';
import 'package:bnv_opendata/data/repositories/mine_module_repository.dart';

class FakeMineModuleRepository implements MineModuleRepository {
  FakeMineModuleRepository();

  static final FakeMineModuleRepository instance = FakeMineModuleRepository();

  final List<MineRegion> _regions = const [
    MineRegion(
      id: 'region_mao_khe',
      name: 'Vung mo Mao Khe - Uong Bi',
      location: 'Quang Ninh',
      siteCount: 3,
    ),
    MineRegion(
      id: 'region_hon_gai',
      name: 'Vung mo Hon Gai',
      location: 'Quang Ninh',
      siteCount: 3,
    ),
  ];

  late final List<MineSite> _sites = [
    MineSite(
      id: 'site_mk_01',
      regionId: 'region_mao_khe',
      code: 'MK-01',
      name: 'Khu mo Truc Chinh Bac',
      location: 'Phuong Mao Khe, Dong Trieu',
      organization: 'Cong ty Than Mao Khe',
      mineral: 'Than da',
      area: '120 ha',
      status: 'Dang khai thac',
      stage: 'Giai doan 2024-2028',
      coordinates: '21.070N, 106.620E',
      elevation: '+32m',
      imageCategoryCounts: const {
        'Lo khoan': 12,
        'Cong trinh khai dao': 5,
        'Cong tac do ve': 9,
      },
      digitalDocuments: const [
        MineDocument(
          id: 'doc_site_mk_01_01',
          name: 'Bao cao hien trang quy I/2026.pdf',
          fileType: 'PDF',
          size: '2.4 MB',
          updatedAt: '2026-02-18',
        ),
        MineDocument(
          id: 'doc_site_mk_01_02',
          name: 'Ban do dia chat 1_5000.dwg',
          fileType: 'DWG',
          size: '8.9 MB',
          updatedAt: '2026-01-20',
        ),
      ],
    ),
    MineSite(
      id: 'site_mk_02',
      regionId: 'region_mao_khe',
      code: 'MK-02',
      name: 'Khu mo Vang Danh Dong',
      location: 'Phuong Vang Danh, Uong Bi',
      organization: 'Cong ty Than Uong Bi',
      mineral: 'Than da',
      area: '98 ha',
      status: 'Tam dung',
      stage: 'Danh gia bo sung',
      coordinates: '21.101N, 106.740E',
      elevation: '+40m',
      imageCategoryCounts: const {
        'Lo khoan': 8,
        'Cong trinh khai dao': 4,
        'Cong tac do ve': 6,
      },
      digitalDocuments: const [
        MineDocument(
          id: 'doc_site_mk_02_01',
          name: 'Thong ke tru luong cap nhat.xlsx',
          fileType: 'XLSX',
          size: '1.1 MB',
          updatedAt: '2026-02-03',
        ),
      ],
    ),
    MineSite(
      id: 'site_mk_03',
      regionId: 'region_mao_khe',
      code: 'MK-03',
      name: 'Khu mo Cong Hoa Tay',
      location: 'Xa Cong Hoa, Quang Yen',
      organization: 'Tong cong ty Dong Bac',
      mineral: 'Than da',
      area: '142 ha',
      status: 'Dang tham do',
      stage: 'Giai doan 2025-2027',
      coordinates: '21.040N, 106.810E',
      elevation: '+28m',
      imageCategoryCounts: const {
        'Lo khoan': 7,
        'Cong trinh khai dao': 3,
        'Cong tac do ve': 5,
      },
      digitalDocuments: const [
        MineDocument(
          id: 'doc_site_mk_03_01',
          name: 'Ho so quan trach moi truong.docx',
          fileType: 'DOCX',
          size: '0.7 MB',
          updatedAt: '2026-02-25',
        ),
      ],
    ),
    MineSite(
      id: 'site_hg_01',
      regionId: 'region_hon_gai',
      code: 'HG-01',
      name: 'Khu mo Nui Beo',
      location: 'Ha Long',
      organization: 'Cong ty Than Nui Beo',
      mineral: 'Than da',
      area: '135 ha',
      status: 'Dang khai thac',
      stage: 'Giai doan 2023-2029',
      coordinates: '20.980N, 107.100E',
      elevation: '+15m',
      imageCategoryCounts: const {
        'Lo khoan': 10,
        'Cong trinh khai dao': 8,
        'Cong tac do ve': 11,
      },
      digitalDocuments: const [
        MineDocument(
          id: 'doc_site_hg_01_01',
          name: 'Bao cao san luong thang 02-2026.pdf',
          fileType: 'PDF',
          size: '3.0 MB',
          updatedAt: '2026-03-01',
        ),
      ],
    ),
    MineSite(
      id: 'site_hg_02',
      regionId: 'region_hon_gai',
      code: 'HG-02',
      name: 'Khu mo Ha Tu',
      location: 'Cam Pha',
      organization: 'Cong ty Than Ha Tu',
      mineral: 'Than da',
      area: '167 ha',
      status: 'Dang khai thac',
      stage: 'Giai doan 2024-2030',
      coordinates: '21.020N, 107.230E',
      elevation: '+22m',
      imageCategoryCounts: const {
        'Lo khoan': 9,
        'Cong trinh khai dao': 5,
        'Cong tac do ve': 7,
      },
      digitalDocuments: const [
        MineDocument(
          id: 'doc_site_hg_02_01',
          name: 'Tong hop giam sat dia chat.pdf',
          fileType: 'PDF',
          size: '4.6 MB',
          updatedAt: '2026-01-28',
        ),
      ],
    ),
    MineSite(
      id: 'site_hg_03',
      regionId: 'region_hon_gai',
      code: 'HG-03',
      name: 'Khu mo Cao Son',
      location: 'Cam Pha',
      organization: 'Cong ty Than Cao Son',
      mineral: 'Than da',
      area: '190 ha',
      status: 'Dang phuc hoi',
      stage: 'Hoan nguyen 2026-2028',
      coordinates: '21.030N, 107.270E',
      elevation: '+30m',
      imageCategoryCounts: const {
        'Lo khoan': 6,
        'Cong trinh khai dao': 2,
        'Cong tac do ve': 4,
      },
      digitalDocuments: const [
        MineDocument(
          id: 'doc_site_hg_03_01',
          name: 'Ke hoach phuc hoi moi truong.pdf',
          fileType: 'PDF',
          size: '1.8 MB',
          updatedAt: '2026-02-11',
        ),
      ],
    ),
  ];

  late final List<DrillHole> _drillHoles = [
    const DrillHole(
      id: 'drill_mk_01_01',
      siteId: 'site_mk_01',
      code: 'LK-MK01-01',
      name: 'Lo khoan Trung tam 01',
      mineral: 'Than da',
      status: 'Hoan thanh',
      stage: 'Tham do chi tiet',
      startDate: '2025-03-10',
      endDate: '2025-03-19',
      coordinateX: '231456.12',
      coordinateY: '1209876.43',
      coordinateZ: '35.10',
      depth: '286.5 m',
      elevation: '+32 m',
      profileDocument: 'Ho so LK-MK01-01.pdf',
    ),
    const DrillHole(
      id: 'drill_mk_01_02',
      siteId: 'site_mk_01',
      code: 'LK-MK01-02',
      name: 'Lo khoan Dong Bac 02',
      mineral: 'Than da',
      status: 'Dang thi cong',
      stage: 'Tham do mo rong',
      startDate: '2026-01-08',
      endDate: '—',
      coordinateX: '231530.55',
      coordinateY: '1209930.81',
      coordinateZ: '36.20',
      depth: '121.0 m',
      elevation: '+31 m',
      profileDocument: 'Ho so LK-MK01-02.pdf',
    ),
    const DrillHole(
      id: 'drill_mk_02_01',
      siteId: 'site_mk_02',
      code: 'LK-MK02-01',
      name: 'Lo khoan Vang Danh 01',
      mineral: 'Than da',
      status: 'Hoan thanh',
      stage: 'Bo sung tru luong',
      startDate: '2025-09-02',
      endDate: '2025-09-12',
      coordinateX: '228415.07',
      coordinateY: '1211305.11',
      coordinateZ: '40.0',
      depth: '198.2 m',
      elevation: '+40 m',
      profileDocument: 'Ho so LK-MK02-01.pdf',
    ),
    const DrillHole(
      id: 'drill_mk_02_02',
      siteId: 'site_mk_02',
      code: 'LK-MK02-02',
      name: 'Lo khoan Vang Danh 02',
      mineral: 'Than da',
      status: 'Tam dung',
      stage: 'Bo sung tru luong',
      startDate: '2025-10-14',
      endDate: '2025-10-20',
      coordinateX: '228510.52',
      coordinateY: '1211220.35',
      coordinateZ: '39.6',
      depth: '210.7 m',
      elevation: '+39 m',
      profileDocument: 'Ho so LK-MK02-02.pdf',
    ),
    const DrillHole(
      id: 'drill_mk_03_01',
      siteId: 'site_mk_03',
      code: 'LK-MK03-01',
      name: 'Lo khoan Cong Hoa 01',
      mineral: 'Than da',
      status: 'Dang thi cong',
      stage: 'Tham do ban dau',
      startDate: '2026-02-05',
      endDate: '—',
      coordinateX: '225123.19',
      coordinateY: '1208450.91',
      coordinateZ: '28.5',
      depth: '90.3 m',
      elevation: '+28 m',
      profileDocument: 'Ho so LK-MK03-01.pdf',
    ),
    const DrillHole(
      id: 'drill_mk_03_02',
      siteId: 'site_mk_03',
      code: 'LK-MK03-02',
      name: 'Lo khoan Cong Hoa 02',
      mineral: 'Than da',
      status: 'Ke hoach',
      stage: 'Tham do ban dau',
      startDate: '2026-03-20',
      endDate: '—',
      coordinateX: '225210.00',
      coordinateY: '1208511.30',
      coordinateZ: '29.2',
      depth: '—',
      elevation: '+29 m',
      profileDocument: 'Ho so LK-MK03-02.pdf',
    ),
    const DrillHole(
      id: 'drill_hg_01_01',
      siteId: 'site_hg_01',
      code: 'LK-HG01-01',
      name: 'Lo khoan Nui Beo 01',
      mineral: 'Than da',
      status: 'Hoan thanh',
      stage: 'Danh gia cap phep',
      startDate: '2025-06-09',
      endDate: '2025-06-15',
      coordinateX: '245201.15',
      coordinateY: '1199780.44',
      coordinateZ: '14.9',
      depth: '175.0 m',
      elevation: '+15 m',
      profileDocument: 'Ho so LK-HG01-01.pdf',
    ),
    const DrillHole(
      id: 'drill_hg_01_02',
      siteId: 'site_hg_01',
      code: 'LK-HG01-02',
      name: 'Lo khoan Nui Beo 02',
      mineral: 'Than da',
      status: 'Dang thi cong',
      stage: 'Danh gia cap phep',
      startDate: '2026-01-12',
      endDate: '—',
      coordinateX: '245305.61',
      coordinateY: '1199702.22',
      coordinateZ: '15.4',
      depth: '134.0 m',
      elevation: '+15 m',
      profileDocument: 'Ho so LK-HG01-02.pdf',
    ),
    const DrillHole(
      id: 'drill_hg_02_01',
      siteId: 'site_hg_02',
      code: 'LK-HG02-01',
      name: 'Lo khoan Ha Tu 01',
      mineral: 'Than da',
      status: 'Hoan thanh',
      stage: 'Nang cap mo',
      startDate: '2025-04-03',
      endDate: '2025-04-18',
      coordinateX: '247111.12',
      coordinateY: '1202101.67',
      coordinateZ: '22.8',
      depth: '305.3 m',
      elevation: '+22 m',
      profileDocument: 'Ho so LK-HG02-01.pdf',
    ),
    const DrillHole(
      id: 'drill_hg_02_02',
      siteId: 'site_hg_02',
      code: 'LK-HG02-02',
      name: 'Lo khoan Ha Tu 02',
      mineral: 'Than da',
      status: 'Dang thi cong',
      stage: 'Nang cap mo',
      startDate: '2026-02-01',
      endDate: '—',
      coordinateX: '247180.43',
      coordinateY: '1202190.10',
      coordinateZ: '23.0',
      depth: '88.0 m',
      elevation: '+23 m',
      profileDocument: 'Ho so LK-HG02-02.pdf',
    ),
    const DrillHole(
      id: 'drill_hg_03_01',
      siteId: 'site_hg_03',
      code: 'LK-HG03-01',
      name: 'Lo khoan Cao Son 01',
      mineral: 'Than da',
      status: 'Hoan thanh',
      stage: 'Phuc hoi moi truong',
      startDate: '2025-11-10',
      endDate: '2025-11-15',
      coordinateX: '248501.98',
      coordinateY: '1203501.44',
      coordinateZ: '29.6',
      depth: '140.4 m',
      elevation: '+30 m',
      profileDocument: 'Ho so LK-HG03-01.pdf',
    ),
    const DrillHole(
      id: 'drill_hg_03_02',
      siteId: 'site_hg_03',
      code: 'LK-HG03-02',
      name: 'Lo khoan Cao Son 02',
      mineral: 'Than da',
      status: 'Ke hoach',
      stage: 'Phuc hoi moi truong',
      startDate: '2026-04-05',
      endDate: '—',
      coordinateX: '248590.12',
      coordinateY: '1203580.21',
      coordinateZ: '30.1',
      depth: '—',
      elevation: '+30 m',
      profileDocument: 'Ho so LK-HG03-02.pdf',
    ),
  ];

  late final List<ClosurePlan> _closurePlans = [
    const ClosurePlan(
      id: 'plan_mk_01_01',
      siteId: 'site_mk_01',
      code: 'DC-MK01-01',
      name: 'De an dong cua khu khai thac Trung tam',
      projectName: 'Cong trinh phuc hoi bac thai Trung tam',
      status: 'Dang thuc hien',
      stage: 'Giai doan 2025-2027',
      note: 'Tap trung gia co bo taluy va phu xanh mat bang.',
      documents: [
        MineDocument(
          id: 'doc_plan_mk_01_01',
          name: 'Ho so de an dong cua MK01.pdf',
          fileType: 'PDF',
          size: '3.2 MB',
          updatedAt: '2026-01-15',
        ),
      ],
    ),
    const ClosurePlan(
      id: 'plan_mk_02_01',
      siteId: 'site_mk_02',
      code: 'DC-MK02-01',
      name: 'Ke hoach dong cua tam thoi khu Vang Danh',
      projectName: 'Cong trinh thoat nuoc va an toan bo mo',
      status: 'Cho phe duyet',
      stage: 'Giai doan 2026',
      note: 'Ho so dang trinh tham dinh cap tinh.',
      documents: [
        MineDocument(
          id: 'doc_plan_mk_02_01',
          name: 'To trinh phe duyet MK02.pdf',
          fileType: 'PDF',
          size: '1.9 MB',
          updatedAt: '2026-02-09',
        ),
      ],
    ),
    const ClosurePlan(
      id: 'plan_mk_03_01',
      siteId: 'site_mk_03',
      code: 'DC-MK03-01',
      name: 'De an phuc hoi khu Cong Hoa Tay',
      projectName: 'Cong trinh xu ly nuoc mo va phu xanh',
      status: 'Ke hoach',
      stage: 'Giai doan 2027-2028',
      note: 'Du kien trien khai sau khi ket thuc tham do.',
      documents: [
        MineDocument(
          id: 'doc_plan_mk_03_01',
          name: 'Khung de an phuc hoi MK03.docx',
          fileType: 'DOCX',
          size: '0.8 MB',
          updatedAt: '2026-02-21',
        ),
      ],
    ),
    const ClosurePlan(
      id: 'plan_hg_01_01',
      siteId: 'site_hg_01',
      code: 'DC-HG01-01',
      name: 'De an dong cua bo phan mo Nui Beo',
      projectName: 'Cong trinh gia co bo mo va thoat nuoc',
      status: 'Dang thuc hien',
      stage: 'Giai doan 2024-2026',
      note: 'Dang thuc hien cac hang muc an toan khu vuc sat dan cu.',
      documents: [
        MineDocument(
          id: 'doc_plan_hg_01_01',
          name: 'Ban ve ky thuat dong cua HG01.pdf',
          fileType: 'PDF',
          size: '5.1 MB',
          updatedAt: '2026-01-30',
        ),
      ],
    ),
    const ClosurePlan(
      id: 'plan_hg_02_01',
      siteId: 'site_hg_02',
      code: 'DC-HG02-01',
      name: 'Ke hoach dong cua khu Ha Tu so 2',
      projectName: 'Cong trinh cai tao bo thai va trong cay',
      status: 'Cho phe duyet',
      stage: 'Giai doan 2026-2027',
      note: 'Bo sung du toan kinh phi theo yeu cau tham dinh.',
      documents: [
        MineDocument(
          id: 'doc_plan_hg_02_01',
          name: 'Du toan dong cua HG02.xlsx',
          fileType: 'XLSX',
          size: '1.3 MB',
          updatedAt: '2026-02-12',
        ),
      ],
    ),
    const ClosurePlan(
      id: 'plan_hg_03_01',
      siteId: 'site_hg_03',
      code: 'DC-HG03-01',
      name: 'De an phuc hoi sau khai thac Cao Son',
      projectName: 'Cong trinh xu ly moi truong tong the',
      status: 'Dang thuc hien',
      stage: 'Giai doan 2025-2028',
      note: 'Dang theo doi thong so moi truong dinh ky.',
      documents: [
        MineDocument(
          id: 'doc_plan_hg_03_01',
          name: 'Bao cao giam sat moi truong HG03.pdf',
          fileType: 'PDF',
          size: '2.0 MB',
          updatedAt: '2026-02-26',
        ),
      ],
    ),
  ];

  @override
  Future<List<MineRegion>> getMineRegions() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return _regions;
  }

  @override
  Future<List<MineSite>> getMineSitesByRegion(String regionId) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return _sites.where((site) => site.regionId == regionId).toList();
  }

  @override
  Future<MineSite?> getMineSiteById(String siteId) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    for (final site in _sites) {
      if (site.id == siteId) {
        return site;
      }
    }
    return null;
  }

  @override
  Future<List<DrillHole>> getDrillHolesBySite(String siteId) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return _drillHoles.where((hole) => hole.siteId == siteId).toList();
  }

  @override
  Future<DrillHole?> getDrillHoleById(String drillHoleId) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    for (final hole in _drillHoles) {
      if (hole.id == drillHoleId) {
        return hole;
      }
    }
    return null;
  }

  @override
  Future<List<ClosurePlan>> getClosurePlansBySite(String siteId) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return _closurePlans.where((plan) => plan.siteId == siteId).toList();
  }

  @override
  Future<ClosurePlan?> getClosurePlanById(String planId) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    for (final plan in _closurePlans) {
      if (plan.id == planId) {
        return plan;
      }
    }
    return null;
  }
}
