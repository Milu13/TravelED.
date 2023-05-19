import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/amenitity_indicator/amenitity_indicator_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'property_details_model.dart';
export 'property_details_model.dart';

class PropertyDetailsWidget extends StatefulWidget {
  const PropertyDetailsWidget({
    Key? key,
    this.propertyRef,
  }) : super(key: key);

  final PropertiesRecord? propertyRef;

  @override
  _PropertyDetailsWidgetState createState() => _PropertyDetailsWidgetState();
}

class _PropertyDetailsWidgetState extends State<PropertyDetailsWidget>
    with TickerProviderStateMixin {
  late PropertyDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  int get pageViewCurrentIndex => _model.pageViewController != null &&
          _model.pageViewController!.hasClients &&
          _model.pageViewController!.page != null
      ? _model.pageViewController!.page!.round()
      : 0;

  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 60.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 70.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 80.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 90.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.4, 0.0),
          end: Offset(0.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PropertyDetailsModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<ReviewsRecord>>(
      stream: queryReviewsRecord(
        queryBuilder: (reviewsRecord) => reviewsRecord.where('propertyRef',
            isEqualTo: widget.propertyRef!.reference),
      ),
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
        List<ReviewsRecord> propertyDetailsReviewsRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 320.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFDBE2E7),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: CachedNetworkImage(
                                                imageUrl:
                                                    valueOrDefault<String>(
                                                  widget.propertyRef!.mainImage,
                                                  'data:image/jpeg;base64,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',
                                                ),
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: false,
                                              tag: valueOrDefault<String>(
                                                widget.propertyRef!.mainImage,
                                                'data:image/jpeg;base64,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',
                                              ),
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: valueOrDefault<String>(
                                          widget.propertyRef!.mainImage,
                                          'data:image/jpeg;base64,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',
                                        ),
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          child: CachedNetworkImage(
                                            imageUrl: valueOrDefault<String>(
                                              widget.propertyRef!.mainImage,
                                              'data:image/jpeg;base64,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',
                                            ),
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pop();
                                                },
                                                child: Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: Color(0x3A000000),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30.0,
                                                    buttonSize: 46.0,
                                                    icon: Icon(
                                                      Icons.arrow_back_rounded,
                                                      color: Colors.white,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      context.pop();
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Professional Skills for the Workplace',
                                style:
                                    FlutterFlowTheme.of(context).displaySmall,
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation1']!),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 4.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'ofline',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF8B97A2),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation2']!),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 8.0, 24.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'propertyReview',
                              queryParams: {
                                'propertyRef': serializeParam(
                                  widget.propertyRef,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'propertyRef': widget.propertyRef,
                              },
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.star_sharp,
                                color: Color(0xFFFFA130),
                                size: 24.0,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '4.2',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF8B97A2),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    2.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Reviews',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF8B97A2),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ).animateOnPageLoad(
                            animationsMap['rowOnPageLoadAnimation1']!),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'DESCRIPTION',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ).animateOnPageLoad(
                            animationsMap['rowOnPageLoadAnimation2']!),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 4.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 24.0),
                                child: Text(
                                  'This Specialization is intended for working professionals early in their career and for organizations who look to improve interpersonal relationship skills among their employees, clients, and customers.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF8B97A2),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation3']!),
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
                          children: [
                            Text(
                              'Amenities',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ).animateOnPageLoad(
                            animationsMap['rowOnPageLoadAnimation3']!),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 0.0, 0.0),
                        child: StreamBuilder<List<AmenititiesRecord>>(
                          stream: queryAmenititiesRecord(
                            queryBuilder: (amenititiesRecord) =>
                                amenititiesRecord.where('propertyRef',
                                    isEqualTo: widget.propertyRef!.reference),
                            singleRecord: true,
                          ),
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
                            List<AmenititiesRecord>
                                amenitiesRowAmenititiesRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final amenitiesRowAmenititiesRecord =
                                amenitiesRowAmenititiesRecordList.isNotEmpty
                                    ? amenitiesRowAmenititiesRecordList.first
                                    : null;
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (amenitiesRowAmenititiesRecord!.evCharger)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.amenitityIndicatorModel1,
                                        updateCallback: () => setState(() {}),
                                        child: AmenitityIndicatorWidget(
                                          icon: Icon(
                                            Icons.ev_station,
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                          ),
                                          background:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .lineGray,
                                        ),
                                      ),
                                    ),
                                  if (amenitiesRowAmenititiesRecord!.pool)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.amenitityIndicatorModel2,
                                        updateCallback: () => setState(() {}),
                                        child: AmenitityIndicatorWidget(
                                          icon: Icon(
                                            Icons.pool_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                          ),
                                          background:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .lineGray,
                                        ),
                                      ),
                                    ),
                                  if (amenitiesRowAmenititiesRecord!
                                      .extraOutlets)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.amenitityIndicatorModel3,
                                        updateCallback: () => setState(() {}),
                                        child: AmenitityIndicatorWidget(
                                          icon: Icon(
                                            Icons.power_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                          ),
                                          background:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .lineGray,
                                        ),
                                      ),
                                    ),
                                  if (amenitiesRowAmenititiesRecord!.ac)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.amenitityIndicatorModel4,
                                        updateCallback: () => setState(() {}),
                                        child: AmenitityIndicatorWidget(
                                          icon: Icon(
                                            Icons.ac_unit_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                          ),
                                          background:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .lineGray,
                                        ),
                                      ),
                                    ),
                                  if (amenitiesRowAmenititiesRecord!
                                      .dogFriendly)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.amenitityIndicatorModel5,
                                        updateCallback: () => setState(() {}),
                                        child: AmenitityIndicatorWidget(
                                          icon: Icon(
                                            Icons.pets_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                          ),
                                          background:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .lineGray,
                                        ),
                                      ),
                                    ),
                                  if (amenitiesRowAmenititiesRecord!.washer)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.amenitityIndicatorModel6,
                                        updateCallback: () => setState(() {}),
                                        child: AmenitityIndicatorWidget(
                                          icon: Icon(
                                            Icons
                                                .local_laundry_service_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                          ),
                                          background:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .lineGray,
                                        ),
                                      ),
                                    ),
                                  if (amenitiesRowAmenititiesRecord!.dryer)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.amenitityIndicatorModel7,
                                        updateCallback: () => setState(() {}),
                                        child: AmenitityIndicatorWidget(
                                          icon: Icon(
                                            Icons.local_laundry_service_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                          ),
                                          background:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .lineGray,
                                        ),
                                      ),
                                    ),
                                  if (amenitiesRowAmenititiesRecord!.workout)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.amenitityIndicatorModel8,
                                        updateCallback: () => setState(() {}),
                                        child: AmenitityIndicatorWidget(
                                          icon: Icon(
                                            Icons.fitness_center_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                          ),
                                          background:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .lineGray,
                                        ),
                                      ),
                                    ),
                                  if (amenitiesRowAmenititiesRecord!.nightLife)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.amenitityIndicatorModel9,
                                        updateCallback: () => setState(() {}),
                                        child: AmenitityIndicatorWidget(
                                          icon: Icon(
                                            Icons.nightlife,
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                          ),
                                          background:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .lineGray,
                                        ),
                                      ),
                                    ),
                                  if (amenitiesRowAmenititiesRecord!.hip)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.amenitityIndicatorModel10,
                                        updateCallback: () => setState(() {}),
                                        child: AmenitityIndicatorWidget(
                                          icon: Icon(
                                            Icons.theater_comedy,
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                          ),
                                          background:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .lineGray,
                                        ),
                                      ),
                                    ),
                                  if (amenitiesRowAmenititiesRecord!.heater)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.amenitityIndicatorModel11,
                                        updateCallback: () => setState(() {}),
                                        child: AmenitityIndicatorWidget(
                                          icon: Icon(
                                            Icons.wb_sunny_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                          ),
                                          background:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .lineGray,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ).animateOnPageLoad(
                                animationsMap['rowOnPageLoadAnimation4']!);
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 260.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'What people are saying',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: StreamBuilder<List<ReviewsRecord>>(
                                      stream: queryReviewsRecord(
                                        queryBuilder: (reviewsRecord) =>
                                            reviewsRecord
                                                .where('propertyRef',
                                                    isEqualTo: widget
                                                        .propertyRef!.reference)
                                                .orderBy('ratingCreated',
                                                    descending: true),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                              ),
                                            ),
                                          );
                                        }
                                        List<ReviewsRecord>
                                            pageViewReviewsRecordList =
                                            snapshot.data!;
                                        if (pageViewReviewsRecordList.isEmpty) {
                                          return Center(
                                            child: Image.asset(
                                              'assets/images/noRatingsEmpty@2x.png',
                                              width: 300.0,
                                            ),
                                          );
                                        }
                                        return Container(
                                          width: double.infinity,
                                          height: 200.0,
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 30.0),
                                                child: PageView.builder(
                                                  controller: _model
                                                          .pageViewController ??=
                                                      PageController(
                                                          initialPage: min(
                                                              0,
                                                              pageViewReviewsRecordList
                                                                      .length -
                                                                  1)),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount:
                                                      pageViewReviewsRecordList
                                                          .length,
                                                  itemBuilder:
                                                      (context, pageViewIndex) {
                                                    final pageViewReviewsRecord =
                                                        pageViewReviewsRecordList[
                                                            pageViewIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  12.0,
                                                                  12.0,
                                                                  12.0),
                                                      child: Container(
                                                        width: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 5.0,
                                                              color: Color(
                                                                  0x24090F13),
                                                              offset: Offset(
                                                                  0.0, 2.0),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      12.0,
                                                                      12.0,
                                                                      12.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              StreamBuilder<
                                                                  UsersRecord>(
                                                                stream: UsersRecord
                                                                    .getDocument(
                                                                        pageViewReviewsRecord
                                                                            .userRef!),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).info,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final rowUsersRecord =
                                                                      snapshot
                                                                          .data!;
                                                                  return Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'Anna',
                                                                            style:
                                                                                FlutterFlowTheme.of(context).headlineSmall,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                RatingBarIndicator(
                                                                              itemBuilder: (context, index) => Icon(
                                                                                Icons.star_rounded,
                                                                                color: Color(0xFFFFA130),
                                                                              ),
                                                                              direction: Axis.horizontal,
                                                                              rating: pageViewReviewsRecord.rating,
                                                                              unratedColor: Color(0xFF95A1AC),
                                                                              itemCount: 5,
                                                                              itemSize: 24.0,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        clipBehavior:
                                                                            Clip.antiAlias,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child: Image
                                                                            .network(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            rowUsersRecord.photoUrl,
                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-property-finder-834ebu/assets/9s7dlqs0q8jj/user_1.5@2x.jpg',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            24.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          'Excellent course! Thank you very much! The acquired knowledge has already been useful in the workplace'
                                                                              .maybeHandleOverflow(
                                                                            maxChars:
                                                                                130,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Lexend Deca',
                                                                                color: Color(0xFF8B97A2),
                                                                                fontSize: 14.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
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
                                                  },
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: smooth_page_indicator
                                                      .SmoothPageIndicator(
                                                    controller: _model
                                                            .pageViewController ??=
                                                        PageController(
                                                            initialPage: min(
                                                                0,
                                                                pageViewReviewsRecordList
                                                                        .length -
                                                                    1)),
                                                    count:
                                                        pageViewReviewsRecordList
                                                            .length,
                                                    axisDirection:
                                                        Axis.horizontal,
                                                    onDotClicked: (i) async {
                                                      await _model
                                                          .pageViewController!
                                                          .animateToPage(
                                                        i,
                                                        duration: Duration(
                                                            milliseconds: 500),
                                                        curve: Curves.ease,
                                                      );
                                                    },
                                                    effect: smooth_page_indicator
                                                        .ExpandingDotsEffect(
                                                      expansionFactor: 2.0,
                                                      spacing: 8.0,
                                                      radius: 16.0,
                                                      dotWidth: 8.0,
                                                      dotHeight: 8.0,
                                                      dotColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grayIcon,
                                                      activeDotColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .gunmetal,
                                                      paintStyle:
                                                          PaintingStyle.fill,
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryText,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x55000000),
                      offset: Offset(0.0, 2.0),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 40.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '\$156',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      if (widget.propertyRef!.userRef != currentUserReference)
                        FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed(
                              'bookNow',
                              queryParams: {
                                'propertyDetails': serializeParam(
                                  widget.propertyRef,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'propertyDetails': widget.propertyRef,
                              },
                            );
                          },
                          text: 'Register',
                          options: FFButtonOptions(
                            width: 130.0,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF4B39EF),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
