import 'package:covid19app/app/modules/home/home_module.dart';
import 'package:covid19app/app/modules/home/pages/about/about_controller.dart';
import 'package:covid19app/app/shared/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/about_sliver_app_bar.dart';
import 'components/utils.dart';

class AboutPage extends StatefulWidget {
  final String title;
  const AboutPage({Key key, this.title = "About"}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final controller = HomeModule.to.get<AboutController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          // body: _buildMainWidget()
          body: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverPersistentHeader(
                delegate: AboutSliverAppBar(expandedHeight: 200),
                pinned: true,
              ),
              SliverToBoxAdapter(
                  child: Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        left: 18,
                        right: 18,
                        bottom: 16,
                      ),
                      child: _buildMainWidget())),
            ],
          )),
    );
  }

  Widget _buildMainWidget() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: <Widget>[
              Texts.aboutTitleText,
              Padding(
                padding:
                    const EdgeInsets.only(top: 22.0, left: 16.0, right: 16.0),
                child: Center(child: Texts.aboutDescriptionText),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: <Widget>[
              Texts.support,
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 24.0),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildUserImage(Images.pmst,
                          MediaQuery.of(context).size.width * 0.25, 10.0),
                      _buildUserImage(Images.logoBsi,
                          MediaQuery.of(context).size.width * 0.25, 70.0),
                      _buildUserImage(Images.logoUast,
                          MediaQuery.of(context).size.width * 0.25, 10.0),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Texts.connectNowText,
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIconCard(FontAwesomeIcons.instagram,
                      'https://www.instagram.com/sertaomaissaude/'),
                  SizedBox(
                    width: 16.0,
                  ),
                  _buildIconCard(FontAwesomeIcons.globe,
                      'http://sertaomaissaude.com.br/site/'),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        )
      ],
    );
  }

  Widget _buildIconCard(IconData icon, String uri) {
    return Container(
      height: 60.0,
      width: 60.0,
      child: Material(
        borderRadius: BorderRadius.circular(12.0),
        elevation: 4.0,
        shadowColor: Colors.white,
        child: MaterialButton(
          onPressed: () => _launchURL(uri),
          child: Icon(
            icon,
            color: AppColors.primaryBlue,
          ),
        ),
      ),
    );
  }

  Widget _buildUserImage(AssetImage img, double size, double margin) {
    return Container(
      margin: EdgeInsets.only(bottom: margin),
      height: size,
      width: size + 10,
      decoration: BoxDecoration(
        //shape: BoxShape.circle,
        image: DecorationImage(
          image: img, // TODO melhorar redimensionamento das imagens
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  _launchURL(String uri) async {
    var url = uri;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
