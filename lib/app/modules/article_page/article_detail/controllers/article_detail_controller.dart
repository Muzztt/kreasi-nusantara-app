import 'package:get/get.dart';
import 'package:kreasi_nusantara/models/article_model/article_model.dart';
import 'package:kreasi_nusantara/service/article_service/article_service.dart';

class ArticleDetailController extends GetxController {
  var article = Article(
    id: '',
    title: '',
    image: '',
    content: '',
    createdAt: DateTime.now(),
  ).obs;
  var isLoading = false.obs;

  void fetchArticleById(String id) async {
    isLoading(true);
    try {
      var result = await ArticleService().getById(id);
      article.value = Article.fromJson(result);
    } finally {
      isLoading(false);
    }
  }
}
