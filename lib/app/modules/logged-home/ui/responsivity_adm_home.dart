// Main Navigation Button
double mainNavigationWidth(size) {
  if (size >= 1800) {
    return 460;
  }
  if (size < 1800 && size >= 1600) {
    return 460;
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

double mainNavigationHeight(size) {
  if (size >= 1800) {
    return 300;
  }
  if (size < 1800 && size >= 1600) {
    return 300;
  }
  if (size < 1600 && size >= 1440) {
    return 300;
  }
  if (size < 1440 && size >= 1280) {
    return 300;
  }
  if (size < 1280 && size >= 960) {
    return 300;
  }
  return 300;
}

double mainNavigationActivitySize(size) {
  if (size >= 1800) {
    return 35;
  }
  if (size < 1800 && size >= 1600) {
    return 35;
  }
  if (size < 1600 && size >= 1440) {
    return 30;
  }
  if (size < 1440 && size >= 1280) {
    return 30;
  }
  if (size < 1280 && size >= 960) {
    return 22;
  }
  return 35;
}

double mainNavigationIconSize(size) {
  if (size >= 1800) {
    return 35;
  }
  if (size < 1800 && size >= 1600) {
    return 35;
  }
  if (size < 1600 && size >= 1440) {
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

double mainNavigationTitleSize(size) {
  if (size >= 1800) {
    return 35;
  }
  if (size < 1800 && size >= 1600) {
    return 35;
  }
  if (size < 1600 && size >= 1440) {
    return 35;
  }
  if (size < 1440 && size >= 1280) {
    return 35;
  }
  if (size < 1280 && size >= 960) {
    return 35;
  }
  return 45;
}

double mainNavigationCopyButtonSize(size) {
  if (size >= 1800) {
    return 35;
  }
  if (size < 1800 && size >= 1600) {
    return 35;
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
double secundaryNavigationHeight(size) {
  return (mainNavigationHeight(size) - 48) / 2;
}

double secundaryNavigationWidth(size) {
  if (size >= 1800) {
    return 300;
  }
  if (size < 1800 && size >= 1600) {
    return 350;
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
  if (size >= 1800) {
    return 30;
  }
  if (size < 1800 && size >= 1600) {
    return 35;
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
double timerNavigationWidth(size, userType) {
  switch (userType) {
    case 'adm':
      return mainNavigationWidth(size);
    case 'user':
      return secundaryNavigationWidth(size) * 2 + 32 * 2;
    default:
      return mainNavigationWidth(size);
  }
}

double timerNavigationHeight(size) {
  return (mainNavigationHeight(size) - 48) / 2;
}

double timerNavigationTimeSize(size) {
  if (size >= 1800) {
    return 30;
  }
  if (size < 1800 && size >= 1600) {
    return 35;
  }
  if (size < 1600 && size >= 1440) {
    return 65;
  }
  if (size < 1440 && size >= 1280) {
    return 65;
  }
  if (size < 1280 && size >= 960) {
    return 60;
  }
  return 100;
}

double timerNavigationTextSize(size, userType) {
  if (size >= 1800) {
    return 30;
  }
  if (size < 1800 && size >= 1600) {
    return 35;
  }
  if (size < 1600 && size >= 1440) {
    return 24;
  }
  if (size < 1440 && size >= 1280) {
    return 24;
  }
  if (size < 1280 && size >= 1120) {
    return 20;
  }
  if (size < 1120 && size >= 960) {
    switch (userType) {
      case 'adm':
        return 20;
      case 'user':
        return 18;
    }
  }
  return 25;
}

//Sponsorship Navigation
double sponsorNavigationHeight(size) {
  if (size >= 1800) {
    return 55;
  }
  if (size < 1800 && size >= 1600) {
    return 50;
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
