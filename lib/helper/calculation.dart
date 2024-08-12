class Calculation{
  double calculateDiscountedPrice(
      double actualPrice, double discountPercentage, String? discountType) {
    if(discountType=="percentage")
    return actualPrice - (actualPrice * discountPercentage/100);
    else
      return actualPrice - discountPercentage;
  }
}