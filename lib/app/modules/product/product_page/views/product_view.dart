import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kreasi_nusantara/app/modules/product/detail_product/controllers/detail_product_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/detail_product/models/detail_model.dart';
import 'package:kreasi_nusantara/app/modules/product/detail_product/views/detail_product_view.dart';
import 'package:kreasi_nusantara/app/modules/product/product_page/controllers/product_view_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/widgets/card_product.dart';
import 'package:kreasi_nusantara/app/modules/product/widgets/category.dart';
import 'package:kreasi_nusantara/shared/widget/form/search_field/search_field.dart';

class ProductView extends GetView<ProductViewController> {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductViewController controller = Get.put(ProductViewController());
    final DetailProductController detailController =
        Get.put(DetailProductController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                QSearchField(
                  label: "Search Product",
                  value: controller.searchController.text,
                  prefixIcon: Icons.search,
                  suffixIcon: null,
                  onChanged: (value) {
                    controller.searchProducts(value);
                  },
                  onSubmitted: (value) {
                    controller.searchProducts(value);
                  },
                ),
                const SizedBox(height: 4),
                GetBuilder<ProductViewController>(
                  builder: (controller) => Category(
                    buttons: controller.buttons,
                    onButtonTap: controller.handleButtonTap,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Hot Sales🔥",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff5D5F5F),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.errorMessage.isNotEmpty) {
                    return Center(child: Text(controller.errorMessage.value));
                  } else if (controller.products.isEmpty) {
                    return const Center(child: Text('No products available.'));
                  } else {
                    return GridView.builder(
                      padding: const EdgeInsets.all(8),
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 16,
                        childAspectRatio: (191 / 310),
                      ),
                      itemCount: controller.products.length,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        final product = controller.products[index];

                        return GestureDetector(
                          onTap: () async {
                            // Fetch detailed product information based on product.id
                            await controller.fetchProductById(product.id);

                            // Navigate to DetailProductView
                            var detailedProduct =
                                controller.detailedProduct.value;

                            if (detailedProduct != null) {
                              Get.to(() => DetailProductView(
                                    product: detailedProduct,
                                    produk: product,
                                    review: detailedProduct.latestReview,
                                    varian: detailedProduct.variants,
                                  ));
                            } else {
                              print('Detailed product data is null');
                              // Handle case when detailedProduct is null (optional)
                            }
                          },
                          child: ProductCard(
                            imageUrl: product.imageUrl,
                            productName: product.productName,
                            originalPrice: product.originalPrice,
                            discountPercentage: product.discountPercentage,
                            discountedPrice: product.discountedPrice,
                            rating: product.rating,
                            totalReviews: product.totalReviews,
                            isChecked: product.isChecked.value,
                            quantity: product.quantity.value,
                            id: product.id,
                          ),
                        );
                      },
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Implement your logic to handle fetching products by category
          // For example, fetch products for 'Kemeja' (category index 1)
          controller.fetchProducts();
        },
        label: const Text('Fetch data'),
        icon: const Icon(Icons.category),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
