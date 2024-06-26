import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kreasi_nusantara/models/article_model/article_model.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';
import 'package:kreasi_nusantara/shared/util/dialog/show_comment_bottom_sheet/show_comment_bottom_sheet.dart';
import 'package:kreasi_nusantara/shared/util/type_extension/date_extension.dart';
import 'package:kreasi_nusantara/shared/util/type_extension/dynamic_extension.dart';
import 'package:kreasi_nusantara/shared/widget/list/detail_view.dart';

import '../controllers/article_detail_controller.dart';

class ArticleDetailView extends GetView<ArticleDetailController> {
  final Map item;
  const ArticleDetailView({
    super.key,
    required this.item,
  });
  @override
  Widget build(BuildContext context) {
    return QDetailView(
      endpoint: "articles",
      id: item["id"],
      itemBuilder: (detail) {
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
                      item["image"] ??
                          "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                    ),
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
                            detail["created_at"].toString().date?.edMMMy ?? "-",
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
                            detail["title"],
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
                    CircleAvatar(
                      radius: 14.0,
                      backgroundImage: NetworkImage(
                        item["author"]?["image_url"] ??
                            "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                      ), // Ganti dengan path gambar profil
                    ),
                    const SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item["author"]?["username"] ?? "-", // Nama pengguna
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
                          '${item["likes_count"] ?? 0}',
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
                          '${item["comments_count"] ?? 0}',
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
                      detail["title"],
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      detail["content"] ?? "-",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: secondaryTextColor,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
