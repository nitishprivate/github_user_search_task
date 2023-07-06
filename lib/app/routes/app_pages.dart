import 'package:get/get.dart';

import '../modules/HomePage/bindings/home_page_binding.dart';
import '../modules/HomePage/views/home_page_view.dart';
import '../modules/SearchPage/bindings/search_page_binding.dart';
import '../modules/SearchPage/views/search_page_view.dart';
import '../modules/UnknownRoute/bindings/unknown_route_binding.dart';
import '../modules/UnknownRoute/views/unknown_route_view.dart';
import '../modules/UserDetail/bindings/user_detail_binding.dart';
import '../modules/UserDetail/views/user_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.UNKNOWN_ROUTE,
      page: () => const UnknownRouteView(),
      binding: UnknownRouteBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_PAGE,
      page: () => const SearchPageView(),
      binding: SearchPageBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => const HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.USER_DETAIL,
      page: () => const UserDetailView(),
      binding: UserDetailBinding(),
    ),
  ];
}
