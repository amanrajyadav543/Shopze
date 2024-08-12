import 'package:get/get.dart';
import 'package:shopzy_grocery_user/data/api/api_checker.dart';
import 'package:shopzy_grocery_user/data/model/response/category_model.dart';
import 'package:shopzy_grocery_user/data/model/response/ProductsBySubcategory_model.dart';
import 'package:shopzy_grocery_user/data/model/response/productDetails_model.dart';
import 'package:shopzy_grocery_user/data/model/response/subCategory_model.dart';
import 'package:shopzy_grocery_user/data/model/response/topCategory_model.dart';
import 'package:shopzy_grocery_user/data/repository/category_repo.dart';

class CategoryController extends GetxController implements GetxService {
  final CategoryRepo categoryRepo;
  CategoryController({required this.categoryRepo});

  List<Category>? _categoryList;
  List<Product>? _productList;
   List<GetProReview>? _getProReview;
  ProductDetails? _productDetails;
 // ProductDetailModel? _productDetailModel;

  List<TopCategoryList>? _categoryData;
  List<Subcategory>? _subCategoryData;

   List<Category>? get categoryList => _categoryList;
   List<Product>? get productList => _productList;
   ProductDetails? get productDetails=>_productDetails;
  //ProductDetailModel? get productDetailModel=>productDetailModel;
    List<GetProReview>? get getProReview => _getProReview;

  List<TopCategoryList>? get categoryData => _categoryData;
  List<Subcategory>? get subCategoryData => _subCategoryData;

  Future<void> getTopCategoryList(bool reload) async {
    _categoryData = null;
    Response response = await categoryRepo.getTopCategoryList();
    if (response.statusCode == 200) {
      _categoryData = [];
      _categoryData!.addAll(TopCategoryModel.fromJson(response.body).category!);
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }
  Future<void> getCategoryList(int offset) async {
    _categoryList = null;
    Response response = await categoryRepo.getCategoryList(offset);
    if (response.statusCode == 200) {
      _categoryList = [];
      _categoryList!.addAll(CategoryModel.fromJson(response.body).category!);
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }


  Future<void> getSubCategoryList(int offset,int categoriesId) async {
    _subCategoryData = null;
    Response response = await categoryRepo.getSubCategoryList(offset,categoriesId);
    if (response.statusCode == 200) {
      _subCategoryData = [];
      _subCategoryData!.addAll(SubcategoryModel.fromJson(response.body).subcategory!);
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  Future<void> getProductBySubCategory(int offset,int subcategoryId) async {
    _productList = null;
    Response response = await categoryRepo.getProductSubCategoryList(offset,subcategoryId);
    if (response.statusCode == 200) {
      _productList = [];
      _productList!.addAll(ProductsBySubcategoryModel.fromJson(response.body).subCategoryProduct!);
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }


  Future<ProductDetails?> getProductDetails(int offset,int productId) async {
    _productDetails=null;
    _getProReview=null;
    Response response = await categoryRepo.getProductDetails(offset,productId);
    if (response.statusCode == 200) {
      _productDetails;
      _getProReview = [];
      _productDetails = ProductDetailModel.fromJson(response.body).productDetails;
      _getProReview!.addAll(ProductDetailModel.fromJson(response.body).getProReview!);
      return productDetails;
    } else {
      ApiChecker.checkApi(response);
    }
    update();
    return null;
  }


}
