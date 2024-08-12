import 'package:get/get.dart';
import 'package:shopzy_grocery_user/data/api/api_checker.dart';
import 'package:shopzy_grocery_user/data/model/body/add_address_body.dart';
import 'package:shopzy_grocery_user/data/model/response/address_model.dart';
import 'package:shopzy_grocery_user/data/model/response/response_model.dart';
import 'package:shopzy_grocery_user/data/repository/address_repo.dart';


class AddressController extends GetxController implements GetxService{
  final AddressRepo addressRepo;

  AddressController({required this.addressRepo});



  List<Data>? _data;
   bool _isLoading = false;

  List<Data>? get data => _data;
  bool get isLoading => _isLoading;



  Future<void> showAddress() async{
    _data = null;
    Response response = await addressRepo.showAddress();
    if(response.statusCode == 200){
      _data = [];
      _data?.addAll(AddressModel.fromJson(response.body).addresses!.data!);
    }else{
      ApiChecker.checkApi(response);
    }
    update();

  }

  Future<ResponseModel> addAdress(AddAddressBody addAddressBody) async {
    _isLoading = true;
    update();
    Response response = await addressRepo.addAdrees(addAddressBody);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText);
    }
    _isLoading = false;
    update();
    return responseModel;
  }


  Future<ResponseModel> removeAddress(int id, int index) async {
    Response response = await addressRepo.removeAddress(id);
    ResponseModel _responseModel;
    if (response.statusCode == 200) {
      _data?.removeAt(index);
      _responseModel = ResponseModel(true, response.body['message']);
    } else {
      _responseModel = ResponseModel(false, response.statusText);
    }
    update();
    return _responseModel;
  }


}