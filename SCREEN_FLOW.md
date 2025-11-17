# Luồng Màn Hình Ứng Dụng Quản Lý Khoáng Sản

## Tổng Quan
Tài liệu này mô tả luồng điều hướng các màn hình trong ứng dụng quản lý khoáng sản, được thiết kế với UX thân thiện và hợp lý.

---

## 1. LUỒNG KHỞI ĐỘNG & XÁC THỰC

```
┌─────────────┐
│   Splash    │  → Kiểm tra trạng thái đăng nhập
│   Screen    │     - Đã đăng nhập → Main Screen
└──────┬──────┘     - Chưa đăng nhập → Login Screen
       │
       ├─→ [Đã đăng nhập] ──→ Main Screen
       │
       └─→ [Chưa đăng nhập] ──→ Login Screen
```

### 1.1. Splash Screen (`/splash`)
- **Mục đích**: Màn hình khởi động, kiểm tra trạng thái đăng nhập
- **Hành động**: 
  - Kiểm tra token/session
  - Điều hướng tự động đến Login hoặc Main Screen

### 1.2. Login Screen (`/login`)
- **Mục đích**: Đăng nhập vào hệ thống
- **Hành động sau đăng nhập**: 
  - Chuyển đến Main Screen
  - Lưu thông tin đăng nhập

---

## 2. LUỒNG MÀN HÌNH CHÍNH (Main Screen)

```
┌─────────────────────────────────────────────────────────┐
│                    Main Screen                          │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐ │
│  │   Home   │ │   Map    │ │Mine List │ │ Account  │ │
│  │  (Tab 0) │ │ (Tab 1)  │ │ (Tab 2)  │ │ (Tab 3)  │ │
│  └────┬─────┘ └────┬─────┘ └────┬─────┘ └────┬─────┘ │
└───────┼─────────────┼────────────┼────────────┼────────┘
        │             │            │            │
        ▼             ▼            ▼            ▼
```

### 2.1. Home Screen (Tab 0)
**Các màn hình có thể truy cập từ Home:**

```
Home Screen
├─→ Notification Management (icon thông báo)
├─→ Alert List (widget trên trang)
├─→ Progress Screen (widget trên trang)
└─→ Report Widget (hiển thị báo cáo)
```

**Chi tiết điều hướng:**
- **Notification Management** (`/notification_management`)
  - Xem và quản lý thông báo
  - Có thể quay lại Home
  
- **Alert List** (`/alert_list`)
  - Xem danh sách cảnh báo
  - Click vào alert card để xem chi tiết:
    - `licenseExpired` → Project Detail Screen
    - `mineClosurePlan` → Closure Plan Detail Screen
  
- **Progress Screen** (`/progress`)
  - Xem tiến độ công việc
  - Click vào progress card → Project Detail Screen
  - Từ Project Detail có thể chuyển đến Mine 3D

### 2.2. Map Screen (Tab 1) - Show Construction Map
**Các màn hình có thể truy cập từ Map:**

```
Show Construction Map Screen
├─→ Project Detail (khi click vào marker dự án trên bản đồ)
│   └─→ [Button "Xem mô hình 3D"] ──→ Mine 3D Screen
│
├─→ Mine 3D (từ FloatingActionButton/Menu)
│   └─→ [Button "Chi tiết dự án"] ──→ Project Detail Screen
│
└─→ Closure Plan Detail (khi click vào marker kế hoạch đóng cửa)
    ├─→ [Button "Xem chi tiết dự án"] ──→ Project Detail Screen
    └─→ [Button "Xem mô hình 3D"] ──→ Mine 3D Screen
```

**Chi tiết điều hướng:**
- **Project Detail** (`/project_detail`)
  - Xem thông tin chi tiết dự án
  - Có button "Xem mô hình 3D" để chuyển sang Mine 3D
  - Có thể quay lại Map
  
- **Mine 3D** (`/mine_3d`)
  - Xem mô hình 3D của mỏ
  - Có button "Chi tiết dự án" để chuyển sang Project Detail
  - Tương tác với mô hình 3D
  
- **Closure Plan Detail** (`/closure_plan_detail`)
  - Xem chi tiết kế hoạch đóng cửa mỏ
  - Có buttons để chuyển đến Project Detail và Mine 3D

### 2.3. Mine List Screen (Tab 2)
**Các màn hình có thể truy cập từ Mine List:**

```
Mine List Screen
├─→ Mine 3D (xem mô hình 3D của mỏ được chọn)
├─→ Project Detail (xem chi tiết dự án mỏ)
├─→ Drill Hole List (danh sách lỗ khoan)
└─→ Closure Plan Detail (kế hoạch đóng cửa)
```

**Chi tiết điều hướng:**
- **Mine 3D** (`/mine_3d`)
  - Xem mô hình 3D của mỏ được chọn
  - Có thể quay lại Mine List
  
- **Project Detail** (`/project_detail`)
  - Xem thông tin chi tiết dự án mỏ
  - Có thể quay lại Mine List
  
- **Drill Hole List** (`/drill_hole_list`)
  - Xem danh sách lỗ khoan của mỏ
  - Có thể quay lại Mine List
  
- **Closure Plan Detail** (`/closure_plan_detail`)
  - Xem chi tiết kế hoạch đóng cửa mỏ

### 2.4. Account Screen (Tab 3)
**Các màn hình có thể truy cập từ Account:**

```
Account Info Screen
├─→ Change Password (đổi mật khẩu)
└─→ Logout (đăng xuất)
```

**Chi tiết điều hướng:**
- **Change Password** (`/change_password`)
  - Đổi mật khẩu tài khoản
  - Quay lại Account sau khi đổi thành công
  
- **Logout** (`/logout`)
  - Đăng xuất khỏi hệ thống
  - Quay về Login Screen

---

## 3. SƠ ĐỒ LUỒNG ĐIỀU HƯỚNG CHI TIẾT

### 3.1. Luồng Khám Phá Mỏ (Mine Exploration Flow)

```
Mine List Screen
    │
    ├─→ [Click item mỏ] ──→ Mine 3D Screen
    │                      │
    │                      ├─→ Xem mô hình 3D
    │                      ├─→ [Button "Chi tiết dự án"] ──→ Project Detail Screen
    │                      │      │
    │                      │      ├─→ Xem thông tin dự án
    │                      │      ├─→ [Button "Xem mô hình 3D"] ──→ Mine 3D Screen (quay lại)
    │                      │      └─→ Quay lại Mine 3D
    │                      │
    │                      └─→ Quay lại Mine List
    │
    ├─→ [Menu "Chi tiết dự án"] ──→ Project Detail Screen
    │                       │
    │                       ├─→ Xem thông tin dự án
    │                       ├─→ [Button "Xem mô hình 3D"] ──→ Mine 3D Screen
    │                       └─→ Quay lại Mine List
    │
    ├─→ [Menu "Xem lỗ khoan"] ──→ Drill Hole List Screen
    │                         │
    │                         ├─→ [Click item lỗ khoan] ──→ Mine 3D Screen (highlight lỗ khoan)
    │                         ├─→ [Button "Chi tiết mỏ"] ──→ Project Detail Screen
    │                         └─→ Quay lại Mine List
    │
    └─→ [Menu "Kế hoạch đóng cửa"] ──→ Closure Plan Detail Screen
                                        │
                                        ├─→ [Button "Xem chi tiết dự án"] ──→ Project Detail Screen
                                        ├─→ [Button "Xem mô hình 3D"] ──→ Mine 3D Screen
                                        └─→ Quay lại Mine List
```

### 3.2. Luồng Quản Lý Cảnh Báo (Alert Management Flow)

```
Home Screen
    │
    └─→ Alert List Widget ──→ Alert List Screen
                                    │
                                    ├─→ [Click alert card]
                                    │   ├─→ licenseExpired → Project Detail Screen
                                    │   └─→ mineClosurePlan → Closure Plan Detail Screen
                                    │
                                    ├─→ Xem danh sách cảnh báo
                                    ├─→ Lọc cảnh báo
                                    └─→ Quay lại Home
```

### 3.3. Luồng Theo Dõi Tiến Độ (Progress Tracking Flow)

```
Home Screen
    │
    └─→ Progress Widget ──→ Progress Screen
                                  │
                                  ├─→ [Click progress card] ──→ Project Detail Screen
                                  │      │
                                  │      ├─→ Xem thông tin dự án
                                  │      ├─→ [Button "Xem mô hình 3D"] ──→ Mine 3D Screen
                                  │      └─→ Quay lại Progress
                                  │
                                  ├─→ Xem tiến độ tổng quan
                                  └─→ Quay lại Home
```

### 3.4. Luồng Quản Lý Thông Báo (Notification Flow)

```
Home Screen (icon thông báo)
    │
    └─→ Notification Management Screen
                │
                ├─→ Xem danh sách thông báo
                ├─→ Đánh dấu đã đọc
                ├─→ Xóa thông báo
                └─→ Quay lại Home
```

### 3.5. Luồng Quản Lý Tài Khoản (Account Management Flow)

```
Account Info Screen
    │
    ├─→ [Đổi mật khẩu] ──→ Change Password Screen
    │                         │
    │                         ├─→ Nhập mật khẩu cũ
    │                         ├─→ Nhập mật khẩu mới
    │                         ├─→ Xác nhận mật khẩu mới
    │                         └─→ Quay lại Account (sau khi thành công)
    │
    └─→ [Đăng xuất] ──→ Logout ──→ Login Screen
```

---

## 4. NGUYÊN TẮC ĐIỀU HƯỚNG UX

### 4.1. Navigation Patterns
- **Bottom Navigation Bar**: Sử dụng cho 4 tab chính (Home, Map, Mine List, Account)
- **Stack Navigation**: Sử dụng cho các màn hình chi tiết (push/pop)
- **Back Button**: Luôn có nút quay lại ở AppBar cho các màn hình con

### 4.2. User Flow Best Practices
1. **Độ sâu điều hướng tối đa**: Không quá 3-4 cấp
2. **Breadcrumb**: Hiển thị vị trí hiện tại trong hệ thống
3. **Quick Actions**: Các hành động thường dùng dễ truy cập
4. **Consistent Back Navigation**: Luôn có cách quay lại màn hình trước

### 4.3. Screen Transitions
- **Smooth Transitions**: Sử dụng animation mượt mà giữa các màn hình
- **Loading States**: Hiển thị loading khi chuyển màn hình có dữ liệu
- **Error Handling**: Xử lý lỗi và hiển thị thông báo phù hợp

---

## 5. MẪU ĐIỀU HƯỚNG ĐIỂN HÌNH

### 5.1. Scenario: Người dùng muốn xem chi tiết một mỏ

```
1. Main Screen (Tab: Mine List)
   ↓
2. Mine List Screen
   ↓ [Chọn mỏ từ danh sách]
3. Mine 3D Screen
   ↓ [Xem mô hình 3D]
   ↓ [Back button]
4. Mine List Screen (quay lại)
```

### 5.2. Scenario: Người dùng muốn xem cảnh báo và tiến độ

```
1. Main Screen (Tab: Home)
   ↓
2. Home Screen
   ↓ [Scroll xuống Alert List Widget]
3. Alert List Screen (trong widget)
   ↓ [Back hoặc scroll lên]
4. Home Screen
   ↓ [Scroll xuống Progress Widget]
5. Progress Screen (trong widget)
```

### 5.3. Scenario: Người dùng muốn xem dự án trên bản đồ

```
1. Main Screen (Tab: Map)
   ↓
2. Show Construction Map Screen
   ↓ [Click vào marker dự án trên bản đồ]
3. Project Detail Screen
   ↓ [Back button]
4. Show Construction Map Screen (quay lại)
```

---

## 6. TÓM TẮT CÁC MÀN HÌNH

| Màn Hình | Route | Mô Tả | Truy Cập Từ |
|----------|-------|-------|-------------|
| Splash | `/splash` | Màn hình khởi động | Entry point |
| Login | `/login` | Đăng nhập | Splash (nếu chưa đăng nhập) |
| Main | `/main` | Màn hình chính với bottom nav | Login, Splash |
| Home | (Tab trong Main) | Trang chủ với widgets | Main Screen |
| Show Construction Map | (Tab trong Main) | Bản đồ xây dựng | Main Screen |
| Mine List | (Tab trong Main) | Danh sách mỏ | Main Screen |
| Account Info | (Tab trong Main) | Thông tin tài khoản | Main Screen |
| Mine 3D | `/mine_3d` | Mô hình 3D mỏ | Mine List, Map, Project Detail, Drill Hole List |
| Alert List | `/alert_list` | Danh sách cảnh báo | Home |
| Progress | `/progress` | Tiến độ công việc | Home |
| Project Detail | `/project_detail` | Chi tiết dự án | Map, Mine List, Progress, Alert List, Mine 3D, Closure Plan Detail, Drill Hole List |
| Notification Management | `/notification_management` | Quản lý thông báo | Home |
| Closure Plan Detail | `/closure_plan_detail` | Chi tiết kế hoạch đóng cửa | Map, Mine List, Alert List |
| Drill Hole List | `/drill_hole_list` | Danh sách lỗ khoan | Mine List |
| Change Password | `/change_password` | Đổi mật khẩu | Account Info |
| Logout | `/logout` | Đăng xuất | Account Info |

---

## 7. KHUYẾN NGHỊ CẢI THIỆN UX

### 7.1. Navigation Improvements
- Thêm **Search** trong Mine List để tìm kiếm nhanh
- Thêm **Filter** trong Alert List để lọc cảnh báo
- Thêm **Favorites** để đánh dấu mỏ yêu thích
- Thêm **Recent Views** để xem lại các mỏ đã xem gần đây

### 7.2. Quick Actions
- Thêm **Floating Action Button** trong Home để tạo cảnh báo mới
- Thêm **Shortcuts** trong Account để truy cập nhanh các tính năng
- Thêm **Swipe Actions** trong danh sách để thao tác nhanh

### 7.3. Data Visualization
- Cải thiện **Map Screen** với các layer khác nhau
- Thêm **Charts** trong Progress Screen
- Thêm **Timeline** trong Project Detail

---

## 8. CÁC KẾT NỐI LIÊN KẾT GIỮA MÀN HÌNH CHI TIẾT

### 8.1. Liên Kết Hai Chiều Project Detail ↔ Mine 3D

```
Project Detail Screen
    │
    └─→ [Button "Xem mô hình 3D"] ──→ Mine 3D Screen
                                        │
                                        └─→ [Button "Chi tiết dự án"] ──→ Project Detail Screen (quay lại)
```

### 8.2. Liên Kết Từ Closure Plan Detail

```
Closure Plan Detail Screen
    │
    ├─→ [Button "Xem chi tiết dự án"] ──→ Project Detail Screen
    │                                       │
    │                                       └─→ [Button "Xem mô hình 3D"] ──→ Mine 3D Screen
    │
    └─→ [Button "Xem mô hình 3D"] ──→ Mine 3D Screen
                                        │
                                        └─→ [Button "Chi tiết dự án"] ──→ Project Detail Screen
```

### 8.3. Liên Kết Từ Drill Hole List

```
Drill Hole List Screen
    │
    ├─→ [Click item lỗ khoan] ──→ Mine 3D Screen (highlight lỗ khoan)
    │                               │
    │                               └─→ [Button "Chi tiết dự án"] ──→ Project Detail Screen
    │
    └─→ [Button "Chi tiết mỏ" trong AppBar] ──→ Project Detail Screen
```

### 8.4. Liên Kết Từ Alert List

```
Alert List Screen
    │
    ├─→ [Click alert: licenseExpired] ──→ Project Detail Screen
    │                                       │
    │                                       └─→ [Button "Xem mô hình 3D"] ──→ Mine 3D Screen
    │
    └─→ [Click alert: mineClosurePlan] ──→ Closure Plan Detail Screen
                                              │
                                              ├─→ [Button "Xem chi tiết dự án"] ──→ Project Detail Screen
                                              └─→ [Button "Xem mô hình 3D"] ──→ Mine 3D Screen
```

### 8.5. Liên Kết Từ Progress Screen

```
Progress Screen
    │
    └─→ [Click progress card] ──→ Project Detail Screen
                                    │
                                    ├─→ Xem thông tin dự án
                                    ├─→ [Button "Xem mô hình 3D"] ──→ Mine 3D Screen
                                    └─→ Quay lại Progress
```

---

## 9. LƯU Ý VỀ CÁC KẾT NỐI CẦN TRIỂN KHAI

⚠️ **Các kết nối được mô tả ở trên là đề xuất UX. Một số kết nối có thể chưa được triển khai trong code.**

Xem file **MISSING_NAVIGATION_CONNECTIONS.md** để biết:
- Chi tiết các kết nối còn thiếu
- Hướng dẫn triển khai cụ thể
- Code examples cho từng kết nối
- Checklist triển khai

---

*Tài liệu này được tạo dựa trên cấu trúc route trong `lib/config/routes/router.dart`*

