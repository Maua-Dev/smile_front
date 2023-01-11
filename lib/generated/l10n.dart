// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get initTitle {
    return Intl.message(
      'Home',
      name: 'initTitle',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginTitle {
    return Intl.message(
      'Login',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Mauá Week of Innovation, Leadership and Entrepreneurship`
  String get homePageTitle {
    return Intl.message(
      'Mauá Week of Innovation, Leadership and Entrepreneurship',
      name: 'homePageTitle',
      desc: '',
      args: [],
    );
  }

  /// `{title, select, one{Mauá Week of Innovation,} two{Leadership and Entrepreneurship} other{}}`
  String homePageTitleSelection(Object title) {
    return Intl.select(
      title,
      {
        'one': 'Mauá Week of Innovation,',
        'two': 'Leadership and Entrepreneurship',
        'other': '',
      },
      name: 'homePageTitleSelection',
      desc: '',
      args: [title],
    );
  }

  /// `This fifth edition of SMILE highlights even more the primordial union between the areas of Administration, Engineering, Computer Science, Design and Information Systems, necessary for innovation and generation of added value both for the training of future professionals and for the development of new ideas. The main return expected from this initiative is the expansion of the culture of innovation across the campus, with the participation of students, graduates, professors and the community, showing that the diversity of ideas and the integration of areas are catalysts for the development of skills.`
  String get homePageSubtitle {
    return Intl.message(
      'This fifth edition of SMILE highlights even more the primordial union between the areas of Administration, Engineering, Computer Science, Design and Information Systems, necessary for innovation and generation of added value both for the training of future professionals and for the development of new ideas. The main return expected from this initiative is the expansion of the culture of innovation across the campus, with the participation of students, graduates, professors and the community, showing that the diversity of ideas and the integration of areas are catalysts for the development of skills.',
      name: 'homePageSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `May 22 to 27`
  String get smileDate {
    return Intl.message(
      'May 22 to 27',
      name: 'smileDate',
      desc: '',
      args: [],
    );
  }

  /// `May 22 to 27, 2023`
  String get smileDateWithYear {
    return Intl.message(
      'May 22 to 27, 2023',
      name: 'smileDateWithYear',
      desc: '',
      args: [],
    );
  }

  /// `KNOW MORE >>>`
  String get knowMore {
    return Intl.message(
      'KNOW MORE >>>',
      name: 'knowMore',
      desc: '',
      args: [],
    );
  }

  /// `Main Speakers - 2022`
  String get speakersTitle {
    return Intl.message(
      'Main Speakers - 2022',
      name: 'speakersTitle',
      desc: '',
      args: [],
    );
  }

  /// `SWIPE TO SEE MORE >>>`
  String get speakersSwipe {
    return Intl.message(
      'SWIPE TO SEE MORE >>>',
      name: 'speakersSwipe',
      desc: '',
      args: [],
    );
  }

  /// `{speakers, select, nina{Nina Silva} viviane{Viviane Nunes} leila{Leila Ferreira} boris{Bóris Fabris} marco{Marco Antonio Teixeira} willian{Dr. William Schoenell} other{}}`
  String speakersSchemaName(Object speakers) {
    return Intl.select(
      speakers,
      {
        'nina': 'Nina Silva',
        'viviane': 'Viviane Nunes',
        'leila': 'Leila Ferreira',
        'boris': 'Bóris Fabris',
        'marco': 'Marco Antonio Teixeira',
        'willian': 'Dr. William Schoenell',
        'other': '',
      },
      name: 'speakersSchemaName',
      desc: '',
      args: [speakers],
    );
  }

  /// `{speakers, select, nina{He studied administration at the Fluminense Federal University, had his first contact with technology in the second year of college, in his first job. She was invited to join the company's team that worked with the SAP ERP system. From then on, he deepened his studies, took his certification and made his way into technology.} viviane{Viviane Nunes is a businesswoman and director of VN Comunicação. Specialist in institutional relations, with specialization in Energy Efficiency and Business Management in Oil, Gas and Biofuels. In her lectures, subjects related to strategies, women in the labor market and incentives for professional training are addressed.} leila{Leila Ferreira holds a degree in Journalism and Letters, with a Masters in Communication from the University of London, worked as a reporter at Rede Globo Minas and, for ten years, presented the program “Leila Interview”, on Rede Minas and TV Alterosa/SBT, which produced 13 international stories. She is the author of the books “Living doesn't hurt”, “The art of being light”, “Women – Why would they…?” and “Leila Interview: Backstage”.} boris{Designer, Automotive Design Consultant, teacher and speaker with international work experiences in the US, India, China, Europe and several other countries.} marco{Political Scientist, Professor and Researcher in the area of ​​Management and Public Policy. He was a commentator for the CBNSP program, on Rádio CBN, between 2012 and 2021, where he addressed issues related to the problems of the city of São Paulo and its public policies. He is one of the editors of the Blog "Gestão, Política & Sociedade" housed in the newspaper O Estado de São Paulo.} willian{He graduated in Physics from the Federal University of Santa Catarina, with a PhD in Astronomy from the University of Granada, worked as a FAPESP Technical Scholarship for the construction of a robotic telescope in Chile and currently works as an Instrument Control Specialist at the Gigante de Magalhães Observatory (GMT ).} other{}}`
  String speakersSchemaDescription(Object speakers) {
    return Intl.select(
      speakers,
      {
        'nina':
            'He studied administration at the Fluminense Federal University, had his first contact with technology in the second year of college, in his first job. She was invited to join the company\'s team that worked with the SAP ERP system. From then on, he deepened his studies, took his certification and made his way into technology.',
        'viviane':
            'Viviane Nunes is a businesswoman and director of VN Comunicação. Specialist in institutional relations, with specialization in Energy Efficiency and Business Management in Oil, Gas and Biofuels. In her lectures, subjects related to strategies, women in the labor market and incentives for professional training are addressed.',
        'leila':
            'Leila Ferreira holds a degree in Journalism and Letters, with a Masters in Communication from the University of London, worked as a reporter at Rede Globo Minas and, for ten years, presented the program “Leila Interview”, on Rede Minas and TV Alterosa/SBT, which produced 13 international stories. She is the author of the books “Living doesn\'t hurt”, “The art of being light”, “Women – Why would they…?” and “Leila Interview: Backstage”.',
        'boris':
            'Designer, Automotive Design Consultant, teacher and speaker with international work experiences in the US, India, China, Europe and several other countries.',
        'marco':
            'Political Scientist, Professor and Researcher in the area of ​​Management and Public Policy. He was a commentator for the CBNSP program, on Rádio CBN, between 2012 and 2021, where he addressed issues related to the problems of the city of São Paulo and its public policies. He is one of the editors of the Blog "Gestão, Política & Sociedade" housed in the newspaper O Estado de São Paulo.',
        'willian':
            'He graduated in Physics from the Federal University of Santa Catarina, with a PhD in Astronomy from the University of Granada, worked as a FAPESP Technical Scholarship for the construction of a robotic telescope in Chile and currently works as an Instrument Control Specialist at the Gigante de Magalhães Observatory (GMT ).',
        'other': '',
      },
      name: 'speakersSchemaDescription',
      desc: '',
      args: [speakers],
    );
  }

  /// `Atividades`
  String get activitiesTitle {
    return Intl.message(
      'Atividades',
      name: 'activitiesTitle',
      desc: '',
      args: [],
    );
  }

  /// `{activity, select, CURSOS{Courses} PALESTRAS{Speeches} PALESTRAS_ALTO_IMPACTO{High Impact Speeches} VISITAS_TECNICAS{Technical Visits} COMPETICOES_ACADEMICAS{Academic Competitions} HACKATHON{Hackathon} FEIRA_ESTAGIOS{Internship Fairs} CAFE_EX_ALUNOS{Coffeee with alumni} ACADEMIA_DE_PROFESSORES{Teachers Academy} ATIVIDADE_CULTURAL{Cultural Activity} GCSP{GCSP} ATIVIDADE_ESPORTIVA{Sport Activity} other{Activities}}`
  String activitiesOfferedName(Object activity) {
    return Intl.select(
      activity,
      {
        'CURSOS': 'Courses',
        'PALESTRAS': 'Speeches',
        'PALESTRAS_ALTO_IMPACTO': 'High Impact Speeches',
        'VISITAS_TECNICAS': 'Technical Visits',
        'COMPETICOES_ACADEMICAS': 'Academic Competitions',
        'HACKATHON': 'Hackathon',
        'FEIRA_ESTAGIOS': 'Internship Fairs',
        'CAFE_EX_ALUNOS': 'Coffeee with alumni',
        'ACADEMIA_DE_PROFESSORES': 'Teachers Academy',
        'ATIVIDADE_CULTURAL': 'Cultural Activity',
        'GCSP': 'GCSP',
        'ATIVIDADE_ESPORTIVA': 'Sport Activity',
        'other': 'Activities',
      },
      name: 'activitiesOfferedName',
      desc: '',
      args: [activity],
    );
  }

  /// `{activity, select, CURSOS{The courses offer high quality content, taught by renowned professionals who are active in the market. The courses offer training and updating of participants through theoretical/practical knowledge in the various areas of Administration, Computer Science, Design, Engineering and Information Systems.} PALESTRAS{The lectures are free and will include the participation of professionals from leading companies in the market, talking about the Challenges of Humanity.} PALESTRAS_ALTO_IMPACTO{The high-impact lectures will be delivered by highly qualified professionals in their respective areas of expertise and highlighted in the current media. Sign up as soon as possible and secure your spot!} VISITAS_TECNICAS{In search of a connection between the academic world and the job market, during SMILE technical visits will be offered to companies.} COMPETICOES_ACADEMICAS{During SMILE, participants will be able to have fun with Academic Competition activities: League Of Legend Championship (online) and GameDev Mauá - Game Jam (in person).} HACKATHON{Hackathons are events that bring together students, software developers, designers and other professionals, with the aim of creating innovative solutions for a specific problem in a short period of time. This is an excellent opportunity to develop your professional side, in addition to discovering new talent. The events promote a great interaction between the participants and offer prizes for the winners at the end.} FEIRA_ESTAGIOS{Representatives of renowned companies will present Internship and Trainee Programs, in addition to bringing tips on selection processes, interviews, career tips and answering questions from participants.} CAFE_EX_ALUNOS{The activity aims to promote informal conversations between IMT students and graduates who occupy prominent positions in their areas of expertise. Come join!} ACADEMIA_DE_PROFESSORES{Academia de Professores focuses on continuing education, dissemination of teaching strategies and tools for IMT teachers and high school teachers.} ATIVIDADE_CULTURAL{Are you part of a band? Sing? Do you play any instrument? Do you like poetry, literature? Do you do theater? Dance? Come share your talent with us! It will be an afternoon of presentations, integration and lots of fun on campus.} GCSP{The GCSP - Grand Challenges Scholars Program is a program that offers undergraduate students the opportunity to work with the great challenges of humanity, being mentored by professors.} ATIVIDADE_ESPORTIVA{Participants will discover two interesting activities: spikeball and flag football. In addition, various activities will also be offered, such as functional gymnastics, energizing meditation and pilates! All participants will be able to interact with the speaker and teachers! Follow and participate!} other{Activity}}`
  String activitiesOfferedDescription(Object activity) {
    return Intl.select(
      activity,
      {
        'CURSOS':
            'The courses offer high quality content, taught by renowned professionals who are active in the market. The courses offer training and updating of participants through theoretical/practical knowledge in the various areas of Administration, Computer Science, Design, Engineering and Information Systems.',
        'PALESTRAS':
            'The lectures are free and will include the participation of professionals from leading companies in the market, talking about the Challenges of Humanity.',
        'PALESTRAS_ALTO_IMPACTO':
            'The high-impact lectures will be delivered by highly qualified professionals in their respective areas of expertise and highlighted in the current media. Sign up as soon as possible and secure your spot!',
        'VISITAS_TECNICAS':
            'In search of a connection between the academic world and the job market, during SMILE technical visits will be offered to companies.',
        'COMPETICOES_ACADEMICAS':
            'During SMILE, participants will be able to have fun with Academic Competition activities: League Of Legend Championship (online) and GameDev Mauá - Game Jam (in person).',
        'HACKATHON':
            'Hackathons are events that bring together students, software developers, designers and other professionals, with the aim of creating innovative solutions for a specific problem in a short period of time. This is an excellent opportunity to develop your professional side, in addition to discovering new talent. The events promote a great interaction between the participants and offer prizes for the winners at the end.',
        'FEIRA_ESTAGIOS':
            'Representatives of renowned companies will present Internship and Trainee Programs, in addition to bringing tips on selection processes, interviews, career tips and answering questions from participants.',
        'CAFE_EX_ALUNOS':
            'The activity aims to promote informal conversations between IMT students and graduates who occupy prominent positions in their areas of expertise. Come join!',
        'ACADEMIA_DE_PROFESSORES':
            'Academia de Professores focuses on continuing education, dissemination of teaching strategies and tools for IMT teachers and high school teachers.',
        'ATIVIDADE_CULTURAL':
            'Are you part of a band? Sing? Do you play any instrument? Do you like poetry, literature? Do you do theater? Dance? Come share your talent with us! It will be an afternoon of presentations, integration and lots of fun on campus.',
        'GCSP':
            'The GCSP - Grand Challenges Scholars Program is a program that offers undergraduate students the opportunity to work with the great challenges of humanity, being mentored by professors.',
        'ATIVIDADE_ESPORTIVA':
            'Participants will discover two interesting activities: spikeball and flag football. In addition, various activities will also be offered, such as functional gymnastics, energizing meditation and pilates! All participants will be able to interact with the speaker and teachers! Follow and participate!',
        'other': 'Activity',
      },
      name: 'activitiesOfferedDescription',
      desc: '',
      args: [activity],
    );
  }

  /// `Sponsors`
  String get sponsorsTitle {
    return Intl.message(
      'Sponsors',
      name: 'sponsorsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Entities Participating in Smile`
  String get mauaEntititesTitle {
    return Intl.message(
      'Entities Participating in Smile',
      name: 'mauaEntititesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Be our Sponsor`
  String get beSponsorTitle {
    return Intl.message(
      'Be our Sponsor',
      name: 'beSponsorTitle',
      desc: '',
      args: [],
    );
  }

  /// `SMILE brings an opportunity for partnership and integration between the labor market and academia. Become an event Sponsor and find out about the benefits and opportunities that SMILE offers. In this edition, 4 types of sponsorship quotas are available: Diamond, Gold, Silver and Bronze. In addition, when closing the sponsorship in advance, there will be a progressive discount on the quotas. Information about quotas and benefits is below.`
  String get beSponsorDescription {
    return Intl.message(
      'SMILE brings an opportunity for partnership and integration between the labor market and academia. Become an event Sponsor and find out about the benefits and opportunities that SMILE offers. In this edition, 4 types of sponsorship quotas are available: Diamond, Gold, Silver and Bronze. In addition, when closing the sponsorship in advance, there will be a progressive discount on the quotas. Information about quotas and benefits is below.',
      name: 'beSponsorDescription',
      desc: '',
      args: [],
    );
  }

  /// `Discount`
  String get beSponsorDiscount {
    return Intl.message(
      'Discount',
      name: 'beSponsorDiscount',
      desc: '',
      args: [],
    );
  }

  /// `SPONSORSHIP INFORMATION`
  String get beSponsorMoreInfoTitle {
    return Intl.message(
      'SPONSORSHIP INFORMATION',
      name: 'beSponsorMoreInfoTitle',
      desc: '',
      args: [],
    );
  }

  /// `If you are interested in sponsoring the event, click here for more information.`
  String get beSponsorMoreInfoDescription {
    return Intl.message(
      'If you are interested in sponsoring the event, click here for more information.',
      name: 'beSponsorMoreInfoDescription',
      desc: '',
      args: [],
    );
  }

  /// `Click here to access our social networks:`
  String get footerSocialMedia {
    return Intl.message(
      'Click here to access our social networks:',
      name: 'footerSocialMedia',
      desc: '',
      args: [],
    );
  }

  /// `How to get`
  String get footerHowToGet {
    return Intl.message(
      'How to get',
      name: 'footerHowToGet',
      desc: '',
      args: [],
    );
  }

  /// `{bold, select, normalPart1{If in doubt, send an email to } boldPart1{smile.patrocinio@maua.br} normalPart2{ or } boldPart2{smile@maua.br} normalPart3{.} other{Dev. Community Mauá}}`
  String footerDoubtContact(Object bold) {
    return Intl.select(
      bold,
      {
        'normalPart1': 'If in doubt, send an email to ',
        'boldPart1': 'smile.patrocinio@maua.br',
        'normalPart2': ' or ',
        'boldPart2': 'smile@maua.br',
        'normalPart3': '.',
        'other': 'Dev. Community Mauá',
      },
      name: 'footerDoubtContact',
      desc: '',
      args: [bold],
    );
  }

  /// `{bold, select, normalPart1{If in doubt, send an email to } boldPart1{smile.patrocinio@maua.br} normalPart2{ or } boldPart2{smile@maua.br} normalPart3{.} other{Dev. Community Mauá}}`
  String footerContact(Object bold) {
    return Intl.select(
      bold,
      {
        'normalPart1': 'If in doubt, send an email to ',
        'boldPart1': 'smile.patrocinio@maua.br',
        'normalPart2': ' or ',
        'boldPart2': 'smile@maua.br',
        'normalPart3': '.',
        'other': 'Dev. Community Mauá',
      },
      name: 'footerContact',
      desc: '',
      args: [bold],
    );
  }

  /// `{bold, select, normalPart{Created and developed by } boldPart{Dev. Community Mauá} other{Dev. Community Mauá}}`
  String footerDev(Object bold) {
    return Intl.select(
      bold,
      {
        'normalPart': 'Created and developed by ',
        'boldPart': 'Dev. Community Mauá',
        'other': 'Dev. Community Mauá',
      },
      name: 'footerDev',
      desc: '',
      args: [bold],
    );
  }

  /// `Campus São Caetano do Sul`
  String get footerLocalizationTitle {
    return Intl.message(
      'Campus São Caetano do Sul',
      name: 'footerLocalizationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Praça Mauá 1 São Caetano do Sul - SP`
  String get footerLocalizationDescription {
    return Intl.message(
      'Praça Mauá 1 São Caetano do Sul - SP',
      name: 'footerLocalizationDescription',
      desc: '',
      args: [],
    );
  }

  /// `About Smile`
  String get aboutSmileTitle {
    return Intl.message(
      'About Smile',
      name: 'aboutSmileTitle',
      desc: '',
      args: [],
    );
  }

  /// `{description, select, firstParagraph{SMILE is an integrating event between the areas of Administration, Engineering, Computer Science, Design and Information Systems, which aims to present new trends, technologies and contents in order to encourage the exchange and updating of knowledge between professionals and students.} secondParagraph{The event represents an opportunity for renewal and continuous learning, as well as an excellent experience for improving the network of contacts, with professionals from different fields at national and international levels. This makes them start to share experiences and interact with the job market.} thirdParagraph{Organized by the Mauá Institute of Technology - IMT and open to the public, online/in person (Hybrid).} other{}}`
  String aboutSmileDescription(Object description) {
    return Intl.select(
      description,
      {
        'firstParagraph':
            'SMILE is an integrating event between the areas of Administration, Engineering, Computer Science, Design and Information Systems, which aims to present new trends, technologies and contents in order to encourage the exchange and updating of knowledge between professionals and students.',
        'secondParagraph':
            'The event represents an opportunity for renewal and continuous learning, as well as an excellent experience for improving the network of contacts, with professionals from different fields at national and international levels. This makes them start to share experiences and interact with the job market.',
        'thirdParagraph':
            'Organized by the Mauá Institute of Technology - IMT and open to the public, online/in person (Hybrid).',
        'other': '',
      },
      name: 'aboutSmileDescription',
      desc: '',
      args: [description],
    );
  }

  /// `Date: May 22 to 27, 2023.`
  String get aboutSmileDate {
    return Intl.message(
      'Date: May 22 to 27, 2023.',
      name: 'aboutSmileDate',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Unsubscribe`
  String get unsubscribe {
    return Intl.message(
      'Unsubscribe',
      name: 'unsubscribe',
      desc: '',
      args: [],
    );
  }

  /// `The login service is under maintenance`
  String get maintenanceTitle {
    return Intl.message(
      'The login service is under maintenance',
      name: 'maintenanceTitle',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for your patience`
  String get maintenanceDescription {
    return Intl.message(
      'Thank you for your patience',
      name: 'maintenanceDescription',
      desc: '',
      args: [],
    );
  }

  /// `Click here to return`
  String get clickToGoBack {
    return Intl.message(
      'Click here to return',
      name: 'clickToGoBack',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get closeTitle {
    return Intl.message(
      'Close',
      name: 'closeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirmTitle {
    return Intl.message(
      'Confirm',
      name: 'confirmTitle',
      desc: '',
      args: [],
    );
  }

  /// `CPF or E-mail`
  String get loginUsernamePlaceholder {
    return Intl.message(
      'CPF or E-mail',
      name: 'loginUsernamePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get loginPasswordPlaceholder {
    return Intl.message(
      'Password',
      name: 'loginPasswordPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `I don't have a record`
  String get loginWithoutRecordTitle {
    return Intl.message(
      'I don\'t have a record',
      name: 'loginWithoutRecordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Forgot my password`
  String get loginForgotPasswordTitle {
    return Intl.message(
      'Forgot my password',
      name: 'loginForgotPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Resend confirmation email`
  String get loginResendConfirmationTitle {
    return Intl.message(
      'Resend confirmation email',
      name: 'loginResendConfirmationTitle',
      desc: '',
      args: [],
    );
  }

  /// `{title, select, normalPart{In case of error when logging in, send an email to: } boldPart{dev@maua.br} other{}}`
  String loginWarningTitle(Object title) {
    return Intl.select(
      title,
      {
        'normalPart': 'In case of error when logging in, send an email to: ',
        'boldPart': 'dev@maua.br',
        'other': '',
      },
      name: 'loginWarningTitle',
      desc: '',
      args: [title],
    );
  }

  /// `Full Name`
  String get registerFullNamePlaceholder {
    return Intl.message(
      'Full Name',
      name: 'registerFullNamePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Social Name`
  String get registerSocialNamePlaceholder {
    return Intl.message(
      'Social Name',
      name: 'registerSocialNamePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `CPF`
  String get registerCPFPlaceholder {
    return Intl.message(
      'CPF',
      name: 'registerCPFPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get registerEmailPlaceholder {
    return Intl.message(
      'E-mail',
      name: 'registerEmailPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your e-mail`
  String get registerEmailConfirmationPlaceholder {
    return Intl.message(
      'Confirm your e-mail',
      name: 'registerEmailConfirmationPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get registerPhonePlaceholder {
    return Intl.message(
      'Phone',
      name: 'registerPhonePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Search by country or DDI`
  String get registerCountryPlaceholder {
    return Intl.message(
      'Search by country or DDI',
      name: 'registerCountryPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Mauá Student`
  String get registerStudentMauaPlaceholder {
    return Intl.message(
      'Mauá Student',
      name: 'registerStudentMauaPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `RA`
  String get registerRAPlaceholder {
    return Intl.message(
      'RA',
      name: 'registerRAPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get registerConfirmPasswordPlaceholder {
    return Intl.message(
      'Confirm password',
      name: 'registerConfirmPasswordPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `{terms, select, one{I am aware that the entire event will be recorded and photographed, with the purpose of promoting Smile.} two{I have read and accept the Terms of Use.} three{I authorize the sending of notification by email, for the purposes of promoting Smile.}}`
  String registerTerms(Object terms) {
    return Intl.select(
      terms,
      {
        'one':
            'I am aware that the entire event will be recorded and photographed, with the purpose of promoting Smile.',
        'two': 'I have read and accept the Terms of Use.',
        'three':
            'I authorize the sending of notification by email, for the purposes of promoting Smile.',
      },
      name: 'registerTerms',
      desc: '',
      args: [terms],
    );
  }

  /// `Means of notification about activities:`
  String get notificationsTitle {
    return Intl.message(
      'Means of notification about activities:',
      name: 'notificationsTitle',
      desc: '',
      args: [],
    );
  }

  /// `I want to receive notifications by `
  String get notificationsSchemaTitle {
    return Intl.message(
      'I want to receive notifications by ',
      name: 'notificationsSchemaTitle',
      desc: '',
      args: [],
    );
  }

  /// `{notification, select, email{EMAIL} sms{SMS} whatsapp{WHATSAPP} app{APP/WEB} other{}}`
  String notificationsSchema(Object notification) {
    return Intl.select(
      notification,
      {
        'email': 'EMAIL',
        'sms': 'SMS',
        'whatsapp': 'WHATSAPP',
        'app': 'APP/WEB',
        'other': '',
      },
      name: 'notificationsSchema',
      desc: '',
      args: [notification],
    );
  }

  /// `Cadastrar`
  String get registerTitle {
    return Intl.message(
      'Cadastrar',
      name: 'registerTitle',
      desc: '',
      args: [],
    );
  }

  /// `We sent an email (no-reply@verificationemail.com) to you, please check your inbox, spam or promotional and click on the confirmation link to validate your registration.`
  String get emailNotificationTitle {
    return Intl.message(
      'We sent an email (no-reply@verificationemail.com) to you, please check your inbox, spam or promotional and click on the confirmation link to validate your registration.',
      name: 'emailNotificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get changePasswordTitle {
    return Intl.message(
      'Change password',
      name: 'changePasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `I already have a registration`
  String get haveRegistrationTitle {
    return Intl.message(
      'I already have a registration',
      name: 'haveRegistrationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure your email address {firstName} is correct?`
  String confirmEmailNotificationTitle(Object firstName) {
    return Intl.message(
      'Are you sure your email address $firstName is correct?',
      name: 'confirmEmailNotificationTitle',
      desc: '',
      args: [firstName],
    );
  }

  /// `You will need to access your inbox to validate your registration.`
  String get confirmEmailNotificationSubtitle {
    return Intl.message(
      'You will need to access your inbox to validate your registration.',
      name: 'confirmEmailNotificationSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `A code will be sent to the registered email address:`
  String get codeInEmailTitle {
    return Intl.message(
      'A code will be sent to the registered email address:',
      name: 'codeInEmailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your new password and the code sent to your email:`
  String get insertPasswordCodeInstructions {
    return Intl.message(
      'Enter your new password and the code sent to your email:',
      name: 'insertPasswordCodeInstructions',
      desc: '',
      args: [],
    );
  }

  /// `You will receive an email (no-reply@verificationemail.com) with a link to change your password! Check inbox, spam or promotional.`
  String get codeInEmailInstructionsTitle {
    return Intl.message(
      'You will receive an email (no-reply@verificationemail.com) with a link to change your password! Check inbox, spam or promotional.',
      name: 'codeInEmailInstructionsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get sendTitle {
    return Intl.message(
      'Send',
      name: 'sendTitle',
      desc: '',
      args: [],
    );
  }

  /// `Return to login`
  String get returnLogin {
    return Intl.message(
      'Return to login',
      name: 'returnLogin',
      desc: '',
      args: [],
    );
  }

  /// `If you have not found the email (no-reply@verificationemail.com) or the link has expired, please resend the code by entering your CPF in the field below:\n`
  String get errorEmailInstructionsTitle {
    return Intl.message(
      'If you have not found the email (no-reply@verificationemail.com) or the link has expired, please resend the code by entering your CPF in the field below:\n',
      name: 'errorEmailInstructionsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your registration has been successfully confirmed!`
  String get successRegister {
    return Intl.message(
      'Your registration has been successfully confirmed!',
      name: 'successRegister',
      desc: '',
      args: [],
    );
  }

  /// `Failed to register, please try again.`
  String get errorRegister {
    return Intl.message(
      'Failed to register, please try again.',
      name: 'errorRegister',
      desc: '',
      args: [],
    );
  }

  /// `User already exist.`
  String get errorUserAlreadyExist {
    return Intl.message(
      'User already exist.',
      name: 'errorUserAlreadyExist',
      desc: '',
      args: [],
    );
  }

  /// `Email successfully sent!`
  String get successEmailSend {
    return Intl.message(
      'Email successfully sent!',
      name: 'successEmailSend',
      desc: '',
      args: [],
    );
  }

  /// `Code sent successfully!`
  String get successSendingCode {
    return Intl.message(
      'Code sent successfully!',
      name: 'successSendingCode',
      desc: '',
      args: [],
    );
  }

  /// `Failed to send code, email not registered or not confirmed.`
  String get errorSendingCode {
    return Intl.message(
      'Failed to send code, email not registered or not confirmed.',
      name: 'errorSendingCode',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully!`
  String get successChangePassword {
    return Intl.message(
      'Password changed successfully!',
      name: 'successChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Failed to change password, please try again.`
  String get errorChangePassword {
    return Intl.message(
      'Failed to change password, please try again.',
      name: 'errorChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `It was not possible to login.\n\n- Register by clicking on the "I have no account" button\n- Your e-mail may not have been confirmed, click on "Resend confirmation e-mail"`
  String get errorLoginInvalidConfirmation {
    return Intl.message(
      'It was not possible to login.\n\n- Register by clicking on the "I have no account" button\n- Your e-mail may not have been confirmed, click on "Resend confirmation e-mail"',
      name: 'errorLoginInvalidConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Invalid login and/or password`
  String get errorLoginInvalidCredential {
    return Intl.message(
      'Invalid login and/or password',
      name: 'errorLoginInvalidCredential',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully! \n Redirecting to login...`
  String get successChangePasswordRedirect {
    return Intl.message(
      'Password changed successfully! \n Redirecting to login...',
      name: 'successChangePasswordRedirect',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yesTitle {
    return Intl.message(
      'Yes',
      name: 'yesTitle',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get noTitle {
    return Intl.message(
      'No',
      name: 'noTitle',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '' key
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
