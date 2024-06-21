part of 'constants.dart';

class ButtonCollections {
  static ElevatedButton primaryButtonCard = ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorCollections.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
    onPressed: () {},
    child: const Padding(
      padding: EdgeInsets.all(PaddingCollections.paddingButtonLarge),
      child: Text(
        'Primary Button',
        style: TextStyle(
          color: ColorCollections.backgroundColor,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
