import 'package:flutter/cupertino.dart';
import 'package:root_technologies/Modal/carousel_modal.dart';
import 'package:root_technologies/Modal/category_modal.dart';
import '../Helper/api_helper.dart';
import '../Modal/category_wise_modal.dart';

class ProProvider extends ChangeNotifier {
  CategoryWiseModal? categoryWiseModal;
  List<CarouselModal> carouselModal = [];
  CategoryModal? categoryModal;
  ApiHelper apiHelper = ApiHelper();

  Future<CategoryWiseModal?> fetchUsers(String categoryId) async {
    Map<String, dynamic> data = await apiHelper.fetchApiData(categoryId);
    categoryWiseModal = CategoryWiseModal.fromJson(data);
    return categoryWiseModal;
  }

  Future<List<CarouselModal>> fetchCarousel() async {
    List data = await apiHelper.fetchApiDataOfCarousel();
    carouselModal = data.map((e) => CarouselModal.fromJson(e),).toList();
    return carouselModal;
  }

  Future<CategoryModal?> fetchCategories() async {
    Map<String, dynamic> data = await apiHelper.fetchApiDataOfCategories();
    categoryModal = CategoryModal.fromJson(data);
    return categoryModal;
  }
}
