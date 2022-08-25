import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_index/utilities/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  int tabID = 1;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipPath(
                clipper: CustomClipPathHead(),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 25.0, top: 30),
                  color: primaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 320,
                            height: 156,
                            child: Text(
                              'Deine Job Website',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                fontWeight: bold,
                                fontSize: 65,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 320,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xFF319795),
                                    Color(0xFF3182CE)
                                  ]),
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.transparent,
                                onPrimary: Colors.white,
                                minimumSize: const Size.fromHeight(50),
                                shape: const RoundedRectangleBorder(),
                              ),
                              child: Text(
                                'Kostenlos Registrieren',
                                style: GoogleFonts.lato(
                                    fontWeight: semiBold,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        clipBehavior: Clip.hardEdge,
                        child: SvgPicture.asset(
                          'assets/images/undraw_agreement_aajr.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              _buildBodySwitch(),
            ],
          ),
          Positioned(
            bottom: 310,
            left: 150,
            child: Center(
              child: SizedBox(
                height: 503,
                width: 307,
                child: SvgPicture.asset('assets/images/Gruppe1.svg'),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            child: Center(
              child: SizedBox(
                height: 503,
                width: 307,
                child: SvgPicture.asset('assets/images/Gruppe2.svg'),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSegment() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              border: Border.all(color: borderColor)),
          width: 480,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      tabID = 1;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 17, horizontal: 5),
                    decoration: segmentDecoration(1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Arbeitnehmer', style: segmentText(1)),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                    onTap: () {
                      setState(() {
                        tabID = 2;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 17, horizontal: 5),
                      decoration: segmentDecoration(2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Arbeitgeber', style: segmentText(2)),
                        ],
                      ),
                    )),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      tabID = 3;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 17, horizontal: 5),
                    decoration: segmentDecoration(3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Temporarburo', style: segmentText(3)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  segmentDecoration(val) {
    BorderRadiusGeometry? borderRadius2;
    if (val == 1) {
      borderRadius2 = const BorderRadius.horizontal(left: Radius.circular(15));
    } else if (val == 3) {
      borderRadius2 = const BorderRadius.horizontal(right: Radius.circular(15));
    } else {
      borderRadius2 = null;
    }
    return BoxDecoration(
      border: Border.all(color: borderColor),
      color: tabID == val ? activeColor : Colors.white,
      borderRadius: borderRadius2,
    );
  }

  segmentText(val) {
    return TextStyle(
        fontSize: 14,
        fontWeight: semiBold,
        color: tabID == val ? Colors.white : textColor);
  }

  Widget _buildBodySwitch() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildSegment(),
          if (tabID == 1)
            buildBody(
              title: 'Drei einfache Schritte zu vermittlung neuer Mitarbeiter',
              subTitleOne: 'Erstellen dein Lebenslauf',
              subTitleTwo: 'Erstellen dein Lebenslauf',
              subTitleThree: 'Mit nur einem Klick bewerben',
              imageTwo: 'assets/images/undraw_task_31wc.svg',
              imageThree: 'assets/images/undraw_personal_file_222m.svg',
            )
          else if (tabID == 2)
            buildBody(
              title: 'Drei einfache Schritte zu deinem neuen Mitarbeiter',
              subTitleOne: 'Erstellen dein Unternehmensprofil',
              subTitleTwo: 'Erstellen ein Jobinserat',
              subTitleThree: 'Wahle deinen neuen Mitarbeiter aus',
              imageTwo: 'assets/images/undraw_about_me_wa29.svg',
              imageThree: 'assets/images/undraw_swipe_profiles1_i6mr.svg',
            )
          else if (tabID == 3)
            buildBody(
              title: 'Drei einfache Schritte zur Vermittlung neuer Mitarbeiter',
              subTitleOne: 'Erstellen dein Unternehmensprofil',
              subTitleTwo: 'Erhalte Vermittlungs- angebot von Arbeitgeber',
              subTitleThree: 'Vermittlung nach Provision oder Stundenlohn',
              imageTwo: 'assets/images/undraw_job_offers_kw5d.svg',
              imageThree: 'assets/images/undraw_business_deal_cpi9.svg',
            ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  Widget buildBody(
      {required String title,
      required String subTitleOne,
      required String subTitleTwo,
      required String subTitleThree,
      required String imageTwo,
      required String imageThree}) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          boxOne(title, subTitleOne),
          const SizedBox(
            height: 50,
          ),
          boxTwo(subTitleTwo, imageTwo),
          const SizedBox(
            height: 50,
          ),
          boxThree(subTitleThree, imageThree)
        ],
      ),
    );
  }

  SizedBox boxThree(String subTitleThree, String imageThree) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Container(
                height: 208,
                width: 208,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: circleColor),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '3.',
                      style: GoogleFonts.lato(
                          fontSize: 100,
                          color: boxTextColor,
                          fontWeight: regular),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 26),
                      width: 148,
                      height: 38,
                      child: Text(
                        subTitleThree,
                        style: GoogleFonts.lato(
                          fontSize: 15.75,
                          color: boxTextColor,
                          fontWeight: semiBold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SvgPicture.asset(
            imageThree,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Widget boxTwo(String subTitleTwo, String imageTwo) {
    return ClipPath(
      clipper: CustomClipPath(),
      child: Container(
        padding: const EdgeInsets.only(top: 40, bottom: 70, ),
        color: primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SvgPicture.asset(
              imageTwo,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              width: 50,
            ),
            Text(
              '2.',
              style: GoogleFonts.lato(
                fontSize: 100,
                color: boxTextColor,
                fontWeight: regular,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 0),
              width: 351,
              height: 38,
              child: Text(
                subTitleTwo,
                style: GoogleFonts.lato(
                  fontSize: 15.75,
                  color: boxTextColor,
                  fontWeight: semiBold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget boxOne(String title, String subTitleOne) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          width: 280,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: pageViewTitleColor,
              fontSize: 21,
              fontWeight: medium,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.only(left: 50),
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Container(
                    height: 208,
                    width: 208,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: circleColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, bottom: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '1.',
                          style: GoogleFonts.lato(
                            fontSize: 100,
                            color: boxTextColor,
                            fontWeight: regular,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 0),
                          width: 240,
                          height: 38,
                          child: Text(
                            subTitleOne,
                            style: GoogleFonts.lato(
                              fontSize: 15.75,
                              color: boxTextColor,
                              fontWeight: medium,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(
                'assets/images/undraw_Profile_data_re_v81r.svg',
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.8940500);
    path.lineTo(0, size.height * 0.0974000);
    path.quadraticBezierTo(size.width * 0.2667875, size.height * 0.0456750,
        size.width * 0.4387125, size.height * 0.0854000);
    path.quadraticBezierTo(size.width * 0.8881875, size.height * 0.0155500,
        size.width, size.height * 0.2263500);
    path.lineTo(size.width, size.height * 0.8308750);
    path.quadraticBezierTo(size.width * 0.8768000, size.height * 0.9365250,
        size.width * 0.2958375, size.height * 0.8826000);
    path.quadraticBezierTo(size.width * 0.1495375, size.height * 0.8965500, 0,
        size.height * 0.8940500);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CustomClipPathHead extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.9162000);
    path.quadraticBezierTo(size.width * 0.6245500, size.height * 0.9248250,
        size.width * 0.5011875, size.height * 0.9669250);
    path.quadraticBezierTo(
        size.width * 0.3767500, size.height * 0.9759750, 0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
