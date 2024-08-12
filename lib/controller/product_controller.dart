import 'package:shopzy_grocery_user/data/api/api_checker.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/data/model/response/featuredProduct_model.dart';
import 'package:shopzy_grocery_user/data/model/response/popularProduct_model.dart';
import 'package:shopzy_grocery_user/data/model/response/reommendedProduct_model.dart';
import 'package:shopzy_grocery_user/data/repository/product_repo.dart';

class ProductController extends GetxController implements GetxService {
  final ProductRepo productRepo;
  ProductController({required this.productRepo});


  List<ProductsList>? _featuredProductsList;
  int _currentIndex = 0;
  bool _isLoading = false;
  List<ReocommedProducts>? _recommendProductsList;
  List<PopularProduct>? _popularProducts;


  List<ReocommedProducts>? get recommendProductsList => _recommendProductsList;
  List<PopularProduct>? get popularProducts => _popularProducts;
  bool get isLoading => _isLoading;
  int get currentIndex => _currentIndex;

  List<ProductsList>? get featuredProductsList => _featuredProductsList;


  Future<void> getFeatProductList(bool reload) async {
    _isLoading = true;
    update();
    Response response = await productRepo.getRecommendProductList();
    if(response.statusCode==200){
      _featuredProductsList = [];
      _featuredProductsList!.addAll(FeaturedProductModel.fromJson(response.body).products!);
    }else{
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }

  Future<void> getRecomProductList(bool reload) async {
    _isLoading = true;
  update();
    Response response = await productRepo.getRecommendProductList();
    if(response.statusCode==200){
      _recommendProductsList = [];
     // _recommendProductsList=null;
      _recommendProductsList!.addAll(RecommedProductModel.fromJson(response.body).products!);
    }else{
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }

  Future<void> getPopularProductList(bool reload) async {
    _isLoading = true;
    update();
    Response response = await productRepo.getPopularProductList();
    if(response.statusCode==200){
      _popularProducts = [];
     // _popularProducts=null;
      _popularProducts!.addAll(PopularProductModel.fromJson(response.body).popularProduct!);
    }else{
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }

  void setCurrentIndex(int index,{ bool notify = false}) {
    _currentIndex = index;
    if (notify) {
      update();
    }
  }
}
