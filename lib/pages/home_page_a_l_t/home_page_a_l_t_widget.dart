import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_a_l_t_model.dart';
export 'home_page_a_l_t_model.dart';

class HomePageALTWidget extends StatefulWidget {
  const HomePageALTWidget({Key? key}) : super(key: key);

  @override
  _HomePageALTWidgetState createState() => _HomePageALTWidgetState();
}

class _HomePageALTWidgetState extends State<HomePageALTWidget> {
  late HomePageALTModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageALTModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).cultured,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                ClipRect(
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: 2.0,
                      sigmaY: 2.0,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 370.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).tertiary,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/hero_home@3x.jpg',
                          ).image,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 370.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF1E2429), Color(0x001E2429)],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(0.0, 1.0),
                      end: AlignmentDirectional(0, -1.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                        child: Image.asset(
                          'assets/images/__2023-05-09__19.52.33-removebg-preview.png',
                          width: 230.0,
                          height: 90.0,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Welcome!',
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Urbanist',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          fontSize: 36.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Find your Dream Space',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Urbanist',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          fontWeight: FontWeight.w100,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 4.0, 0.0),
                                        child: TextFormField(
                                          controller: _model.textController,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText:
                                                'Address, city, state...',
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiary,
                                            prefixIcon: Icon(
                                              Icons.search_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .grayIcon,
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Urbanist',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayIcon,
                                              ),
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: 'Search',
                                        options: FFButtonOptions(
                                          width: 100.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Urbanist',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: StreamBuilder<List<PropertiesRecord>>(
                stream: queryPropertiesRecord(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                    );
                  }
                  List<PropertiesRecord> columnPropertiesRecordList =
                      snapshot.data!;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(columnPropertiesRecordList.length,
                        (columnIndex) {
                      final columnPropertiesRecord =
                          columnPropertiesRecordList[columnIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 12.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).tertiary,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x32000000),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('propertyDetails');
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'propertyDetails',
                                      queryParams: {
                                        'propertyRef': serializeParam(
                                          columnPropertiesRecord,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'propertyRef': columnPropertiesRecord,
                                      },
                                    );
                                  },
                                  child: Hero(
                                    tag: valueOrDefault<String>(
                                      columnPropertiesRecord.mainImage,
                                      'data:image/jpeg;base64,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' +
                                          '$columnIndex',
                                    ),
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0),
                                      ),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          columnPropertiesRecord.mainImage,
                                          'data:image/jpeg;base64,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',
                                        ),
                                        width: double.infinity,
                                        height: 190.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'English with Marina',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Urbanist',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'online',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .grayIcon,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '4/5 reviews',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayIcon,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
