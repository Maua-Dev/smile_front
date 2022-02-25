double mainNavigationActivitySize(width, height) {
  if (width < 1920 && width >= 1280) {
    if (height <= 720) return 24;
    return 30;
  }
  if (width < 1280 && width >= 960) {
    if (height <= 720) return 20;
    return 22;
  }
  return 30;
}

double mainNavigationIconSize(size) {
  if (size < 1920 && size >= 1440) {
    return 22;
  }
  if (size < 1440 && size >= 1280) {
    return 20;
  }
  if (size < 1280 && size >= 960) {
    return 18;
  }
  return 25;
}

double mainNavigationTitleSize(height) {
  if (height <= 720) return 28;
  return 35;
}

double mainNavigationCopyButtonSize(size) {
  if (size < 1920 && size >= 1760) {
    return 22;
  }
  if (size < 1760 && size >= 1600) {
    return 22;
  }
  if (size < 1600 && size >= 1440) {
    return 22;
  }
  if (size < 1440 && size >= 1280) {
    return 20;
  }
  if (size < 1280 && size >= 960) {
    return 20;
  }
  return 25;
}

double secundaryNavigationFontSize(size) {
  if (size < 1920 && size >= 1760) {
    return 24;
  }
  if (size < 1760 && size >= 1600) {
    return 24;
  }
  if (size < 1600 && size >= 1440) {
    return 24;
  }
  if (size < 1440 && size >= 1280) {
    return 22;
  }
  if (size < 1280 && size >= 960) {
    return 16;
  }
  return 30;
}

double secundaryNavigationIconSize(size) {
  if (size < 1600 && size >= 1280) {
    return 64;
  }
  if (size < 1280 && size >= 960) {
    return 52;
  }
  return 64;
}

double timerNavigationTimeSize(width, height) {
  if (height < 950) return 80;
  if (height < 800) return 70;
  if (width < 1500) return 80;
  return 100;
}

double timerNavigationTextSize(width, height) {
  if (width < 1180 && height < 950) return 18;
  if (height < 950) return 22;
  if (width < 1180) return 18;
  if (width < 1500) return 22;
  return 25;
}
