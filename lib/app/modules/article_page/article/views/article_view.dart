import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kreasi_nusantara/app/modules/article_page/article_detail/views/article_detail_view.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';
import 'package:kreasi_nusantara/shared/widget/form/button/action_button.dart';
import '../controllers/article_controller.dart';

class ArticleView extends GetView<ArticleController> {
  const ArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    final ArticleController articleController = Get.put(ArticleController());

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_rounded,
                size: 24.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (articleController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (articleController.articles.isEmpty) {
          return const Center(child: Text('No articles available'));
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 240.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/elon_batik.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.2),
                    ),
                  ),
                  Positioned(
                    bottom: 15.0,
                    left: 16.0,
                    right: 16.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'News of The Day',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black.withOpacity(0.5),
                                offset: const Offset(2.0, 2.0),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Elon Musk Menggunakan Batik',
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black.withOpacity(0.5),
                                offset: const Offset(2.0, 2.0),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        QActionButton(
                          label: "Read More",
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: articleController.articles.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                clipBehavior: Clip.none,
                itemBuilder: (context, index) {
                  var article = articleController.articles[index];
                  return Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(6.0),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    article.title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    DateFormat('EEEE, dd MMM yyyy')
                                        .format(article.createdAt),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  QActionButton(
                                      label: "Read More",
                                      onPressed: () {
                                        articleController
                                            .fetchArticleById(article.id);
                                        Get.to(
                                          const ArticleDetailView(),
                                          arguments: article,
                                        );
                                      }),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryColor,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  article.image ??
                                      'assets/images/default_image.png',
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
