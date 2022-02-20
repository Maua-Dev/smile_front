double largeInputBoxWidth(size, height) {
  if (size <= 1920 && size >= 1760) {
    return 1100;
  }
  if (size < 1760 && size >= 1600) {
    return 1000;
  }
  if (size < 1600 && size >= 1440) {
    return 900;
  }
  if (size < 1440 && size >= 1280) {
    return 800;
  }
  if (size < 1280 && size >= 1120) {
    return 700;
  }
  if (size < 1120 && size >= 960) {
    return 600;
  }
  return 600;
}

double mediumInputBoxWidth(size, height) {
  return largeInputBoxWidth(size, height) * 0.5 - 10;
}

double cpfInputBoxWidth(size, height) {
  return largeInputBoxWidth(size, height) * 0.4 - 10;
}

double emailInputBoxWidth(size, height) {
  return largeInputBoxWidth(size, height) * 0.6 - 10;
}

double secondTabinputBoxHeight(height) {
  if (height < 675) return 42;
  if (height < 720 && height >= 675) return 45;
  if (height < 810 && height >= 720) return 50;
  if (height < 900 && height >= 810) return 70;
  if (height < 990 && height >= 900) return 90;
  if (height < 1080 && height >= 990) return 90;
  return 60;
}
