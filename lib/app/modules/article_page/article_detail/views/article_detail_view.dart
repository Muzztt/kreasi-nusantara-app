import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kreasi_nusantara/models/article_model/article_model.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';
import 'package:kreasi_nusantara/shared/util/dialog/show_comment_bottom_sheet/show_comment_bottom_sheet.dart';

import '../controllers/article_detail_controller.dart';

class ArticleDetailView extends GetView<ArticleDetailController> {
  const ArticleDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    final Article article = Get.arguments;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: () => Get.back(),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
              ),
            ),
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 240.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    article.image ?? "assets/images/elon_batik.jpeg"),
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
                        DateFormat('EEEE, dd MMM yyyy')
                            .format(article.createdAt),
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
                        article.title,
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
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 14.0,
                  backgroundImage: AssetImage(
                      'assets/images/person.png'), // Ganti dengan path gambar profil
                ),
                const SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Michael Yoo', // Nama pengguna
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      '10 Hours Ago', // Waktu
                      style: TextStyle(
                        color: secondaryTextColor,
                        fontSize: 10.0,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.favorite_border,
                      color: primaryColor,
                    ),
                    Text(
                      '8054',
                      style: TextStyle(
                        fontSize: 12,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    InkWell(
                      onTap: () {
                        showCommentsBottomSheet(context);
                      },
                      child: Icon(
                        Icons.comment,
                        color: primaryColor,
                        size: 24.0,
                      ),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      '114',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Icon(
                      Icons.send,
                      color: primaryColor,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      '235',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  article.content ?? "-",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: secondaryTextColor,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
