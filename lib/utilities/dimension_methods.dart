// Design screen dimensions
const designScreenWidth = 360;
const designScreenHeight = 720;

// Methods for converting screen design dimensions
// to specific device screen dimensions

double proportionalHeight(double deviceHeight, double desiredHeight) {
  return deviceHeight * (desiredHeight / designScreenHeight);
}

double proportionalWidth(double deviceWidth, double desiredWidth) {
  return deviceWidth * (desiredWidth / designScreenWidth);
}
