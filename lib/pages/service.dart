import 'package:carousel_slider/carousel_slider.dart';
import 'package:eletecapp/I18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: <Widget>[
                BannerView(),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
                  child: Text(
                    Localization.of(context).ourServices,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  padding: const EdgeInsets.all(8),
                  children: [
                    ['assets/images/ac.png', 'A/C Maintenance'],
                    ['assets/images/eletectrical.png', 'Eletectrical Works'],
                    ['assets/images/plumbing.png', 'Plumbing Works'],
                    ['assets/images/house.png', 'House Cleaning'],
                    // ['assets/images/duct.png', 'Duct Cleaning']
                  ].map((item) {
                    return GestureDetector(
                      child: _GridPhotoItem(
                        photo: _Photo(assetName: item[0], title: item[1]),
                      ),
                      onTap: () {},
                    );
                  }).toList(),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(
                      top: 15, left: 8, right: 8, bottom: 8),
                  child: Text(
                    Localization.of(context).contactUs,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                CallMeView(),
                Container(
                  alignment: Alignment.center,
                  padding: new EdgeInsets.symmetric(vertical: 18.0),
                  width: double.infinity,
                  child: new Text('@Copyright Eletec Technical Works',
                      style: new TextStyle()),
                )
              ],
            )),
      );
}

class _Photo {
  _Photo({
    this.assetName,
    this.title,
  });

  final String assetName;
  final String title;
}

class _GridTitleText extends StatelessWidget {
  const _GridTitleText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        text,
        style: GoogleFonts.righteous(),
      ),
    );
  }
}

class _GridPhotoItem extends StatelessWidget {
  _GridPhotoItem({
    Key key,
    @required this.photo,
  }) : super(key: key);

  final _Photo photo;

  @override
  Widget build(BuildContext context) {
    final Color bgColor = Colors.blue[200];

    final Widget image = Image.asset(
      photo.assetName,
      fit: BoxFit.contain,
      color: bgColor,
      colorBlendMode: BlendMode.overlay,
    );

    return GridTile(
      footer: Material(
        color: Colors.transparent,
        textStyle: GoogleFonts.righteous(),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
        ),
        clipBehavior: Clip.antiAlias,
        child: GridTileBar(
          backgroundColor: Colors.black45,
          title: _GridTitleText(photo.title),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          shape: BoxShape.rectangle,
          color: bgColor,
        ),
        alignment: Alignment.center,
        child: AspectRatio(aspectRatio: 0.6, child: image),
      ),
    );
  }
}

class CallMeView extends StatelessWidget {
  Future<void> _makePhoneCall() async {
    if (await canLaunch('tel:<042500090>')) {
      await launch('tel:<042500090>');
    } else {
      print('Could not launch');
    }
  }

  @override
  Widget build(BuildContext context) {
    final MaterialColor bgColor = Colors.blue;
    final padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 14);

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          shape: BoxShape.rectangle,
          color: bgColor[200],
        ),
        child: Column(
          children: <Widget>[
            Container(
                padding: padding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                  shape: BoxShape.rectangle,
                  color: bgColor[400],
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        Localization.of(context).call,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      GestureDetector(
                        child: Text('04-250-0090',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                        onTap: () {
                          _makePhoneCall();
                        },
                      )
                    ])),
            Container(
                padding: padding,
                child: Row(
                  children: <Widget>[
                    Image.asset('assets/images/question.png'),
                    SizedBox(width: 20),
                    Expanded(
                      child: Text(Localization.of(context).support,
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    )
                  ],
                ))
          ],
        ));
  }
}

class BannerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
      ),
      items: [
        'assets/images/slider-1.jpg',
        'assets/images/slider-2.jpg',
        'assets/images/slider-3.jpg',
        'assets/images/slider-4.jpg',
        // 'assets/images/slider-5.jpg',
      ].map((item) {
        return Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              child: Image.asset(item,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.8)),
        );
      }).toList(),
    );
  }
}
