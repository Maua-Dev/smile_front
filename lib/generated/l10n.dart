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

  /// `O que é a semana SMILE?`
  String get whatIsSmile {
    return Intl.message(
      'O que é a semana SMILE?',
      name: 'whatIsSmile',
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

  /// `Speakers`
  String get speakersTitle {
    return Intl.message(
      'Speakers',
      name: 'speakersTitle',
      desc: '',
      args: [],
    );
  }

  /// `Panels`
  String get panelsTitle {
    return Intl.message(
      'Panels',
      name: 'panelsTitle',
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

  /// `{speakers, select, bruno{Bruno Keizo – Mauá Jr.} wellington{Wellington Vitorino} vanessa{Vanessa Piratelo Occhipinti} andressa{Andressa Martins} flavia{Flávia Janine Rosante Beo} daniela{Daniela Klaiman} jonathan{Jonathan Y. Ando Nelson} sonia{Sonia Guimarães} renato{Renato Grau} ana{Ana Cristina Caldeira} helga{Helga Braren Zepf} gustavo{Gustavo Paganini Canal} joseph{Joseph Youssif Saab Junior} other{}}`
  String speakersSchemaName(Object speakers) {
    return Intl.select(
      speakers,
      {
        'bruno': 'Bruno Keizo – Mauá Jr.',
        'wellington': 'Wellington Vitorino',
        'vanessa': 'Vanessa Piratelo Occhipinti',
        'andressa': 'Andressa Martins',
        'flavia': 'Flávia Janine Rosante Beo',
        'daniela': 'Daniela Klaiman',
        'jonathan': 'Jonathan Y. Ando Nelson',
        'sonia': 'Sonia Guimarães',
        'renato': 'Renato Grau',
        'ana': 'Ana Cristina Caldeira',
        'helga': 'Helga Braren Zepf',
        'gustavo': 'Gustavo Paganini Canal',
        'joseph': 'Joseph Youssif Saab Junior',
        'other': '',
      },
      name: 'speakersSchemaName',
      desc: '',
      args: [speakers],
    );
  }

  /// `{speakers, select, bruno{Current Vice President of the junior consulting firm, Mauá Jr. Student of the third year of Production Engineering at the Mauá Institute of Technology and Electronics Technician graduated from the Federal Institute of São Paulo (IFSP). A very curious person who likes to explore new challenges and get to know new environments. Interested in languages ​​and new cultures, he is always willing to acquire new knowledge.} wellington{He founded Instituto Four, the organization responsible for ProLider, the largest leadership training program in Brazil. He idealized the Four Summit, one of the biggest discussion events in Brazil on Brazilian soil. In recognition of his work, he was invited to speak at Harvard University. He was elected Forbes Under 30 by Forbes magazine, being the highlight in the Third Sector and Social Impact category and the youngest director of the Brazilian Sailing Confederation. In 2021 he was approved at the MIT MBA in Boston in the United States.} vanessa{She has over 20 years of experience in Sales Management, Marketing and Business, Product and Market Development, Innovation, Strategy and Projects, mainly in the Chemical, Pharmaceutical, Cosmetic and Food areas. Today she serves as Global Director of Distribution Channels in an American multinational company. She is an inclusive leader and throughout her career she has gained solid experience in managing multicultural teams through global and regional positions in Brazil, Germany, Italy and currently in Spain in complex matrix structures.} andressa{Control and Automation Engineer and master in Aerospace Systems and Mechatronics, she is currently a professor at the Mauá Institute of Technology. Professor of the robotics team at IMT, she works mainly in the disciplines of industrial automation and engineering fundamentals.} daniela{Graduated in 'Technology and Futurism' from the Hebrew University of Jerusalem and post-graduated in 'Trends Research' from the University of Barcelona, ​​she was Research and Trends Director at Box1824 for 5 years, Consumer Insights Manager at Nike Spain and is a professor of Coolhunting and Futurism at the ESPM University of São Paulo for 12 years. With nearly 20 years of experience working in consumer behavior and new technologies, she is the founder and CEO of FutureFuture, a leading forecasting and strategy firm that helps leaders and Fortune 500 organizations prepare, strategize and innovate in a climate of complex futures} jonathan{Lawyer, post graduate from PUC/SP, certified in privacy and data protection by Data Privacy Brasil and Exin; certified as DPO by Instituto Totum; completed the IAPP Privacy Program Management Training and the Personal Data Protection course at Insper; he is certified by ICSI/UK in Cyber ​​Security, has extensive experience in innovation and technology projects and is a mentor at Ace Startups.} sonia{Associate Professor I at the Institute of Aeronautical Technology (ITA) and PhD in physics from the University of Manchester (UK). Sonia is the first black woman to have a doctorate in physics in Brazil, graduating in 1989, a title that led her to become a professor at ITA when the institute still did not accept women among its students, in 1993. At the time, she also became the first woman black teacher at the institution, which is one of the most traditional in Brazil. Born in São Paulo (SP), he currently lives in São José dos Campos, where he continues to teach at ITA.} flavia{Computer Engineer and Master in Computer Science with more than 6 years of experience in technology. Throughout his career, he has worked on the design and implementation of IBM's internal scope web applications. His Master's line of research was quantum computing and the performance improvement that can exist for machine learning applications in relation to conventional computing. Currently, she is a Senior Software Engineer in the research area at IBM, developing applications for geolocation inference foundation models. She also teaches at the Mauá Institute of Technology, the institution where she graduated, and as an Assistant Professor, she works in undergraduate IT courses. Participates in initiatives to engage women in technical careers and in technology community events.} renato{Entrepreneur and businessman for more than 25 years, passionate about Innovation, Technology, People and Futurism, subject in which he is certified by Aerolito in the 3 Waves methodology; Startup mentor; Lecturer and Author of articles and contents that seek to collaborate with the improvement of our world; Founder and CEO of Innovision, CDO of 24x7 Support and other Companies; Creator and Moderator of the PodCast Trends News and Author of the Newsletter Carta do Specialist; Founding partner, former President and Advisor of ITESCS (Institute of Technology of São Caetano do Sul); Creator of the Local Productive Arrangement of ICT Companies in São Caetano do Sul and Region; Ambassador and Counselor of the Brazil Digital for All Movement.} ana{Graduated in Psychology from the Institute of Psychology at USP, in 1995. Specialization in Psychodrama from the Sedes Sapientiae Institute, in 2006. Personal and Executive Coach from ICI, in 2011. Level 2 and 3 Psychodrama from SOPSP, in 2020. Socio-emotional education in environments of teaching-learning, by Instituto Sedes Sapientiae in 2018. Guidance and inclusive education: theory and practice by PUC-Cogeae in 2010.} helga{Innovative, performance-driven, and highly creative professional offering years of experience in engineering research, complemented with a solid academic foundation in mechanical engineering. Well-versed in planning and conducting engineering research requiring judgment in the independent evaluation, selection, and substantial adaptation and modification of standard engineering and scientific techniques. Excel in developing solutions to complex problems that require regular application of scientific and engineering principles. Demonstrates and applies through engineering methods, research protocols, assessment instruments, and data interpretation.} gustavo{Responsible for the reform project of the Nuclear Fusion Reactor at IF-USP. PhD from Ecole Polytechnique Fédérale de Lausanne, Switzerland, in Plasma Physics and Thermonuclear Fusion. He did postdoctoral work at the American technology company General Atomics - Fusion Division. He worked at the Princeton Plasma Physics Laboratory. After 8 years working in nuclear fusion abroad, he decided to return to Brazil to contribute to the development of nuclear fusion here. Today he is an Associate Professor at the Physics Institute of the University of São Paulo and, currently, he coordinates the TCABR tokamak modernization project. He was the first author of the National Nuclear Fusion Program, which was submitted to the Ministry of Science, Technology and Innovation. It has also collaborated with the National Nuclear Energy Commission in the development of nuclear fusion at the national level.} joseph{Founding Member of the Poli-Wind Wind Energy Group and member of the Research Group on Renewable Energy, Sustainability and the Environment at IMT. Coordinator of the Grand Challenges Scholars Program at IMT. Teaching experience in Energy and Fluids (theory and laboratories) since 1997. Practical experience in aircraft maintenance, engines (gas turbines), aeronautical components and systems, conceptual design of aircraft, CFD simulation and analysis simulation systems dynamics. Active researcher in wind energy, aerodynamics, renewable energies and their impact on the environment. Active entrepreneur with experience in managing companies, teams and projects.} other{}}`
  String speakersSchemaDescription(Object speakers) {
    return Intl.select(
      speakers,
      {
        'bruno':
            'Current Vice President of the junior consulting firm, Mauá Jr. Student of the third year of Production Engineering at the Mauá Institute of Technology and Electronics Technician graduated from the Federal Institute of São Paulo (IFSP). A very curious person who likes to explore new challenges and get to know new environments. Interested in languages ​​and new cultures, he is always willing to acquire new knowledge.',
        'wellington':
            'He founded Instituto Four, the organization responsible for ProLider, the largest leadership training program in Brazil. He idealized the Four Summit, one of the biggest discussion events in Brazil on Brazilian soil. In recognition of his work, he was invited to speak at Harvard University. He was elected Forbes Under 30 by Forbes magazine, being the highlight in the Third Sector and Social Impact category and the youngest director of the Brazilian Sailing Confederation. In 2021 he was approved at the MIT MBA in Boston in the United States.',
        'vanessa':
            'She has over 20 years of experience in Sales Management, Marketing and Business, Product and Market Development, Innovation, Strategy and Projects, mainly in the Chemical, Pharmaceutical, Cosmetic and Food areas. Today she serves as Global Director of Distribution Channels in an American multinational company. She is an inclusive leader and throughout her career she has gained solid experience in managing multicultural teams through global and regional positions in Brazil, Germany, Italy and currently in Spain in complex matrix structures.',
        'andressa':
            'Control and Automation Engineer and master in Aerospace Systems and Mechatronics, she is currently a professor at the Mauá Institute of Technology. Professor of the robotics team at IMT, she works mainly in the disciplines of industrial automation and engineering fundamentals.',
        'daniela':
            'Graduated in \'Technology and Futurism\' from the Hebrew University of Jerusalem and post-graduated in \'Trends Research\' from the University of Barcelona, ​​she was Research and Trends Director at Box1824 for 5 years, Consumer Insights Manager at Nike Spain and is a professor of Coolhunting and Futurism at the ESPM University of São Paulo for 12 years. With nearly 20 years of experience working in consumer behavior and new technologies, she is the founder and CEO of FutureFuture, a leading forecasting and strategy firm that helps leaders and Fortune 500 organizations prepare, strategize and innovate in a climate of complex futures',
        'jonathan':
            'Lawyer, post graduate from PUC/SP, certified in privacy and data protection by Data Privacy Brasil and Exin; certified as DPO by Instituto Totum; completed the IAPP Privacy Program Management Training and the Personal Data Protection course at Insper; he is certified by ICSI/UK in Cyber ​​Security, has extensive experience in innovation and technology projects and is a mentor at Ace Startups.',
        'sonia':
            'Associate Professor I at the Institute of Aeronautical Technology (ITA) and PhD in physics from the University of Manchester (UK). Sonia is the first black woman to have a doctorate in physics in Brazil, graduating in 1989, a title that led her to become a professor at ITA when the institute still did not accept women among its students, in 1993. At the time, she also became the first woman black teacher at the institution, which is one of the most traditional in Brazil. Born in São Paulo (SP), he currently lives in São José dos Campos, where he continues to teach at ITA.',
        'flavia':
            'Computer Engineer and Master in Computer Science with more than 6 years of experience in technology. Throughout his career, he has worked on the design and implementation of IBM\'s internal scope web applications. His Master\'s line of research was quantum computing and the performance improvement that can exist for machine learning applications in relation to conventional computing. Currently, she is a Senior Software Engineer in the research area at IBM, developing applications for geolocation inference foundation models. She also teaches at the Mauá Institute of Technology, the institution where she graduated, and as an Assistant Professor, she works in undergraduate IT courses. Participates in initiatives to engage women in technical careers and in technology community events.',
        'renato':
            'Entrepreneur and businessman for more than 25 years, passionate about Innovation, Technology, People and Futurism, subject in which he is certified by Aerolito in the 3 Waves methodology; Startup mentor; Lecturer and Author of articles and contents that seek to collaborate with the improvement of our world; Founder and CEO of Innovision, CDO of 24x7 Support and other Companies; Creator and Moderator of the PodCast Trends News and Author of the Newsletter Carta do Specialist; Founding partner, former President and Advisor of ITESCS (Institute of Technology of São Caetano do Sul); Creator of the Local Productive Arrangement of ICT Companies in São Caetano do Sul and Region; Ambassador and Counselor of the Brazil Digital for All Movement.',
        'ana':
            'Graduated in Psychology from the Institute of Psychology at USP, in 1995. Specialization in Psychodrama from the Sedes Sapientiae Institute, in 2006. Personal and Executive Coach from ICI, in 2011. Level 2 and 3 Psychodrama from SOPSP, in 2020. Socio-emotional education in environments of teaching-learning, by Instituto Sedes Sapientiae in 2018. Guidance and inclusive education: theory and practice by PUC-Cogeae in 2010.',
        'helga':
            'Innovative, performance-driven, and highly creative professional offering years of experience in engineering research, complemented with a solid academic foundation in mechanical engineering. Well-versed in planning and conducting engineering research requiring judgment in the independent evaluation, selection, and substantial adaptation and modification of standard engineering and scientific techniques. Excel in developing solutions to complex problems that require regular application of scientific and engineering principles. Demonstrates and applies through engineering methods, research protocols, assessment instruments, and data interpretation.',
        'gustavo':
            'Responsible for the reform project of the Nuclear Fusion Reactor at IF-USP. PhD from Ecole Polytechnique Fédérale de Lausanne, Switzerland, in Plasma Physics and Thermonuclear Fusion. He did postdoctoral work at the American technology company General Atomics - Fusion Division. He worked at the Princeton Plasma Physics Laboratory. After 8 years working in nuclear fusion abroad, he decided to return to Brazil to contribute to the development of nuclear fusion here. Today he is an Associate Professor at the Physics Institute of the University of São Paulo and, currently, he coordinates the TCABR tokamak modernization project. He was the first author of the National Nuclear Fusion Program, which was submitted to the Ministry of Science, Technology and Innovation. It has also collaborated with the National Nuclear Energy Commission in the development of nuclear fusion at the national level.',
        'joseph':
            'Founding Member of the Poli-Wind Wind Energy Group and member of the Research Group on Renewable Energy, Sustainability and the Environment at IMT. Coordinator of the Grand Challenges Scholars Program at IMT. Teaching experience in Energy and Fluids (theory and laboratories) since 1997. Practical experience in aircraft maintenance, engines (gas turbines), aeronautical components and systems, conceptual design of aircraft, CFD simulation and analysis simulation systems dynamics. Active researcher in wind energy, aerodynamics, renewable energies and their impact on the environment. Active entrepreneur with experience in managing companies, teams and projects.',
        'other': '',
      },
      name: 'speakersSchemaDescription',
      desc: '',
      args: [speakers],
    );
  }

  /// `Developing leaders of the future: skills, challenges and opportunities`
  String get speakersPanelTitle1 {
    return Intl.message(
      'Developing leaders of the future: skills, challenges and opportunities',
      name: 'speakersPanelTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Technology in transformation: impacts on society, education and the labor market`
  String get speakersPanelTitle2 {
    return Intl.message(
      'Technology in transformation: impacts on society, education and the labor market',
      name: 'speakersPanelTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Humanity's Great Challenges`
  String get speakersPanelTitle3 {
    return Intl.message(
      'Humanity\'s Great Challenges',
      name: 'speakersPanelTitle3',
      desc: '',
      args: [],
    );
  }

  /// `In this panel, we will explore how leadership is being shaped to act in an ever-changing environment, whether in business, technology, culture or even society, and how leaders can prepare for the future.`
  String get speakersPanelDescription1 {
    return Intl.message(
      'In this panel, we will explore how leadership is being shaped to act in an ever-changing environment, whether in business, technology, culture or even society, and how leaders can prepare for the future.',
      name: 'speakersPanelDescription1',
      desc: '',
      args: [],
    );
  }

  /// `Participants will have the opportunity to learn more about how technology is transforming the way we live, work, relate and interact, as well as the ethical, social and economic implications of these changes.`
  String get speakersPanelDescription2 {
    return Intl.message(
      'Participants will have the opportunity to learn more about how technology is transforming the way we live, work, relate and interact, as well as the ethical, social and economic implications of these changes.',
      name: 'speakersPanelDescription2',
      desc: '',
      args: [],
    );
  }

  /// `In this panel, we will discuss topics of great relevance, such as sustainability, safety, health and the joy of living.`
  String get speakersPanelDescription3 {
    return Intl.message(
      'In this panel, we will discuss topics of great relevance, such as sustainability, safety, health and the joy of living.',
      name: 'speakersPanelDescription3',
      desc: '',
      args: [],
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

  /// `Your next activity`
  String get nextActivityTitle {
    return Intl.message(
      'Your next activity',
      name: 'nextActivityTitle',
      desc: '',
      args: [],
    );
  }

  /// `Activities and Events`
  String get activitiesAndEventsTitle {
    return Intl.message(
      'Activities and Events',
      name: 'activitiesAndEventsTitle',
      desc: '',
      args: [],
    );
  }

  /// `{activity, select, COURSE{Courses} LECTURES{Speeches} PANELS{Panels} TECHNICAL_VISITS{Technical Visits} ACADEMIC_COMPETITIONS{Academic Competitions} HACKATHON{Hackathon} INTERNSHIP_FAIR{Internship Fairs} ALUMNI_CAFE{Coffeee with alumni} PROFESSORS_ACADEMY{Teachers Academy} CULTURAL_ACTIVITY{Cultural Activity} MAUA_PLUS{Mauá+} SPORTS_ACTIVITY{Sport Activity} INTERNATIONAL_WORKSHOP{International Workshop} ENGINEERING{Engineering} other{Activities}}`
  String activitiesOfferedName(Object activity) {
    return Intl.select(
      activity,
      {
        'COURSE': 'Courses',
        'LECTURES': 'Speeches',
        'PANELS': 'Panels',
        'TECHNICAL_VISITS': 'Technical Visits',
        'ACADEMIC_COMPETITIONS': 'Academic Competitions',
        'HACKATHON': 'Hackathon',
        'INTERNSHIP_FAIR': 'Internship Fairs',
        'ALUMNI_CAFE': 'Coffeee with alumni',
        'PROFESSORS_ACADEMY': 'Teachers Academy',
        'CULTURAL_ACTIVITY': 'Cultural Activity',
        'MAUA_PLUS': 'Mauá+',
        'SPORTS_ACTIVITY': 'Sport Activity',
        'INTERNATIONAL_WORKSHOP': 'International Workshop',
        'ENGINEERING': 'Engineering',
        'other': 'Activities',
      },
      name: 'activitiesOfferedName',
      desc: '',
      args: [activity],
    );
  }

  /// `{activity, select, COURSE{The courses offer high quality content, taught by renowned professionals who are active in the market. The courses offer training and updating of participants through theoretical/practical knowledge in the various areas of Administration, Computer Science, Design, Engineering and Information Systems.} LECTURES{The lectures are free and will include the participation of professionals from leading companies in the market, talking about the Challenges of Humanity.} PANELS{The panels will be carried out by highly qualified professionals in their respective areas of expertise and highlighted in the current media. Sign up as soon as possible and secure your spot!} TECHNICAL_VISITS{In search of a connection between the academic world and the job market, during SMILE technical visits will be offered to companies.} INTERNATIONAL_WORKSHOP{Workshops in English promoted by professionals from international institutions. Come check! Entrepreneurial Mindset as a Lens for Transforming the Educational Experience with Dr. Katie Evans of Houston Christian University and the Workshop of Entrepreneurship for Eureka participants (2023) with Dr. Maribel Guerrero of Arizona State University.} ACADEMIC_COMPETITIONS{During a SMILE, participants will be able to have fun with Academic Competition activities: Valorant Championship, Leadership Games and RoboChallenge BR by Mauá.} HACKATHON{Hackathons are events that bring together students, software developers, designers and other professionals, with the aim of creating innovative solutions for a specific problem in a short period of time. This is an excellent opportunity to develop your professional side, in addition to discovering new talent. The events promote a great interaction between the participants and offer prizes for the winners at the end.} INTERNSHIP_FAIR{Representatives of renowned companies will present Internship and Trainee Programs, in addition to bringing tips on selection processes, interviews, career tips and answering questions from participants.} ALUMNI_CAFE{The activity aims to promote informal conversations between IMT students and graduates who occupy prominent positions in their areas of expertise. Come join!} PROFESSORS_ACADEMY{Teachers Academy focuses on continuing education, dissemination of teaching strategies and tools for IMT teachers and high school teachers.} CULTURAL_ACTIVITY{Are you part of a band? Sing? Do you play any instrument? Do you like poetry, literature? Do you do theater? Dance? Come share your talent with us! It will be an afternoon of presentations, integration and lots of fun on campus.} SPORTS_ACTIVITY{Participants will learn about activities such as: Iaido, Kendo, Jodo and Judo and other activities that are offered in the activities grid at CEAF (Centre for Sports and Physical Activities of the Mauá Institute - SCS Campus): Beach Tennis, Functional Gymnastics. Meditation, Pilates and Rugby.} other{Activity}}`
  String activitiesOfferedDescription(Object activity) {
    return Intl.select(
      activity,
      {
        'COURSE':
            'The courses offer high quality content, taught by renowned professionals who are active in the market. The courses offer training and updating of participants through theoretical/practical knowledge in the various areas of Administration, Computer Science, Design, Engineering and Information Systems.',
        'LECTURES':
            'The lectures are free and will include the participation of professionals from leading companies in the market, talking about the Challenges of Humanity.',
        'PANELS':
            'The panels will be carried out by highly qualified professionals in their respective areas of expertise and highlighted in the current media. Sign up as soon as possible and secure your spot!',
        'TECHNICAL_VISITS':
            'In search of a connection between the academic world and the job market, during SMILE technical visits will be offered to companies.',
        'INTERNATIONAL_WORKSHOP':
            'Workshops in English promoted by professionals from international institutions. Come check! Entrepreneurial Mindset as a Lens for Transforming the Educational Experience with Dr. Katie Evans of Houston Christian University and the Workshop of Entrepreneurship for Eureka participants (2023) with Dr. Maribel Guerrero of Arizona State University.',
        'ACADEMIC_COMPETITIONS':
            'During a SMILE, participants will be able to have fun with Academic Competition activities: Valorant Championship, Leadership Games and RoboChallenge BR by Mauá.',
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
        'SPORTS_ACTIVITY':
            'Participants will learn about activities such as: Iaido, Kendo, Jodo and Judo and other activities that are offered in the activities grid at CEAF (Centre for Sports and Physical Activities of the Mauá Institute - SCS Campus): Beach Tennis, Functional Gymnastics. Meditation, Pilates and Rugby.',
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

  /// `Access the full schedule`
  String get allActivities {
    return Intl.message(
      'Access the full schedule',
      name: 'allActivities',
      desc: '',
      args: [],
    );
  }

  /// `Click here to download the pdf with the event schedule.`
  String get clickTodownload {
    return Intl.message(
      'Click here to download the pdf with the event schedule.',
      name: 'clickTodownload',
      desc: '',
      args: [],
    );
  }

  /// `Access PDF with the schedule`
  String get clickToAccessPDF {
    return Intl.message(
      'Access PDF with the schedule',
      name: 'clickToAccessPDF',
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

  /// `MAUÁ+`
  String get mauaEntititesTitle {
    return Intl.message(
      'MAUÁ+',
      name: 'mauaEntititesTitle',
      desc: '',
      args: [],
    );
  }

  /// `{entity, select, atletica{gaspar_maua} ca{camaua} diversidade{diversidademaua} enactus{enactusmaua} esports{esportsmaua} inova{inovamaua} mauajr{mauajr} mauasocial{mauasocial} mbc{mauabusiness} nae{naemaua} dev{devcommunitymaua} nine{nine.maua} finance{imtfinance} baja{bajamaua} ecomaua{eco_maua} mauaracing2{mauaracingh2} bateria{bateriamaua} mauaracing{mauaracing} other{}}`
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
        'bateria': 'bateriamaua',
        'mauaracing': 'mauaracing',
        'other': '',
      },
      name: 'mauaEntitiesSchemaSocialMidia',
      desc: '',
      args: [entity],
    );
  }

  /// `{entity, select, atletica{https://www.instagram.com/gaspar_maua/} bateria{https://www.instagram.com/bateriamauaclubedamanga/} ca{https://www.instagram.com/camaua/} diversidade{https://www.instagram.com/diversidademaua/} enactus{https://www.instagram.com/enactusmaua/} esports{https://www.instagram.com/esportsmaua/} inova{https://www.instagram.com/inovamaua/} mauajr{https://www.instagram.com/mauajr/} mauasocial{https://www.instagram.com/mauasocial/} mbc{https://www.instagram.com/mauabusinessclub/} nae{https://www.instagram.com/naemaua/} dev{https://www.instagram.com/devcommunitymaua/} nine{https://www.instagram.com/nine.maua/} finance{https://www.instagram.com/mauafinancegroup/} baja{https://www.instagram.com/bajamaua/} ecomaua{https://www.instagram.com/eco_maua/} mauaracing2{https://www.instagram.com/mauaracingh2/} mauaracing{https://www.instagram.com/mauaracing/} other{}}`
  String mauaEntitiesSchemaInstagramUrl(Object entity) {
    return Intl.select(
      entity,
      {
        'atletica': 'https://www.instagram.com/gaspar_maua/',
        'bateria': 'https://www.instagram.com/bateriamauaclubedamanga/',
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
        'finance': 'https://www.instagram.com/mauafinancegroup/',
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

  /// `Date`
  String get dateTitle {
    return Intl.message(
      'Date',
      name: 'dateTitle',
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

  /// `{bold, select, normalPart1{If you have any questions feel free to reach us at via } boldPart1{smile.patrocinio@maua.br} normalPart2{ or } boldPart2{smile@maua.br} normalPart3{.} other{Dev. Community Mauá}}`
  String footerDoubtContact(Object bold) {
    return Intl.select(
      bold,
      {
        'normalPart1':
            'If you have any questions feel free to reach us at via ',
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

  /// ` Help`
  String get footerHelp {
    return Intl.message(
      ' Help',
      name: 'footerHelp',
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

  /// `Subscriber List`
  String get subscriberListTitle {
    return Intl.message(
      'Subscriber List',
      name: 'subscriberListTitle',
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

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Completed activity!`
  String get confirmedAttendance {
    return Intl.message(
      'Completed activity!',
      name: 'confirmedAttendance',
      desc: '',
      args: [],
    );
  }

  /// `Delete account`
  String get deleteAccount {
    return Intl.message(
      'Delete account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account? All your registrations, certificates and data will be permanently erased.`
  String get deleteMessage {
    return Intl.message(
      'Are you sure you want to delete your account? All your registrations, certificates and data will be permanently erased.',
      name: 'deleteMessage',
      desc: '',
      args: [],
    );
  }

  /// `Enter your e-mail`
  String get deleteEmailType {
    return Intl.message(
      'Enter your e-mail',
      name: 'deleteEmailType',
      desc: '',
      args: [],
    );
  }

  /// `to complete the action:`
  String get deleteCompleteAction {
    return Intl.message(
      'to complete the action:',
      name: 'deleteCompleteAction',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account Permanently`
  String get deleteAccountPermanent {
    return Intl.message(
      'Delete Account Permanently',
      name: 'deleteAccountPermanent',
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

  /// `{title, select, normalPart{In case of error when logging in, send an email to: } boldPart{atendimento.smile@maua.br} other{}}`
  String loginWarningTitle(Object title) {
    return Intl.select(
      title,
      {
        'normalPart': 'In case of error when logging in, send an email to: ',
        'boldPart': 'atendimento.smile@maua.br',
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

  /// `Social name refers to the designation by which the person is socially recognized.`
  String get registerSocialNameTooltip {
    return Intl.message(
      'Social name refers to the designation by which the person is socially recognized.',
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

  /// `Confirm your e-mail Mauá`
  String get registerEmailProfessorConfirmationPlaceholder {
    return Intl.message(
      'Confirm your e-mail Mauá',
      name: 'registerEmailProfessorConfirmationPlaceholder',
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

  /// `Means of notification:`
  String get notificationsTitle {
    return Intl.message(
      'Means of notification:',
      name: 'notificationsTitle',
      desc: '',
      args: [],
    );
  }

  /// `I want to receive notifications`
  String get notificationsSchemaTitle {
    return Intl.message(
      'I want to receive notifications',
      name: 'notificationsSchemaTitle',
      desc: '',
      args: [],
    );
  }

  /// `{notification, select, email{EMAIL} other{}}`
  String notificationsSchema(Object notification) {
    return Intl.select(
      notification,
      {
        'email': 'EMAIL',
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

  /// `We sent an email (contato@devmaua.com) to you, please check your inbox, spam or promotional and click on the confirmation link to validate your registration.`
  String get emailNotificationTitle {
    return Intl.message(
      'We sent an email (contato@devmaua.com) to you, please check your inbox, spam or promotional and click on the confirmation link to validate your registration.',
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

  /// `Are you sure your email address {firstName} is correct?`
  String confirmEmailAndPhoneNotificationTitle(Object firstName) {
    return Intl.message(
      'Are you sure your email address $firstName is correct?',
      name: 'confirmEmailAndPhoneNotificationTitle',
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

  /// `Your password must contain: \n - One or more uppercase letters \n - One or more lowercase letters \n - One or more numbers \n - One or more special characters\n(#, !, @, $, %, ^, &, *, -) \n - Minimum 8 characters`
  String get fieldPasswordRequisits {
    return Intl.message(
      'Your password must contain: \n - One or more uppercase letters \n - One or more lowercase letters \n - One or more numbers \n - One or more special characters\n(#, !, @, \$, %, ^, &, *, -) \n - Minimum 8 characters',
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

  /// `Must be bigger than 0`
  String get fieldDurationMoreThanZero {
    return Intl.message(
      'Must be bigger than 0',
      name: 'fieldDurationMoreThanZero',
      desc: '',
      args: [],
    );
  }

  /// `Old date`
  String get fieldHourBeforeToday {
    return Intl.message(
      'Old date',
      name: 'fieldHourBeforeToday',
      desc: '',
      args: [],
    );
  }

  /// `Follow the steps that will be sent in the registered email:`
  String get codeInEmailTitle {
    return Intl.message(
      'Follow the steps that will be sent in the registered email:',
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

  /// `You will receive an email (contato@devmaua.com) with a link to change your password! Check inbox, spam or promotional.`
  String get codeInEmailInstructionsTitle {
    return Intl.message(
      'You will receive an email (contato@devmaua.com) with a link to change your password! Check inbox, spam or promotional.',
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

  /// `If you have not found the email (contato@devmaua.com) or the link has expired, please resend the code by entering your e-mail in the field below:\n`
  String get errorEmailInstructionsTitle {
    return Intl.message(
      'If you have not found the email (contato@devmaua.com) or the link has expired, please resend the code by entering your e-mail in the field below:\n',
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

  /// `Activity`
  String get activity {
    return Intl.message(
      'Activity',
      name: 'activity',
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

  /// `Duration(Minutes)`
  String get activityDurationTitle {
    return Intl.message(
      'Duration(Minutes)',
      name: 'activityDurationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Number of Vanacies`
  String get activityVacancyNumber {
    return Intl.message(
      'Number of Vanacies',
      name: 'activityVacancyNumber',
      desc: '',
      args: [],
    );
  }

  /// `Accept Subscriptions`
  String get activityAcceptSbscriptions {
    return Intl.message(
      'Accept Subscriptions',
      name: 'activityAcceptSbscriptions',
      desc: '',
      args: [],
    );
  }

  /// `Responsible Teacher`
  String get activityResponsibleTeacher {
    return Intl.message(
      'Responsible Teacher',
      name: 'activityResponsibleTeacher',
      desc: '',
      args: [],
    );
  }

  /// `Inscription Closure (Date)`
  String get activityInscriptionClosureDate {
    return Intl.message(
      'Inscription Closure (Date)',
      name: 'activityInscriptionClosureDate',
      desc: '',
      args: [],
    );
  }

  /// `Inscription Closure (Hour)`
  String get activityInscriptionClosureHour {
    return Intl.message(
      'Inscription Closure (Hour)',
      name: 'activityInscriptionClosureHour',
      desc: '',
      args: [],
    );
  }

  /// `The system automatically closes the activity\nsubscriptions at a specific date and time. If this field is not filled in, the\nsubscriptions will not close by themselves and an administrator must\ndo it manually.`
  String get activityInscriptionClosureTooltip {
    return Intl.message(
      'The system automatically closes the activity\nsubscriptions at a specific date and time. If this field is not filled in, the\nsubscriptions will not close by themselves and an administrator must\ndo it manually.',
      name: 'activityInscriptionClosureTooltip',
      desc: '',
      args: [],
    );
  }

  /// `The inscription closure date must be before the event date`
  String get activityErrorClosureDateAfterStartDate {
    return Intl.message(
      'The inscription closure date must be before the event date',
      name: 'activityErrorClosureDateAfterStartDate',
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

  /// `Company`
  String get companyTitleWithoutDouble {
    return Intl.message(
      'Company',
      name: 'companyTitleWithoutDouble',
      desc: '',
      args: [],
    );
  }

  /// `Extensionist`
  String get extensionistTitle {
    return Intl.message(
      'Extensionist',
      name: 'extensionistTitle',
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

  /// `Status`
  String get enrollmentTitle {
    return Intl.message(
      'Status',
      name: 'enrollmentTitle',
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

  /// `Data`
  String get dayTitle {
    return Intl.message(
      'Data',
      name: 'dayTitle',
      desc: '',
      args: [],
    );
  }

  /// `Date: {firstName}`
  String dateWithPlaceholder(Object firstName) {
    return Intl.message(
      'Date: $firstName',
      name: 'dateWithPlaceholder',
      desc: '',
      args: [firstName],
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

  /// `Absence`
  String get absenceTitle {
    return Intl.message(
      'Absence',
      name: 'absenceTitle',
      desc: '',
      args: [],
    );
  }

  /// `Present`
  String get presenceTitle {
    return Intl.message(
      'Present',
      name: 'presenceTitle',
      desc: '',
      args: [],
    );
  }

  /// `Names`
  String get namesTitle {
    return Intl.message(
      'Names',
      name: 'namesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Validation Code`
  String get validationCodeTitle {
    return Intl.message(
      'Validation Code',
      name: 'validationCodeTitle',
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

  /// `Extension Activity`
  String get isExtensiveTooltip {
    return Intl.message(
      'Extension Activity',
      name: 'isExtensiveTooltip',
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

  /// `Activities`
  String get drawerActivitiesButton {
    return Intl.message(
      'Activities',
      name: 'drawerActivitiesButton',
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

  /// `All Activities`
  String get allActivitiesTitle {
    return Intl.message(
      'All Activities',
      name: 'allActivitiesTitle',
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

  /// `Profile`
  String get drawerProfileButton {
    return Intl.message(
      'Profile',
      name: 'drawerProfileButton',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get locationTitle {
    return Intl.message(
      'Location',
      name: 'locationTitle',
      desc: '',
      args: [],
    );
  }

  /// `It looks like you don't have any certificates.`
  String get noCertificatesFoundTitle {
    return Intl.message(
      'It looks like you don\'t have any certificates.',
      name: 'noCertificatesFoundTitle',
      desc: '',
      args: [],
    );
  }

  /// `{info, select, title{Deadline for changes to your certificate: }  date{06/13/2023.} other{}}`
  String certificatesSubscriptionInfo(Object info) {
    return Intl.select(
      info,
      {
        'title': 'Deadline for changes to your certificate: ',
        'date': '06/13/2023.',
        'other': '',
      },
      name: 'certificatesSubscriptionInfo',
      desc: '',
      args: [info],
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

  /// `Unavailabe`
  String get unavailabeTitle {
    return Intl.message(
      'Unavailabe',
      name: 'unavailabeTitle',
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

  /// `Do you want to join the queue?`
  String get joinQueueConfimation {
    return Intl.message(
      'Do you want to join the queue?',
      name: 'joinQueueConfimation',
      desc: '',
      args: [],
    );
  }

  /// `Get in queue`
  String get joinQueueTitle {
    return Intl.message(
      'Get in queue',
      name: 'joinQueueTitle',
      desc: '',
      args: [],
    );
  }

  /// `In queue`
  String get inQueueTitle {
    return Intl.message(
      'In queue',
      name: 'inQueueTitle',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to leave the queue?`
  String get exitQueueConfimation {
    return Intl.message(
      'Do you want to leave the queue?',
      name: 'exitQueueConfimation',
      desc: '',
      args: [],
    );
  }

  /// `You are in the activity queue`
  String get InQueueContent {
    return Intl.message(
      'You are in the activity queue',
      name: 'InQueueContent',
      desc: '',
      args: [],
    );
  }

  /// `Add Professor`
  String get addProfessorTitle {
    return Intl.message(
      'Add Professor',
      name: 'addProfessorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Speaker Name`
  String get speakerNameTitle {
    return Intl.message(
      'Speaker Name',
      name: 'speakerNameTitle',
      desc: '',
      args: [],
    );
  }

  /// `Send email to all`
  String get sendEmailToAllEnrolls {
    return Intl.message(
      'Send email to all',
      name: 'sendEmailToAllEnrolls',
      desc: '',
      args: [],
    );
  }

  /// `Send email to:`
  String get sendEmailToSomeone {
    return Intl.message(
      'Send email to:',
      name: 'sendEmailToSomeone',
      desc: '',
      args: [],
    );
  }

  /// `Common questions`
  String get faqTitle {
    return Intl.message(
      'Common questions',
      name: 'faqTitle',
      desc: '',
      args: [],
    );
  }

  /// `{faq, select, title{I logged in and forgot my password. What should I do?} description{There is an option on the "Login" screen called "I forgot my password", where you can change it following a step-by-step.} other{}}`
  String faq1(Object faq) {
    return Intl.select(
      faq,
      {
        'title': 'I logged in and forgot my password. What should I do?',
        'description':
            'There is an option on the "Login" screen called "I forgot my password", where you can change it following a step-by-step.',
        'other': '',
      },
      name: 'faq1',
      desc: '',
      args: [faq],
    );
  }

  /// `{faq, select, title{How to validate the presence in my activities?} description{By clicking on the activity, you will be directed to the more information screen, where you will find a button to validate presence. When selecting it, you must fill in a 6-digit token, which will be provided by the responsible teacher during the activity. Remembering that the validation button will only be available if you are enrolled in the activity. Any problems with the token inform the teacher in charge immediately.} other{}}`
  String faq2(Object faq) {
    return Intl.select(
      faq,
      {
        'title': 'How to validate the presence in my activities?',
        'description':
            'By clicking on the activity, you will be directed to the more information screen, where you will find a button to validate presence. When selecting it, you must fill in a 6-digit token, which will be provided by the responsible teacher during the activity. Remembering that the validation button will only be available if you are enrolled in the activity. Any problems with the token inform the teacher in charge immediately.',
        'other': '',
      },
      name: 'faq2',
      desc: '',
      args: [faq],
    );
  }

  /// `{faq, select, title{Where on the site can I see SMILE's activities?} description{By clicking on the activities icon in the navigation bar you will be able to visualize all the activities of the event. If you are an IMT student, you can also access the SMILE Open LMS:} link{https://imt.myopenlms.net/course/view.php?id=1353} other{}}`
  String faq3(Object faq) {
    return Intl.select(
      faq,
      {
        'title': 'Where on the site can I see SMILE\'s activities?',
        'description':
            'By clicking on the activities icon in the navigation bar you will be able to visualize all the activities of the event. If you are an IMT student, you can also access the SMILE Open LMS:',
        'link': 'https://imt.myopenlms.net/course/view.php?id=1353',
        'other': '',
      },
      name: 'faq3',
      desc: '',
      args: [faq],
    );
  }

  /// `{faq, select, title{In face-to-face activity, where can I see the room?} description{By clicking on the activity you signed up for, you will be able to see all available information about that activity, including the room.} other{}}`
  String faq4(Object faq) {
    return Intl.select(
      faq,
      {
        'title': 'In face-to-face activity, where can I see the room?',
        'description':
            'By clicking on the activity you signed up for, you will be able to see all available information about that activity, including the room.',
        'other': '',
      },
      name: 'faq4',
      desc: '',
      args: [faq],
    );
  }

  /// `{faq, select, title{Can I wear shorts during technical visits?} description{The Technical Visits have some important guidelines! So BEFORE you register, READ CAREFULLY the necessary information on the SMILE website. The standard recommendation for you to participate in a visit is to be dressed in long pants and leather shoes. Bermuda shorts will not be permitted.} other{}}`
  String faq5(Object faq) {
    return Intl.select(
      faq,
      {
        'title': 'Can I wear shorts during technical visits?',
        'description':
            'The Technical Visits have some important guidelines! So BEFORE you register, READ CAREFULLY the necessary information on the SMILE website. The standard recommendation for you to participate in a visit is to be dressed in long pants and leather shoes. Bermuda shorts will not be permitted.',
        'other': '',
      },
      name: 'faq5',
      desc: '',
      args: [faq],
    );
  }

  /// `{faq, select, title{Will there be recordings of online activities this year?} description{At SMILE 2023, there will be no recordings of activities carried out online.} other{}}`
  String faq6(Object faq) {
    return Intl.select(
      faq,
      {
        'title': 'Will there be recordings of online activities this year?',
        'description':
            'At SMILE 2023, there will be no recordings of activities carried out online.',
        'other': '',
      },
      name: 'faq6',
      desc: '',
      args: [faq],
    );
  }

  /// `{faq, select, title{How do I unsubscribe from an activity?} description{When you click on the activity you want to cancel there will be a red "Unsubscribe" button, just click on it and confirm.} other{}}`
  String faq7(Object faq) {
    return Intl.select(
      faq,
      {
        'title': 'How do I unsubscribe from an activity?',
        'description':
            'When you click on the activity you want to cancel there will be a red "Unsubscribe" button, just click on it and confirm.',
        'other': '',
      },
      name: 'faq7',
      desc: '',
      args: [faq],
    );
  }

  /// `{faq, select, title{How to watch my activities online?} description{By clicking on the activity in question, you will have access to more information about it. Among the information will be the link to the activity.} other{}}`
  String faq8(Object faq) {
    return Intl.select(
      faq,
      {
        'title': 'How to watch my activities online?',
        'description':
            'By clicking on the activity in question, you will have access to more information about it. Among the information will be the link to the activity.',
        'other': '',
      },
      name: 'faq8',
      desc: '',
      args: [faq],
    );
  }

  /// `{faq, select, title{How to issue my certificate?} description{Certificates will be automatically available in your profile 10 days after the event. If an error occurs, please contact our support: atendimento.smile@maua.br.} other{}}`
  String faq9(Object faq) {
    return Intl.select(
      faq,
      {
        'title': 'How to issue my certificate?',
        'description':
            'Certificates will be automatically available in your profile 10 days after the event. If an error occurs, please contact our support: atendimento.smile@maua.br.',
        'other': '',
      },
      name: 'faq9',
      desc: '',
      args: [faq],
    );
  }

  /// `{faq, select, title{How can I change my name/social name for certification?} description{When you enter the profile tab, you can change some of your data by clicking on the pencil in the upper right corner. The deadline for changing names before issuing the certificate is 5 days after the end of the event (06/02/2023).} other{}}`
  String faq10(Object faq) {
    return Intl.select(
      faq,
      {
        'title': 'How can I change my name/social name for certification?',
        'description':
            'When you enter the profile tab, you can change some of your data by clicking on the pencil in the upper right corner. The deadline for changing names before issuing the certificate is 5 days after the end of the event (06/02/2023).',
        'other': '',
      },
      name: 'faq10',
      desc: '',
      args: [faq],
    );
  }

  /// `{faq, select, title{I typed my name with a wrong letter on my Certificate. Until what date can I change?} description{The deadline for requests for corrections in certificates is until (06/13/2023), with the deadline for submitting corrections until (06/19/2023).} other{}}`
  String faq11(Object faq) {
    return Intl.select(
      faq,
      {
        'title':
            'I typed my name with a wrong letter on my Certificate. Until what date can I change?',
        'description':
            'The deadline for requests for corrections in certificates is until (06/13/2023), with the deadline for submitting corrections until (06/19/2023).',
        'other': '',
      },
      name: 'faq11',
      desc: '',
      args: [faq],
    );
  }

  /// `{faq, select, title{If in doubt, how can I get in touch?} description{For more information about the event, please contact our support: atendimento.smile@maua.br} other{}}`
  String faq12(Object faq) {
    return Intl.select(
      faq,
      {
        'title': 'If in doubt, how can I get in touch?',
        'description':
            'For more information about the event, please contact our support: atendimento.smile@maua.br',
        'other': '',
      },
      name: 'faq12',
      desc: '',
      args: [faq],
    );
  }

  /// `Hello, {firstName}!`
  String helloTitle(Object firstName) {
    return Intl.message(
      'Hello, $firstName!',
      name: 'helloTitle',
      desc: '',
      args: [firstName],
    );
  }

  /// `Data Update`
  String get updateUserTitle {
    return Intl.message(
      'Data Update',
      name: 'updateUserTitle',
      desc: '',
      args: [],
    );
  }

  /// `Do you want social name?`
  String get socialNameAsk {
    return Intl.message(
      'Do you want social name?',
      name: 'socialNameAsk',
      desc: '',
      args: [],
    );
  }

  /// `Change data`
  String get alterData {
    return Intl.message(
      'Change data',
      name: 'alterData',
      desc: '',
      args: [],
    );
  }

  /// `{social, select, title{Do you want social name on } certificate{your certificate?} other{}}`
  String socialNameCertificateAsk(Object social) {
    return Intl.select(
      social,
      {
        'title': 'Do you want social name on ',
        'certificate': 'your certificate?',
        'other': '',
      },
      name: 'socialNameCertificateAsk',
      desc: '',
      args: [social],
    );
  }

  /// `{info, select, title{* The name that appears here will be the one we will use for the purposes of issuing a certificate. Any changes to your registration can be made up to the day } date{05/25/2023} description2{, under penalty of the certificate being issued with the data provided here.} other{}}`
  String updateUserInfo(Object info) {
    return Intl.select(
      info,
      {
        'title':
            '* The name that appears here will be the one we will use for the purposes of issuing a certificate. Any changes to your registration can be made up to the day ',
        'date': '05/25/2023',
        'description2':
            ', under penalty of the certificate being issued with the data provided here.',
        'other': '',
      },
      name: 'updateUserInfo',
      desc: '',
      args: [info],
    );
  }

  /// `Open for subscriptions`
  String get homeSubscription {
    return Intl.message(
      'Open for subscriptions',
      name: 'homeSubscription',
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
