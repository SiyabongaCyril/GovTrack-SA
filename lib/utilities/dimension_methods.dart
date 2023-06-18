const designScreenWidth = 360;
const designScreenHeight = 720;

double proportionalHeight(double deviceHeight, double desiredHeight) {
  return deviceHeight * (desiredHeight / designScreenHeight);
}

double proportionalWidth(double deviceWidth, double desiredWidth) {
  return deviceWidth * (desiredWidth / designScreenWidth);
}
