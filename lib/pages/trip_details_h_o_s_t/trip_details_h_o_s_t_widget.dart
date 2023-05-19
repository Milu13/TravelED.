import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/cancel_trip_h_o_s_t/cancel_trip_h_o_s_t_widget.dart';
import '/components/total/total_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'trip_details_h_o_s_t_model.dart';
export 'trip_details_h_o_s_t_model.dart';

class TripDetailsHOSTWidget extends StatefulWidget {
  const TripDetailsHOSTWidget({
    Key? key,
    this.propertyRef,
    this.tripRef,
  }) : super(key: key);

  final PropertiesRecord? propertyRef;
  final TripsRecord? tripRef;

  @override
  _TripDetailsHOSTWidgetState createState() => _TripDetailsHOSTWidgetState();
}

class _TripDetailsHOSTWidgetState extends State<TripDetailsHOSTWidget> {
  late TripDetailsHOSTModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TripDetailsHOSTModel());
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
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Trip Details',
          style: FlutterFlowTheme.of(context).headlineSmall,
        ),
        actions: [
          Visibility(
            visible: !widget.tripRef!.complete,
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.more_vert_outlined,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 30.0,
              ),
              onPressed: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  barrierColor: Color(0xB314181B),
                  context: context,
                  builder: (bottomSheetContext) {
                    return Padding(
                      padding: MediaQuery.of(bottomSheetContext).viewInsets,
                      child: Container(
                        height: 430.0,
                        child: CancelTripHOSTWidget(
                          tripDetails: widget.tripRef,
                        ),
                      ),
                    );
                  },
                ).then((value) => setState(() {}));
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Dates of trip',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).gray600,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          dateTimeFormat(
                            'd/M/y',
                            widget.tripRef!.tripBeginDate!,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          style: FlutterFlowTheme.of(context).displaySmall,
                        ),
                        Text(
                          ' - ',
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Urbanist',
                                color: FlutterFlowTheme.of(context).darkText,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          dateTimeFormat(
                            'd/M/y',
                            widget.tripRef!.tripEndDate!,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          style: FlutterFlowTheme.of(context).displaySmall,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 4.0),
                    child: Text(
                      'Destination',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).gray600,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: Text(
                      'Marketing'.maybeHandleOverflow(
                        maxChars: 90,
                        replacement: '…',
                      ),
                      style: FlutterFlowTheme.of(context).headlineMedium,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 140.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFDBE2E7),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Align(
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
                                        imageUrl: valueOrDefault<String>(
                                          widget.propertyRef!.mainImage,
                                          'data:image/png;base64,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',
                                        ),
                                        fit: BoxFit.contain,
                                      ),
                                      allowRotation: false,
                                      tag: valueOrDefault<String>(
                                        widget.propertyRef!.mainImage,
                                        'data:image/png;base64,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',
                                      ),
                                      useHeroAnimation: true,
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: valueOrDefault<String>(
                                  widget.propertyRef!.mainImage,
                                  'data:image/png;base64,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',
                                ),
                                transitionOnUserGestures: true,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16.0),
                                  child: CachedNetworkImage(
                                    imageUrl: valueOrDefault<String>(
                                      widget.propertyRef!.mainImage,
                                      'data:image/png;base64,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',
                                    ),
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 0.0, 0.0),
                    child: Text(
                      widget.propertyRef!.propertyName,
                      style: FlutterFlowTheme.of(context).headlineSmall,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'propertyDetails',
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.propertyRef!.propertyAddress,
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF8B97A2),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: FlutterFlowTheme.of(context).grayIcon,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 16.0, 24.0, 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Price Breakdown',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context).gray600,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 4.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Base Price',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF8B97A2),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Text(
                              formatNumber(
                                widget.tripRef!.tripTotal,
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.automatic,
                                currency: '\$',
                              ),
                              style: FlutterFlowTheme.of(context).titleSmall,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 4.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Taxes',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF8B97A2),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Text(
                              '\$24.20',
                              style: FlutterFlowTheme.of(context).titleSmall,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 4.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Cleaning Fee',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF8B97A2),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Text(
                              '\$40.00',
                              style: FlutterFlowTheme.of(context).titleSmall,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 4.0, 24.0, 24.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Total',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF8B97A2),
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 36.0,
                                  icon: Icon(
                                    Icons.info_outlined,
                                    color:
                                        FlutterFlowTheme.of(context).grayIcon,
                                    size: 18.0,
                                  ),
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: Color(0xB3000000),
                                      context: context,
                                      builder: (bottomSheetContext) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(bottomSheetContext)
                                                  .viewInsets,
                                          child: Container(
                                            height: 270.0,
                                            child: TotalWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  },
                                ),
                              ],
                            ),
                            Text(
                              formatNumber(
                                widget.tripRef!.tripTotal,
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.automatic,
                                currency: '\$',
                              ),
                              style: FlutterFlowTheme.of(context).displaySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (!widget.tripRef!.complete)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Mark this trip as complete below.',
                              style: FlutterFlowTheme.of(context).titleMedium,
                            ),
                          ],
                        ),
                        if (!widget.tripRef!.complete)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 24.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final tripsUpdateData = createTripsRecordData(
                                  complete: true,
                                  upcoming: false,
                                );
                                await widget.tripRef!.reference
                                    .update(tripsUpdateData);
                                context.pop();
                              },
                              text: 'Mark as Complete',
                              options: FFButtonOptions(
                                width: 200.0,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).info,
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
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          StreamBuilder<UsersRecord>(
            stream: UsersRecord.getDocument(widget.propertyRef!.userRef!),
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
              final bottomButtonAreaUsersRecord = snapshot.data!;
              return Container(
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  'Guest Info',
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(40.0),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          bottomButtonAreaUsersRecord.photoUrl,
                                          'https://images.unsplash.com/photo-1654537736400-bfae7cd99bac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNXx8fGVufDB8fHx8&auto=format&fit=crop&w=900&q=60',
                                        ),
                                        width: 40.0,
                                        height: 40.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 12.0, 0.0),
                                      child: Text(
                                        'User name'.maybeHandleOverflow(
                                          maxChars: 90,
                                          replacement: '…',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Urbanist',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'chatDetails',
                                  queryParams: {
                                    'chatUser': serializeParam(
                                      bottomButtonAreaUsersRecord,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'chatUser': bottomButtonAreaUsersRecord,
                                  },
                                );
                              },
                              text: 'Chat',
                              icon: Icon(
                                Icons.forum_outlined,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                width: 110.0,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).info,
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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
