import 'package:covid19app/app/modules/analisy/analisy_controller.dart';
import 'package:covid19app/app/modules/analisy/analisy_module.dart';
import 'package:covid19app/app/modules/analisy/components/analisy_sliver_app_bar.dart';
import 'package:covid19app/app/modules/analisy/pages/citizen_info/citizen_info_controller.dart';
import 'package:covid19app/app/modules/analisy/pages/citizen_info/components/citizen_info_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:location/location.dart';

class CitizenInfoPage extends StatefulWidget {
  final String title;
  const CitizenInfoPage({Key key, this.title = "Informações de contato"})
      : super(key: key);

  @override
  _CitizenInfoPageState createState() => _CitizenInfoPageState();
}

class _CitizenInfoPageState extends State<CitizenInfoPage>
    with CitizenInfoComponetns {
  final _formKey = GlobalKey<FormState>();

  final _controller = AnalisyModule.to.get<AnalisyController>();
  final _citizenController = AnalisyModule.to.get<CitizenInfoController>();
  final TextEditingController _txtNeighborhood = TextEditingController();

  LocationData location;

  _addLocation() async {
    final permission = await _citizenController.getLocationPermission();

    if (!permission) {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Localização"),
            content: Text(
                'Para identificarmos as áreas de risco, nos informe a sua localização.'),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () async {
                  this.location = await _citizenController.getLocation();
                  Navigator.of(context, rootNavigator: true).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await this._addLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    _txtNeighborhood.text = _controller.neighborhood;
    final val = TextSelection.collapsed(offset: _txtNeighborhood.text.length);
    _txtNeighborhood.selection = val;

    return Observer(
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            body: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverPersistentHeader(
                  delegate: AlisySliverAppBar(
                      expandedHeight: 220, image: 'assets/icons/house.png'),
                  pinned: true,
                ),
                SliverToBoxAdapter(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Seus dados',
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          phoneForm(),
                          SizedBox(
                            height: 16,
                          ),
                          nameForm(),
                          SizedBox(
                            height: 16,
                          ),
                          sexForm(),
                          SizedBox(
                            height: 16,
                          ),
                          ageForm(),
                          SizedBox(
                            height: 16,
                          ),
                          cepForm(),
                          SizedBox(
                            height: 16,
                          ),
                          neighborhoodForm(_txtNeighborhood),
                          SizedBox(
                            height: 16,
                          ),
                          psfForm(),
                          SizedBox(
                            height: 16,
                          ),
                          Center(
                            child: SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: RaisedButton(
                                onPressed: _citizenController.validateForm
                                    ? () async {
                                        if (location != null) {
                                          await _controller.uploadAnalisy(
                                              lat: location.latitude,
                                              lng: location.longitude);
                                          Navigator.of(context)
                                              .pushNamed('analise/direction');
                                        } else {
                                          await _controller.uploadAnalisy(
                                              lat: null, lng: null);
                                          Navigator.of(context)
                                              .pushNamed('analise/direction');
                                        }
                                      }
                                    : null,
                                color: Color(0xFF43D7A1),
                                child: Text(
                                  'Concluir',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
