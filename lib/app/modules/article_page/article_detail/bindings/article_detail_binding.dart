import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/article_page/article_detail/controllers/article_detail_controller.dart';

class ArticleDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArticleDetailController>(() => ArticleDetailController());
  }
}
