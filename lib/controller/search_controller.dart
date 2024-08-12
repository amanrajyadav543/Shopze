import 'package:get/get.dart';
import 'package:shopzy_grocery_user/data/api/api_checker.dart';
import 'package:shopzy_grocery_user/data/repository/search_repo.dart';

class SearchControllerr extends GetxController implements GetxService {
  final SearchRepo searchRepo;

  SearchControllerr({required this.searchRepo});


  String _searchText = '';
  double _lowerValue = 0;
  double _upperValue = 0;
  List<String> _historyList = [];
  bool _isSearchMode = true;
  String get searchText => _searchText;

  double get lowerValue => _lowerValue;

  double get upperValue => _upperValue;

  bool get isSearchMode => _isSearchMode;

  List<String> get historyList => _historyList;

  void setSearchMode(bool isSearchMode) {
    _isSearchMode = isSearchMode;
    if (isSearchMode) {
      _searchText = '';
      _upperValue = 0;
      _lowerValue = 0;
    }
    update();
  }

  void setLowerAndUpperValue(double lower, double upper) {
    _lowerValue = lower;
    _upperValue = upper;
    update();
  }

  void setSearchText(String text) {
    _searchText = text;
    update();
  }

  void searchData(String query) async {
    Response response = await searchRepo.getSearchData(query);
    if (response.statusCode == 200) {
      if (query.isEmpty) {}
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }
}
//
//
// void removeHistory(int index) {
//   _historyList.removeAt(index);
//   searchRepo.saveSearchHistory(_historyList);
//   update();
// }
//
