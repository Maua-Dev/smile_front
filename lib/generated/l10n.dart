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

  /// `{schema, select, STUDENT{Mauá Student} EXTERNAL{External} EMPLOYEE{Employee} INTERNAL_STUDENT{International Student} PROFESSOR{Mauá Professor (Responsável)} ADMIN{Admin} other{}}`
  String userRolesNameSchema(Object schema) {
    return Intl.select(
      schema,
      {
        'STUDENT': 'Mauá Student',
        'EXTERNAL': 'External',
        'EMPLOYEE': 'Employee',
        'INTERNAL_STUDENT': 'International Student',
        'PROFESSOR': 'Mauá Professor (Responsável)',
        'ADMIN': 'Admin',
        'other': '',
      },
      name: 'userRolesNameSchema',
      desc: '',
      args: [schema],
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

  /// `Speakers`
  String get speakersTitle {
    return Intl.message(
      'Speakers',
      name: 'speakersTitle',
      desc: '',
      args: [],
    );
  }

  /// `Main Speakers - 2022`
  String get speakersMainTitle {
    return Intl.message(
      'Main Speakers - 2022',
      name: 'speakersMainTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add Speaker`
  String get speakersAddTitle {
    return Intl.message(
      'Add Speaker',
      name: 'speakersAddTitle',
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

  /// `Activities`
  String get activitiesTitle {
    return Intl.message(
      'Activities',
      name: 'activitiesTitle',
      desc: '',
      args: [],
    );
  }

  /// `{activity, select, COURSE{Courses} LECTURES{Speeches} HIGH_IMPACT_LECTURES{High Impact Speeches} TECHNICAL_VISITS{Technical Visits} ACADEMIC_COMPETITIONS{Academic Competitions} HACKATHON{Hackathon} INTERNSHIP_FAIR{Internship Fairs} ALUMNI_CAFE{Coffeee with alumni} PROFESSORS_ACADEMY{Teachers Academy} CULTURAL_ACTIVITY{Cultural Activity} GCSP{GCSP} SPORTS_ACTIVITY{Sport Activity} other{Activities}}`
  String activitiesOfferedName(Object activity) {
    return Intl.select(
      activity,
      {
        'COURSE': 'Courses',
        'LECTURES': 'Speeches',
        'HIGH_IMPACT_LECTURES': 'High Impact Speeches',
        'TECHNICAL_VISITS': 'Technical Visits',
        'ACADEMIC_COMPETITIONS': 'Academic Competitions',
        'HACKATHON': 'Hackathon',
        'INTERNSHIP_FAIR': 'Internship Fairs',
        'ALUMNI_CAFE': 'Coffeee with alumni',
        'PROFESSORS_ACADEMY': 'Teachers Academy',
        'CULTURAL_ACTIVITY': 'Cultural Activity',
        'GCSP': 'GCSP',
        'SPORTS_ACTIVITY': 'Sport Activity',
        'other': 'Activities',
      },
      name: 'activitiesOfferedName',
      desc: '',
      args: [activity],
    );
  }

  /// `{activity, select, COURSE{The courses offer high quality content, taught by renowned professionals who are active in the market. The courses offer training and updating of participants through theoretical/practical knowledge in the various areas of Administration, Computer Science, Design, Engineering and Information Systems.} LECTURES{The lectures are free and will include the participation of professionals from leading companies in the market, talking about the Challenges of Humanity.} HIGH_IMPACT_LECTURES{The high-impact lectures will be delivered by highly qualified professionals in their respective areas of expertise and highlighted in the current media. Sign up as soon as possible and secure your spot!} TECHNICAL_VISITS{In search of a connection between the academic world and the job market, during SMILE technical visits will be offered to companies.} ACADEMIC_COMPETITIONS{During SMILE, participants will be able to have fun with Academic Competition activities: League Of Legend Championship (online) and GameDev Mauá - Game Jam (in person).} HACKATHON{Hackathons are events that bring together students, software developers, designers and other professionals, with the aim of creating innovative solutions for a specific problem in a short period of time. This is an excellent opportunity to develop your professional side, in addition to discovering new talent. The events promote a great interaction between the participants and offer prizes for the winners at the end.} INTERNSHIP_FAIR{Representatives of renowned companies will present Internship and Trainee Programs, in addition to bringing tips on selection processes, interviews, career tips and answering questions from participants.} ALUMNI_CAFE{The activity aims to promote informal conversations between IMT students and graduates who occupy prominent positions in their areas of expertise. Come join!} PROFESSORS_ACADEMY{Teachers Academy focuses on continuing education, dissemination of teaching strategies and tools for IMT teachers and high school teachers.} CULTURAL_ACTIVITY{Are you part of a band? Sing? Do you play any instrument? Do you like poetry, literature? Do you do theater? Dance? Come share your talent with us! It will be an afternoon of presentations, integration and lots of fun on campus.} GCSP{The GCSP - Grand Challenges Scholars Program is a program that offers undergraduate students the opportunity to work with the great challenges of humanity, being mentored by professors.} SPORTS_ACTIVITY{Participants will discover two interesting activities: spikeball and flag football. In addition, various activities will also be offered, such as functional gymnastics, energizing meditation and pilates! All participants will be able to interact with the speaker and teachers! Follow and participate!} other{Activity}}`
  String activitiesOfferedDescription(Object activity) {
    return Intl.select(
      activity,
      {
        'COURSE':
            'The courses offer high quality content, taught by renowned professionals who are active in the market. The courses offer training and updating of participants through theoretical/practical knowledge in the various areas of Administration, Computer Science, Design, Engineering and Information Systems.',
        'LECTURES':
            'The lectures are free and will include the participation of professionals from leading companies in the market, talking about the Challenges of Humanity.',
        'HIGH_IMPACT_LECTURES':
            'The high-impact lectures will be delivered by highly qualified professionals in their respective areas of expertise and highlighted in the current media. Sign up as soon as possible and secure your spot!',
        'TECHNICAL_VISITS':
            'In search of a connection between the academic world and the job market, during SMILE technical visits will be offered to companies.',
        'ACADEMIC_COMPETITIONS':
            'During SMILE, participants will be able to have fun with Academic Competition activities: League Of Legend Championship (online) and GameDev Mauá - Game Jam (in person).',
        'HACKATHON':
            'Hackathons are events that bring together students, software developers, designers and other professionals, with the aim of creating innovative solutions for a specific problem in a short period of time. This is an excellent opportunity to develop your professional side, in addition to discovering new talent. The events promote a great interaction between the participants and offer prizes for the winners at the end.',
        'INTERNSHIP_FAIR':
            'Representatives of renowned companies will present Internship and Trainee Programs, in addition to bringing tips on selection processes, interviews, career tips and answering questions from participants.',
        'ALUMNI_CAFE':
            'The activity aims to promote informal conversations between IMT students and graduates who occupy prominent positions in their areas of expertise. Come join!',
        'PROFESSORS_ACADEMY':
            'Teachers Academy focuses on continuing education, dissemination of teaching strategies and tools for IMT teachers and high school teachers.',
        'CULTURAL_ACTIVITY':
            'Are you part of a band? Sing? Do you play any instrument? Do you like poetry, literature? Do you do theater? Dance? Come share your talent with us! It will be an afternoon of presentations, integration and lots of fun on campus.',
        'GCSP':
            'The GCSP - Grand Challenges Scholars Program is a program that offers undergraduate students the opportunity to work with the great challenges of humanity, being mentored by professors.',
        'SPORTS_ACTIVITY':
            'Participants will discover two interesting activities: spikeball and flag football. In addition, various activities will also be offered, such as functional gymnastics, energizing meditation and pilates! All participants will be able to interact with the speaker and teachers! Follow and participate!',
        'other': 'Activity',
      },
      name: 'activitiesOfferedDescription',
      desc: '',
      args: [activity],
    );
  }

  /// `Activities not found`
  String get activitiesNotFound {
    return Intl.message(
      'Activities not found',
      name: 'activitiesNotFound',
      desc: '',
      args: [],
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

  /// `{entity, select, atletica{gaspar_maua} ca{camaua} diversidade{diversidademaua} enactus{enactusmaua} esports{esportsmaua} inova{inovamaua} mauajr{mauajr} mauasocial{mauasocial} mbc{mauabusiness} nae{naemaua} dev{devcommunitymaua} nine{nine.maua} finance{imtfinance} baja{bajamaua} ecomaua{eco_maua} mauaracing2{mauaracingh2} mauaracing{mauaracing} other{}}`
  String mauaEntitiesSchemaSocialMidia(Object entity) {
    return Intl.select(
      entity,
      {
        'atletica': 'gaspar_maua',
        'ca': 'camaua',
        'diversidade': 'diversidademaua',
        'enactus': 'enactusmaua',
        'esports': 'esportsmaua',
        'inova': 'inovamaua',
        'mauajr': 'mauajr',
        'mauasocial': 'mauasocial',
        'mbc': 'mauabusiness',
        'nae': 'naemaua',
        'dev': 'devcommunitymaua',
        'nine': 'nine.maua',
        'finance': 'imtfinance',
        'baja': 'bajamaua',
        'ecomaua': 'eco_maua',
        'mauaracing2': 'mauaracingh2',
        'mauaracing': 'mauaracing',
        'other': '',
      },
      name: 'mauaEntitiesSchemaSocialMidia',
      desc: '',
      args: [entity],
    );
  }

  /// `{entity, select, atletica{https://www.instagram.com/gaspar_maua/} ca{https://www.instagram.com/camaua/} diversidade{https://www.instagram.com/diversidademaua/} enactus{https://www.instagram.com/enactusmaua/} esports{https://www.instagram.com/esportsmaua/} inova{https://www.instagram.com/inovamaua/} mauajr{https://www.instagram.com/mauajr/} mauasocial{https://www.instagram.com/mauasocial/} mbc{https://www.instagram.com/mauabusinessclub/} nae{https://www.instagram.com/naemaua/} dev{https://www.instagram.com/devcommunitymaua/} nine{https://www.instagram.com/nine.maua/} finance{https://www.instagram.com/imtfinance/} baja{https://www.instagram.com/bajamaua/} ecomaua{https://www.instagram.com/eco_maua/} mauaracing2{https://www.instagram.com/mauaracingh2/} mauaracing{https://www.instagram.com/mauaracing/} other{}}`
  String mauaEntitiesSchemaInstagramUrl(Object entity) {
    return Intl.select(
      entity,
      {
        'atletica': 'https://www.instagram.com/gaspar_maua/',
        'ca': 'https://www.instagram.com/camaua/',
        'diversidade': 'https://www.instagram.com/diversidademaua/',
        'enactus': 'https://www.instagram.com/enactusmaua/',
        'esports': 'https://www.instagram.com/esportsmaua/',
        'inova': 'https://www.instagram.com/inovamaua/',
        'mauajr': 'https://www.instagram.com/mauajr/',
        'mauasocial': 'https://www.instagram.com/mauasocial/',
        'mbc': 'https://www.instagram.com/mauabusinessclub/',
        'nae': 'https://www.instagram.com/naemaua/',
        'dev': 'https://www.instagram.com/devcommunitymaua/',
        'nine': 'https://www.instagram.com/nine.maua/',
        'finance': 'https://www.instagram.com/imtfinance/',
        'baja': 'https://www.instagram.com/bajamaua/',
        'ecomaua': 'https://www.instagram.com/eco_maua/',
        'mauaracing2': 'https://www.instagram.com/mauaracingh2/',
        'mauaracing': 'https://www.instagram.com/mauaracing/',
        'other': '',
      },
      name: 'mauaEntitiesSchemaInstagramUrl',
      desc: '',
      args: [entity],
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

  /// `2023`
  String get year2023 {
    return Intl.message(
      '2023',
      name: 'year2023',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get dateTitle {
    return Intl.message(
      'Date',
      name: 'dateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get dayTitle {
    return Intl.message(
      'Day',
      name: 'dayTitle',
      desc: '',
      args: [],
    );
  }

  /// `February`
  String get monthFebruary {
    return Intl.message(
      'February',
      name: 'monthFebruary',
      desc: '',
      args: [],
    );
  }

  /// `January`
  String get monthJanuary {
    return Intl.message(
      'January',
      name: 'monthJanuary',
      desc: '',
      args: [],
    );
  }

  /// `10% Off`
  String get discount10 {
    return Intl.message(
      '10% Off',
      name: 'discount10',
      desc: '',
      args: [],
    );
  }

  /// `20% Off`
  String get discount20 {
    return Intl.message(
      '20% Off',
      name: 'discount20',
      desc: '',
      args: [],
    );
  }

  /// `{benefit, select, one{Video prepared by the sponsor for dissemination on the website.} two{Sponsor teaser video for disclosure in the high-impact lecture.} three{VIP booth at the Internships Fair.} four{Lecture or course to be given at the event.} five{Disclosure of the sponsor's logo on the website and in emails directed to the company's website.} six{Disclosure of the sponsor's logo on the bag.} seven{Disclosure of the sponsor on the IMT social networks.} eight{Insertion of the sponsor's folder or gift in the event bag.} nine{Space for publicizing the stand at the internship fair.} other{}}`
  String benefitsSponsorSchema(Object benefit) {
    return Intl.select(
      benefit,
      {
        'one':
            'Video prepared by the sponsor for dissemination on the website.',
        'two':
            'Sponsor teaser video for disclosure in the high-impact lecture.',
        'three': 'VIP booth at the Internships Fair.',
        'four': 'Lecture or course to be given at the event.',
        'five':
            'Disclosure of the sponsor\'s logo on the website and in emails directed to the company\'s website.',
        'six': 'Disclosure of the sponsor\'s logo on the bag.',
        'seven': 'Disclosure of the sponsor on the IMT social networks.',
        'eight': 'Insertion of the sponsor\'s folder or gift in the event bag.',
        'nine': 'Space for publicizing the stand at the internship fair.',
        'other': '',
      },
      name: 'benefitsSponsorSchema',
      desc: '',
      args: [benefit],
    );
  }

  /// `{plan, select, diamond{Diamond} gold{Gold} silver{Silver} bronze{Bronze}}`
  String planSponsorSchema(Object plan) {
    return Intl.select(
      plan,
      {
        'diamond': 'Diamond',
        'gold': 'Gold',
        'silver': 'Silver',
        'bronze': 'Bronze',
      },
      name: 'planSponsorSchema',
      desc: '',
      args: [plan],
    );
  }

  /// `{plan, select, diamond{10.000} gold{5.000} silver{3.000} bronze{1.000}}`
  String planPriceSponsorSchema(Object plan) {
    return Intl.select(
      plan,
      {
        'diamond': '10.000',
        'gold': '5.000',
        'silver': '3.000',
        'bronze': '1.000',
      },
      name: 'planPriceSponsorSchema',
      desc: '',
      args: [plan],
    );
  }

  /// `Sent with success!! Our team will contact you shortly.`
  String get successSendingSponsorEmail {
    return Intl.message(
      'Sent with success!! Our team will contact you shortly.',
      name: 'successSendingSponsorEmail',
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

  /// `{bold, select, normalPart1{If you want to talk to us, contact us on the numbers: } boldPart1{4239-3563} normalPart2{ or } boldPart2{4239-3059} normalPart3{.} other{Dev. Community Mauá}}`
  String footerContact(Object bold) {
    return Intl.select(
      bold,
      {
        'normalPart1': 'If you want to talk to us, contact us on the numbers: ',
        'boldPart1': '4239-3563',
        'normalPart2': ' or ',
        'boldPart2': '4239-3059',
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

  /// `Termination`
  String get termination {
    return Intl.message(
      'Termination',
      name: 'termination',
      desc: '',
      args: [],
    );
  }

  /// `Local`
  String get local {
    return Intl.message(
      'Local',
      name: 'local',
      desc: '',
      args: [],
    );
  }

  /// `Subscribed`
  String get subscribedTitle {
    return Intl.message(
      'Subscribed',
      name: 'subscribedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe`
  String get subcribeTitle {
    return Intl.message(
      'Subscribe',
      name: 'subcribeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to subscribe?`
  String get subscribeAlert {
    return Intl.message(
      'Are you sure you want to subscribe?',
      name: 'subscribeAlert',
      desc: '',
      args: [],
    );
  }

  /// `Pay attention to your schedules and activities that you have already subscribed for!`
  String get subscribeScheduleAtention {
    return Intl.message(
      'Pay attention to your schedules and activities that you have already subscribed for!',
      name: 'subscribeScheduleAtention',
      desc: '',
      args: [],
    );
  }

  /// `It seems that the number of vacancies for the activity has sold out :(`
  String get subscribeSlotsSoldOut {
    return Intl.message(
      'It seems that the number of vacancies for the activity has sold out :(',
      name: 'subscribeSlotsSoldOut',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to unsubscribe?`
  String get unsubscribeAlert {
    return Intl.message(
      'Are you sure you want to unsubscribe?',
      name: 'unsubscribeAlert',
      desc: '',
      args: [],
    );
  }

  /// `You will be able to subscribe again`
  String get unsubscribeAcceptingNewEnrollments {
    return Intl.message(
      'You will be able to subscribe again',
      name: 'unsubscribeAcceptingNewEnrollments',
      desc: '',
      args: [],
    );
  }

  /// `Caution: subscriptions for this activity closed, you will not be able to subscribe again`
  String get unsubscribeNotAcceptingNewEnrollments {
    return Intl.message(
      'Caution: subscriptions for this activity closed, you will not be able to subscribe again',
      name: 'unsubscribeNotAcceptingNewEnrollments',
      desc: '',
      args: [],
    );
  }

  /// `Na fila`
  String get queueTitle {
    return Intl.message(
      'Na fila',
      name: 'queueTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to exit the queue?`
  String get queueExitAlert {
    return Intl.message(
      'Are you sure you want to exit the queue?',
      name: 'queueExitAlert',
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

  /// `Exit`
  String get exitTitle {
    return Intl.message(
      'Exit',
      name: 'exitTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancelTitle {
    return Intl.message(
      'Cancel',
      name: 'cancelTitle',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get saveTitle {
    return Intl.message(
      'Save',
      name: 'saveTitle',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get loginUsernamePlaceholder {
    return Intl.message(
      'E-mail',
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

  /// `I don't have a registration`
  String get loginWithoutRecordTitle {
    return Intl.message(
      'I don\'t have a registration',
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

  /// `Select an option:`
  String get selectOptionTitle {
    return Intl.message(
      'Select an option:',
      name: 'selectOptionTitle',
      desc: '',
      args: [],
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

  /// `E-mail`
  String get registerEmailPlaceholder {
    return Intl.message(
      'E-mail',
      name: 'registerEmailPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Social name refers to the designation by which the transvestite or transsexual person identifies and is socially recognized.`
  String get registerSocialNameTooltip {
    return Intl.message(
      'Social name refers to the designation by which the transvestite or transsexual person identifies and is socially recognized.',
      name: 'registerSocialNameTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email Mauá`
  String get registerEmailProfessorPlaceholder {
    return Intl.message(
      'Enter your email Mauá',
      name: 'registerEmailProfessorPlaceholder',
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

  /// `{notification, select, email{EMAIL} sms{SMS} other{}}`
  String notificationsSchema(Object notification) {
    return Intl.select(
      notification,
      {
        'email': 'EMAIL',
        'sms': 'SMS',
        'other': '',
      },
      name: 'notificationsSchema',
      desc: '',
      args: [notification],
    );
  }

  /// `Register`
  String get registerTitle {
    return Intl.message(
      'Register',
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

  /// `Check that all fields are filled in correctly.`
  String get confirmAllFieldsConrrectlyFilled {
    return Intl.message(
      'Check that all fields are filled in correctly.',
      name: 'confirmAllFieldsConrrectlyFilled',
      desc: '',
      args: [],
    );
  }

  /// `Required field`
  String get fieldRequired {
    return Intl.message(
      'Required field',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid field`
  String get fieldInvalid {
    return Intl.message(
      'Invalid field',
      name: 'fieldInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Enter your full name`
  String get fieldFullNameRequired {
    return Intl.message(
      'Enter your full name',
      name: 'fieldFullNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid e-mail`
  String get fieldEmailInvalid {
    return Intl.message(
      'Invalid e-mail',
      name: 'fieldEmailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Invalid professor e-mail`
  String get fieldProfessorEmailInvalid {
    return Intl.message(
      'Invalid professor e-mail',
      name: 'fieldProfessorEmailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `E-mails must be the same`
  String get fieldEmailsEqualsRequired {
    return Intl.message(
      'E-mails must be the same',
      name: 'fieldEmailsEqualsRequired',
      desc: '',
      args: [],
    );
  }

  /// `The "Password" and "Confirm your password" fields must be the same`
  String get fieldPasswordEqualsRequired {
    return Intl.message(
      'The "Password" and "Confirm your password" fields must be the same',
      name: 'fieldPasswordEqualsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Your password must contain: \n - One or more uppercase letters \n - One or more lowercase letters \n - One or more numbers \n - One or more special characters\n(#, ?, !, @, $, %, ^, &, *, -) \n - Minimum 8 characters`
  String get fieldPasswordRequisits {
    return Intl.message(
      'Your password must contain: \n - One or more uppercase letters \n - One or more lowercase letters \n - One or more numbers \n - One or more special characters\n(#, ?, !, @, \$, %, ^, &, *, -) \n - Minimum 8 characters',
      name: 'fieldPasswordRequisits',
      desc: '',
      args: [],
    );
  }

  /// `Enter the number with DDD`
  String get fieldDDDRequired {
    return Intl.message(
      'Enter the number with DDD',
      name: 'fieldDDDRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid RA`
  String get fieldRAInvalid {
    return Intl.message(
      'Invalid RA',
      name: 'fieldRAInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Fill in all fields!`
  String get fieldFillAllRequired {
    return Intl.message(
      'Fill in all fields!',
      name: 'fieldFillAllRequired',
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

  /// `Presence Validate`
  String get presenceValidateTitle {
    return Intl.message(
      'Presence Validate',
      name: 'presenceValidateTitle',
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

  /// `Email successfully sent!`
  String get successEmailSend {
    return Intl.message(
      'Email successfully sent!',
      name: 'successEmailSend',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to continue?`
  String get confirmToContinue {
    return Intl.message(
      'Are you sure you want to continue?',
      name: 'confirmToContinue',
      desc: '',
      args: [],
    );
  }

  /// `When saving all old data will be lost.`
  String get lostOldDataWarn {
    return Intl.message(
      'When saving all old data will be lost.',
      name: 'lostOldDataWarn',
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

  /// `Password changed successfully!`
  String get successChangePassword {
    return Intl.message(
      'Password changed successfully!',
      name: 'successChangePassword',
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

  /// `There was an error loading activities :(`
  String get errorGenericGetActivities {
    return Intl.message(
      'There was an error loading activities :(',
      name: 'errorGenericGetActivities',
      desc: '',
      args: [],
    );
  }

  /// `Administrator Page`
  String get admDashboardAppBarTitle {
    return Intl.message(
      'Administrator Page',
      name: 'admDashboardAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get admReportsTitle {
    return Intl.message(
      'Reports',
      name: 'admReportsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Clean Filters`
  String get cleanFiltersTitle {
    return Intl.message(
      'Clean Filters',
      name: 'cleanFiltersTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create Activity`
  String get activityCreateTitle {
    return Intl.message(
      'Create Activity',
      name: 'activityCreateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit Activity`
  String get activityEditTitle {
    return Intl.message(
      'Edit Activity',
      name: 'activityEditTitle',
      desc: '',
      args: [],
    );
  }

  /// `Activity Type`
  String get activityTypeTitle {
    return Intl.message(
      'Activity Type',
      name: 'activityTypeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Activity Title`
  String get activityNameTitle {
    return Intl.message(
      'Activity Title',
      name: 'activityNameTitle',
      desc: '',
      args: [],
    );
  }

  /// `Company:`
  String get companyTitle {
    return Intl.message(
      'Company:',
      name: 'companyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get descriptionTitle {
    return Intl.message(
      'Description',
      name: 'descriptionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Hora`
  String get hourTitle {
    return Intl.message(
      'Hora',
      name: 'hourTitle',
      desc: '',
      args: [],
    );
  }

  /// `Schedule`
  String get scheduleTitle {
    return Intl.message(
      'Schedule',
      name: 'scheduleTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add Schedule`
  String get scheduleAddTitle {
    return Intl.message(
      'Add Schedule',
      name: 'scheduleAddTitle',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get codeTitle {
    return Intl.message(
      'Code',
      name: 'codeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Local`
  String get localTitle {
    return Intl.message(
      'Local',
      name: 'localTitle',
      desc: '',
      args: [],
    );
  }

  /// `Looks like you haven't signed up for any activities yet :(`
  String get noActivitiesEnrolledText {
    return Intl.message(
      'Looks like you haven\'t signed up for any activities yet :(',
      name: 'noActivitiesEnrolledText',
      desc: '',
      args: [],
    );
  }

  /// `Looks like you are not responsible for any activity :(`
  String get noResponsibleActivitiesText {
    return Intl.message(
      'Looks like you are not responsible for any activity :(',
      name: 'noResponsibleActivitiesText',
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

  /// `Registration unavailabe for this activity!`
  String get unavailabeActivityRegistration {
    return Intl.message(
      'Registration unavailabe for this activity!',
      name: 'unavailabeActivityRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you wanna unsubscribe?`
  String get unsubscribeVerification {
    return Intl.message(
      'Are you sure you wanna unsubscribe?',
      name: 'unsubscribeVerification',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you wanna subscribe?`
  String get subscribeVerification {
    return Intl.message(
      'Are you sure you wanna subscribe?',
      name: 'subscribeVerification',
      desc: '',
      args: [],
    );
  }

  /// `Carefull! The subscriptions for this activity havealready been closed, yo will not be able to subscribe on this activity again!`
  String get unsubscribeVerificationClosedRegistration {
    return Intl.message(
      'Carefull! The subscriptions for this activity havealready been closed, yo will not be able to subscribe on this activity again!',
      name: 'unsubscribeVerificationClosedRegistration',
      desc: '',
      args: [],
    );
  }

  /// `You will lose your vacancy by continuing!`
  String get unsubscribeLoseVanacy {
    return Intl.message(
      'You will lose your vacancy by continuing!',
      name: 'unsubscribeLoseVanacy',
      desc: '',
      args: [],
    );
  }

  /// `It seems that the number of vacancies for this activity has run out :(`
  String get availabeSpotUnsuficient {
    return Intl.message(
      'It seems that the number of vacancies for this activity has run out :(',
      name: 'availabeSpotUnsuficient',
      desc: '',
      args: [],
    );
  }

  /// `Keep in mind of your schedules and activities that you have already signed up for!`
  String get scheduleActivityWarning {
    return Intl.message(
      'Keep in mind of your schedules and activities that you have already signed up for!',
      name: 'scheduleActivityWarning',
      desc: '',
      args: [],
    );
  }

  /// `It seems you are already subscribed on another activity at this period.`
  String get alreadySubscribedOnThisPeriodWarning {
    return Intl.message(
      'It seems you are already subscribed on another activity at this period.',
      name: 'alreadySubscribedOnThisPeriodWarning',
      desc: '',
      args: [],
    );
  }

  /// `The registration for this activity is unavailabe!`
  String get unavailabeSubscribe {
    return Intl.message(
      'The registration for this activity is unavailabe!',
      name: 'unavailabeSubscribe',
      desc: '',
      args: [],
    );
  }

  /// `Activities`
  String get drawerActivitiesButton {
    return Intl.message(
      'Activities',
      name: 'drawerActivitiesButton',
      desc: '',
      args: [],
    );
  }

  /// `Certificates`
  String get drawerCertificatesButton {
    return Intl.message(
      'Certificates',
      name: 'drawerCertificatesButton',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get drawerHelpButton {
    return Intl.message(
      'Help',
      name: 'drawerHelpButton',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get drawerHomeButton {
    return Intl.message(
      'Home',
      name: 'drawerHomeButton',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get drawerProfileButton {
    return Intl.message(
      'Profile',
      name: 'drawerProfileButton',
      desc: '',
      args: [],
    );
  }

  /// `Responsible Activities`
  String get drawerResponsibleActivitiesButton {
    return Intl.message(
      'Responsible Activities',
      name: 'drawerResponsibleActivitiesButton',
      desc: '',
      args: [],
    );
  }
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
