import 'package:flutter/material.dart';
import 'package:smile_front/app/modules/home/domain/entities/speaker.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

class MainSpeakersCard extends StatelessWidget {
  final List<Speaker> speakers;
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
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(38),
            color: AppColors.brandingBlue,
          ),
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.65,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(38),
            color: AppColors.lightBlue,
          ),
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.022,
                top: MediaQuery.of(context).size.height * 0.022),
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
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          width: 20,
                          height: 2,
                          color: AppColors.brandingBlue,
                        ),
                      ),
                      Container(
                        height: index == indexToShow ? 104 : 60,
                        width: index == indexToShow ? 104 : 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                index == indexToShow ? 52 : 30),
                            border: Border.all(
                              color: AppColors.brandingOrange,
                              width: 3.5,
                            )),
                        child: GestureDetector(
                          onTap: () {
                            toggleIndex(index);
                          },
                          child: SizedBox(
                            height: index == indexToShow ? 108 : 62,
                            width: index == indexToShow ? 108 : 62,
                            child: CircleAvatar(
                              backgroundColor: AppColors.brandingOrange,
                              radius: index == indexToShow ? 54 : 31,
                              backgroundImage: NetworkImage(
                                  item.linkPhoto), // for Network image
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 404,
                width: 404,
                child: CircleAvatar(
                  radius: 102.0,
                  backgroundImage: NetworkImage(
                      speakers[indexToShow].linkPhoto), // for Network image
                ),
              ),
              const SizedBox(
                width: 10,
              ),
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
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
