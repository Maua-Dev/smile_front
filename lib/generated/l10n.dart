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

  /// `Atividades`
  String get activitiesTitle {
    return Intl.message(
      'Atividades',
      name: 'activitiesTitle',
      desc: '',
      args: [],
    );
  }

  /// `{activity, select, CURSOS{Courses} PALESTRAS{Speeches} PALESTRAS_ALTO_IMPACTO{High Impact Speeches} VISITAS_TECNICAS{Technical Visits} COMPETICOES_ACADEMICAS{Academic Competitions} hackathon{Hackathon} FEIRA_ESTAGIOS{Internship Fairs} CAFE_EX_ALUNOS{Coffeee with alumni} ACADEMIA_DE_PROFESSORES{Teachers Academy} ATIVIDADE_CULTURAL{Cultural Activity} gcsp{GCSP} ATIVIDADE_ESPORTIVA{Sport Activity} other{Activities}}`
  String activitiesOfferedName(Object activity) {
    return Intl.select(
      activity,
      {
        'CURSOS': 'Courses',
        'PALESTRAS': 'Speeches',
        'PALESTRAS_ALTO_IMPACTO': 'High Impact Speeches',
        'VISITAS_TECNICAS': 'Technical Visits',
        'COMPETICOES_ACADEMICAS': 'Academic Competitions',
        'hackathon': 'Hackathon',
        'FEIRA_ESTAGIOS': 'Internship Fairs',
        'CAFE_EX_ALUNOS': 'Coffeee with alumni',
        'ACADEMIA_DE_PROFESSORES': 'Teachers Academy',
        'ATIVIDADE_CULTURAL': 'Cultural Activity',
        'gcsp': 'GCSP',
        'ATIVIDADE_ESPORTIVA': 'Sport Activity',
        'other': 'Activities',
      },
      name: 'activitiesOfferedName',
      desc: '',
      args: [activity],
    );
  }

  /// `{activity, select, CURSOS{The courses offer high quality content, taught by renowned professionals who are active in the market. The courses offer training and updating of participants through theoretical/practical knowledge in the various areas of Administration, Computer Science, Design, Engineering and Information Systems.} PALESTRAS{The lectures are free and will include the participation of professionals from leading companies in the market, talking about the Challenges of Humanity.} PALESTRAS_ALTO_IMPACTO{The high-impact lectures will be delivered by highly qualified professionals in their respective areas of expertise and highlighted in the current media. Sign up as soon as possible and secure your spot!} VISITAS_TECNICAS{In search of a connection between the academic world and the job market, during SMILE technical visits will be offered to companies.} COMPETICOES_ACADEMICAS{During SMILE, participants will be able to have fun with Academic Competition activities: League Of Legend Championship (online) and GameDev Mauá - Game Jam (in person).} hackathon{Hackathons are events that bring together students, software developers, designers and other professionals, with the aim of creating innovative solutions for a specific problem in a short period of time. This is an excellent opportunity to develop your professional side, in addition to discovering new talent. The events promote a great interaction between the participants and offer prizes for the winners at the end.} FEIRA_ESTAGIOS{Representatives of renowned companies will present Internship and Trainee Programs, in addition to bringing tips on selection processes, interviews, career tips and answering questions from participants.} CAFE_EX_ALUNOS{The activity aims to promote informal conversations between IMT students and graduates who occupy prominent positions in their areas of expertise. Come join!} ACADEMIA_DE_PROFESSORES{Academia de Professores focuses on continuing education, dissemination of teaching strategies and tools for IMT teachers and high school teachers.} ATIVIDADE_CULTURAL{Are you part of a band? Sing? Do you play any instrument? Do you like poetry, literature? Do you do theater? Dance? Come share your talent with us! It will be an afternoon of presentations, integration and lots of fun on campus.} gcsp{The GCSP - Grand Challenges Scholars Program is a program that offers undergraduate students the opportunity to work with the great challenges of humanity, being mentored by professors.} ATIVIDADE_ESPORTIVA{Participants will discover two interesting activities: spikeball and flag football. In addition, various activities will also be offered, such as functional gymnastics, energizing meditation and pilates! All participants will be able to interact with the speaker and teachers! Follow and participate!} other{Activity}}`
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
        'hackathon':
            'Hackathons are events that bring together students, software developers, designers and other professionals, with the aim of creating innovative solutions for a specific problem in a short period of time. This is an excellent opportunity to develop your professional side, in addition to discovering new talent. The events promote a great interaction between the participants and offer prizes for the winners at the end.',
        'FEIRA_ESTAGIOS':
            'Representatives of renowned companies will present Internship and Trainee Programs, in addition to bringing tips on selection processes, interviews, career tips and answering questions from participants.',
        'CAFE_EX_ALUNOS':
            'The activity aims to promote informal conversations between IMT students and graduates who occupy prominent positions in their areas of expertise. Come join!',
        'ACADEMIA_DE_PROFESSORES':
            'Academia de Professores focuses on continuing education, dissemination of teaching strategies and tools for IMT teachers and high school teachers.',
        'ATIVIDADE_CULTURAL':
            'Are you part of a band? Sing? Do you play any instrument? Do you like poetry, literature? Do you do theater? Dance? Come share your talent with us! It will be an afternoon of presentations, integration and lots of fun on campus.',
        'gcsp':
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
