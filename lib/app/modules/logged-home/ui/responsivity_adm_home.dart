// Main Navigation Button
double mainNavigationWidth(size) {
  if (size < 1920 && size >= 1760) {
    return 540;
  }
  if (size < 1760 && size >= 1600) {
    return 500;
  }
  if (size < 1600 && size >= 1440) {
    return 460;
  }
  if (size < 1440 && size >= 1280) {
    return 420;
  }
  if (size < 1280 && size >= 1120) {
    return 360;
  }
  if (size < 1120 && size >= 960) {
    return 320;
  }
  return 400;
}

double mainNavigationHeight(height) {
  if (height <= 720) {
    return 270;
  }
  return 300;
}

double mainNavigationActivitySize(size, height) {
  if (size < 1920 && size >= 1280) {
    if (height <= 720) return 24;
    return 30;
  }
  if (size < 1280 && size >= 960) {
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

double mainNavigationTitleSize(size, height) {
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

// Secundary Navigation Button
double secundaryNavigationHeight(height) {
  return (mainNavigationHeight(height) - 48) / 2;
}

double secundaryNavigationWidth(size) {
  if (size < 1920 && size >= 1760) {
    return 320;
  }
  if (size < 1760 && size >= 1600) {
    return 280;
  }
  if (size < 1600 && size >= 1440) {
    return 240;
  }
  if (size < 1440 && size >= 1280) {
    return 200;
  }
  if (size < 1280 && size >= 1120) {
    return 160;
  }
  if (size < 1120 && size >= 960) {
    return 125;
  }
  return 300;
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

// Timer Navigation Button
double timerNavigationWidth(size) {
  return mainNavigationWidth(size);
}

double timerNavigationHeight(height) {
  return (mainNavigationHeight(height) - 48) / 2;
}

double timerNavigationTimeSize(size, height) {
  if (size < 1920 && size >= 1280) {
    if (height <= 720) return 60;
    return 65;
  }
  if (size < 1280 && size >= 960) {
    return 60;
  }
  return 100;
}

double timerNavigationTextSize(size, height) {
  if (size < 1920 && size >= 1280) {
    if (height <= 720) return 19;
    return 24;
  }
  if (size < 1280 && size >= 960) {
    return 18;
  }
  return 25;
}

//Sponsorship Navigation
double sponsorNavigationHeight(size) {
  if (size < 1920 && size >= 1760) {
    return 40;
  }
  if (size < 1760 && size >= 1600) {
    return 40;
  }
  if (size < 1600 && size >= 1440) {
    return 40;
  }
  if (size < 1440 && size >= 1280) {
    return 40;
  }
  if (size < 1280 && size >= 960) {
    return 32;
  }
  return 32;
}
