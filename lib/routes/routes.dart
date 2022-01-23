import 'package:practical_task/view/detail/DetailScreen.dart';
import 'package:practical_task/view/search/search_screen.dart';

class Routes{
  static const String searchScreen = '/search_screen';
  static const String detailScreen = '/detail_screen';

  static final routes = {
    searchScreen : (context) => SearchScreen(),
    detailScreen:(context) => DetailScreen(),

  };
}