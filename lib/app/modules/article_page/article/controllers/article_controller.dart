import 'package:get/get.dart';
import 'package:kreasi_nusantara/models/article_model/article_model.dart';
import 'package:kreasi_nusantara/service/article_service/article_service.dart';

class ArticleController extends GetxController {
  final articles = <Article>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchArticles();
  }

  void fetchArticles() async {
    try {
      isLoading(true);
      final data = await ArticleService().get();
      articles.value =
          data.map((article) => Article.fromJson(article)).toList();
    } finally {
      isLoading(false);
    }
  }

  void fetchArticleById(String id) async {
    try {
      isLoading(true);
      final data = await ArticleService().getById(id);
      // Tambahkan article ke daftar articles jika diperlukan
      // Misalnya, jika ingin menambahkannya ke daftar articles saat ini:
      // articles.add(data);
      // Namun, ini tergantung pada bagaimana Anda ingin mengelolanya.
    } finally {
      isLoading(false);
    }
  }
}
