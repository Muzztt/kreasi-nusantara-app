import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kreasi_nusantara/app/modules/product/cart/controllers/cart_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/cart/models/cart_model.dart';

class ChartCard extends StatelessWidget {
  final CartItem cartItem;

  const ChartCard({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: cartItem.isChecked.value,
                  onChanged: (value) {
                    cartController.toggleCheckbox(cartItem);
                  },
                ),
                const SizedBox(width: 6),
                Container(
                  width: 74,
                  height: 75,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(cartItem.productImage),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      cartItem.productName.length <= 12
                          ? cartItem.productName
                          : '${cartItem.productName.substring(0, 10)}...',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        height: 1.3,
                        color: const Color(0xFF980019),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Column(
                      children: [
                        Text(
                          'IDR ${cartItem.originalPrice}',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                            height: 0.8,
                            color: const Color(0xFF797979),
                            decorationColor: const Color(0xFF797979),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'IDR ${cartItem.discountPrice}',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            height: 0.8,
                            color: const Color(0xFF980019),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      ' ${cartItem.size}',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        height: 0.8,
                        color: const Color(0xFF797979),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (cartItem.quantity.value > 1) {
                        cartItem.quantity.value--;
                        await cartController.updateCartItemQuantity(
                            cartItem.cartItemId, cartItem.quantity.value);
                      }
                    },
                    child: Container(
                      height: 32,
                      width: 26,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 199, 199, 199),
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "-",
                          style: TextStyle(color: Color(0xff980019)),
                        ),
                      ),
                    ),
                  ),
                  Obx(() => Container(
                        height: 32,
                        width: 26,
                        decoration: const BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              color: Color.fromARGB(255, 199, 199, 199),
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            cartItem.quantity.value.toString(),
                            style: const TextStyle(color: Color(0xff980019)),
                          ),
                        ),
                      )),
                  GestureDetector(
                    onTap: () async {
                      cartItem.quantity.value++;
                      await cartController.updateCartItemQuantity(
                          cartItem.cartItemId, cartItem.quantity.value);
                    },
                    child: Container(
                      height: 32,
                      width: 26,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 199, 199, 199),
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "+",
                          style: TextStyle(color: Color(0xff980019)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () async {
                  await cartController.removeCartItem(cartItem.cartItemId);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.delete,
                    size: 28.0,
                    color: Color(0xff980019),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
