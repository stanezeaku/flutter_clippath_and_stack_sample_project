import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_index/utilities/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileViewPage extends StatefulWidget {
  const MobileViewPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MobileViewPage> createState() => _MobileViewPageState();
}

class _MobileViewPageState extends State<MobileViewPage> {
  int tabID = 1;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: primaryColor,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 320,
              height: 100,
              child: Text(
                'Deine Job Website',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontWeight: medium,
                  fontSize: 42,
                ),
              ),
            ),
            SvgPicture.asset(
              'assets/images/undraw_agreement_aajr.svg',
              fit: BoxFit.fill,
            ),
            Container(
              height: 130,
              decoration: BoxDecoration(
                border: Border.all(color: borderColor),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(3, 3), // changes position of shadow
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                gradient: const LinearGradient(
                  colors: [Colors.white, Colors.white],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFF319795), Color(0xFF3182CE)]),
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
                ),
              ),
            ),
            _buildBodySwitch(),
          ],
        ),
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
          width: double.infinity,
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
    return GoogleFonts.lato(
        fontSize: 14,
        fontWeight: semiBold,
        color: tabID == val ? Colors.white : textColor);
  }

  Widget _buildBodySwitch() {
    return Column(
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
          )
      ],
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
          boxTwo(subTitleTwo, imageTwo),
          boxThree(subTitleThree, imageThree)
        ],
      ),
    );
  }

  Widget boxThree(String subTitleThree, String imageThree) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        Positioned(
          left: -50,
          top: -50,
          child: Container(
            height: 308,
            width: 308,
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: circleColor),
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '3.',
                  style: GoogleFonts.lato(
                      fontSize: 130, color: boxTextColor, fontWeight: regular),
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
                        fontWeight: regular),
                  ),
                )
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
      ],
    );
  }

  Widget boxTwo(String subTitleTwo, String imageTwo) {
    return Column(
      children: [
        ClipPath(
          clipper: CustomClipPath(),
          child: Container(
            padding: const EdgeInsets.only(top: 30, bottom: 40),
            color: primaryColor,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '2.',
                      style: GoogleFonts.lato(
                        fontSize: 130,
                        fontWeight: regular,
                        color: boxTextColor,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 26),
                      width: 184,
                      height: 38,
                      child: Text(
                        subTitleTwo,
                        style: GoogleFonts.lato(
                          fontSize: 15.75,
                          fontWeight: regular,
                          color: boxTextColor,
                        ),
                      ),
                    )
                  ],
                ),
                SvgPicture.asset(
                  imageTwo,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  SizedBox boxOne(String title, String subTitleOne) {
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            height: 50,
            width: 280,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontWeight: medium,
                color: pageViewTitleColor,
                fontSize: 21,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            alignment: AlignmentDirectional.bottomStart,

            children: [
              Positioned(
                left: -85,
                bottom: -60,
                child: Container(
                          height: 308,
                          width: 308,
                          decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: circleColor),
                        ),
              ),
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/undraw_Profile_data_re_v81r.svg',
                    fit: BoxFit.fill,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '1.',
                        style: GoogleFonts.lato(
                          fontSize: 130,
                          fontWeight: regular,
                          color: boxTextColor,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 26),
                        width: 184,
                        height: 38,
                        child: Text(
                          subTitleOne,
                          style: GoogleFonts.lato(
                            fontSize: 15.75,
                            color: boxTextColor,
                            fontWeight: regular,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width*0.0003750,size.height*0.9971000);
    path0.lineTo(0,0);
    path0.quadraticBezierTo(size.width*0.3240125,size.height*-0.2367000,size.width*0.4385375,size.height*0.0021250);
    path0.quadraticBezierTo(size.width*0.5855375,size.height*0.1340750,size.width,0);
    path0.lineTo(size.width*1.0003750,size.height*0.7901750);
    path0.quadraticBezierTo(size.width*0.8880500,size.height*1.0013000,size.width*0.4105375,size.height*0.9970000);
    path0.quadraticBezierTo(size.width*0.0299500,size.height*1.1465250,size.width*0.0003750,size.height*0.9971000);
    path0.close();



    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
