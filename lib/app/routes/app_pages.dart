import 'package:get/get.dart';

import '../modules/Agent/bindings/agent_binding.dart';
import '../modules/Agent/views/agent_view.dart';
import '../modules/Buddies/bindings/buddies_binding.dart';
import '../modules/Buddies/views/buddies_view.dart';
import '../modules/Map/bindings/map_binding.dart';
import '../modules/Map/views/map_view.dart';
import '../modules/PlayerCard/bindings/player_card_binding.dart';
import '../modules/PlayerCard/views/player_card_view.dart';
import '../modules/Weapon/bindings/weapon_binding.dart';
import '../modules/Weapon/views/weapon_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AGENT,
      page: () => const AgentView(),
      binding: AgentBinding(),
    ),
    GetPage(
      name: _Paths.BUDDIES,
      page: () => const BuddiesView(),
      binding: BuddiesBinding(),
    ),
    GetPage(
      name: _Paths.MAP,
      page: () => const MapView(),
      binding: MapBinding(),
    ),
    GetPage(
      name: _Paths.WEAPON,
      page: () => const WeaponView(),
      binding: WeaponBinding(),
    ),
    GetPage(
      name: _Paths.PLAYER_CARD,
      page: () => const PlayerCardView(),
      binding: PlayerCardBinding(),
    ),
  ];
}
