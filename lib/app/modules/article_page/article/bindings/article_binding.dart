import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/article_page/article/controllers/article_controller.dart';

class ArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArticleController>(() => ArticleController());
  }
}
