// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';

// import 'package:smile_front/app/modules/home/ui/pages/home2/models/speaker_model.dart';
// import 'package:smile_front/app/shared/themes/app_colors.dart';
// import 'package:smile_front/app/shared/themes/app_images.dart';

// class MainSpeakersCard extends StatelessWidget {
//   final List<SpeakerModel> speakers;
//   final int indexToShow;
//   final Function toggleIndex;

//   const MainSpeakersCard({
//     Key? key,
//     required this.speakers,
//     required this.indexToShow,
//     required this.toggleIndex,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Padding(
//           padding:
//               EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.22),
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(38),
//               color: AppColors.brandingBlue,
//             ),
//             height: MediaQuery.of(context).size.height * 0.6,
//             width: MediaQuery.of(context).size.width * 0.65,
//           ),
//         ),
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(38),
//             color: AppColors.lightBlue,
//           ),
//           height: MediaQuery.of(context).size.height * 0.6,
//           width: MediaQuery.of(context).size.width * 0.8,
//           child: Padding(
//               padding: EdgeInsets.only(
//                   left: MediaQuery.of(context).size.width * 0.03,
//                   top: MediaQuery.of(context).size.height * 0.018,
//                   bottom: MediaQuery.of(context).size.height * 0.018),
//               child: ListView.builder(
//                 itemCount: speakers.length,
//                 itemBuilder: (context, index) {
//                   final item = speakers[index];
//                   return Padding(
//                     padding: EdgeInsets.symmetric(
//                         vertical: MediaQuery.of(context).size.height * 0.01),
//                     child: Row(
//                       children: [
//                         Observer(builder: (context) {
//                           return Text(
//                             item.date,
//                             style: TextStyle(
//                               fontSize: index == indexToShow ? 25 : 20,
//                             ),
//                           );
//                         }),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                           child: Container(
//                             width: 20,
//                             height: 2,
//                             color: AppColors.brandingBlue,
//                           ),
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(
//                                   index == indexToShow ? 54 : 31),
//                               border:
//                                   Border.all(color: AppColors.brandingOrange)),
//                           child: GestureDetector(
//                             onTap: () {
//                               toggleIndex(index);
//                             },
//                             child: SizedBox(
//                                 height: index == indexToShow ? 108 : 62,
//                                 width: index == indexToShow ? 108 : 62,
//                                 child: AppImages.speaker1),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               )),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 260.0),
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width * 0.50,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: 404, width: 404, child: AppImages.speaker1),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 108),
//                     child: Column(children: [
//                       Text(
//                         speakers.isNotEmpty ? speakers[indexToShow].name : '',
//                         style:
//                             const TextStyle(color: Colors.white, fontSize: 50),
//                       ),
//                       const SizedBox(
//                         height: 16,
//                       ),
//                       Text(
//                         speakers.isNotEmpty
//                             ? speakers[indexToShow].description
//                             : '',
//                         style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 25,
//                             fontWeight: FontWeight.w100),
//                       )
//                     ]),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:smile_front/app/modules/home/ui/pages/home2/models/speaker_model.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_images.dart';

class MainSpeakersCard extends StatelessWidget {
  final List<SpeakerModel> speakers;
  final int indexToShow;
  final Function toggleIndex;

  const MainSpeakersCard({
    Key? key,
    required this.speakers,
    required this.indexToShow,
    required this.toggleIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(38),
              color: AppColors.brandingBlue,
            ),
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.65,
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(38),
              color: AppColors.lightBlue,
            ),
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.022),
              child: Expanded(
                flex: 2,
                child: ListView.builder(
                  itemCount: speakers.length,
                  itemBuilder: (context, index) {
                    final item = speakers[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            item.date,
                            style: TextStyle(
                              fontSize: index == indexToShow ? 25 : 20,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              width: 20,
                              height: 2,
                              color: AppColors.brandingBlue,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    index == indexToShow ? 54 : 31),
                                border: Border.all(
                                    color: AppColors.brandingOrange)),
                            child: GestureDetector(
                              onTap: () {
                                toggleIndex(index);
                              },
                              child: SizedBox(
                                  height: index == indexToShow ? 108 : 62,
                                  width: index == indexToShow ? 108 : 62,
                                  child: AppImages.speaker1),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(
                    height: 404, width: 404, child: AppImages.speaker1),
              ),
              const Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 10,
                  )),
              Expanded(
                flex: 3,
                child: Column(children: [
                  Text(
                    speakers.isNotEmpty ? speakers[indexToShow].name : '',
                    style: const TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    speakers.isNotEmpty
                        ? speakers[indexToShow].description
                        : '',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w100),
                  )
                ]),
              ),
              const Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 10,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
