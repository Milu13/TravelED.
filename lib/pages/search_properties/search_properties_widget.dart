import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_properties_model.dart';
export 'search_properties_model.dart';

class SearchPropertiesWidget extends StatefulWidget {
  const SearchPropertiesWidget({
    Key? key,
    this.searchTerm,
  }) : super(key: key);

  final String? searchTerm;

  @override
  _SearchPropertiesWidgetState createState() => _SearchPropertiesWidgetState();
}

class _SearchPropertiesWidgetState extends State<SearchPropertiesWidget> {
  late SearchPropertiesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchPropertiesModel());

    _model.textController ??= TextEditingController(text: widget.searchTerm);
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).dark600,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          buttonSize: 46.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF95A1AC),
            size: 24.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Search',
          style: FlutterFlowTheme.of(context).titleMedium.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.of(context).tertiary,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).dark600,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3.0,
                      color: Color(0x39000000),
                      offset: Offset(0.0, 1.0),
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 4.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
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
                                labelText: 'Address, city, state...',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color:
                                          FlutterFlowTheme.of(context).grayIcon,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                prefixIcon: Icon(
                                  Icons.search_sharp,
                                  color: FlutterFlowTheme.of(context).grayIcon,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Urbanist',
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                  ),
                              validator: _model.textControllerValidator
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).info,
                              textStyle: FlutterFlowTheme.of(context)
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
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
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
                    List<PropertiesRecord> listViewPropertiesRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewPropertiesRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewPropertiesRecord =
                            listViewPropertiesRecordList[listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 12.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
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
                                context.pushNamed(
                                  'propertyDetails',
                                  queryParams: {
                                    'propertyRef': serializeParam(
                                      listViewPropertiesRecord,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'propertyRef': listViewPropertiesRecord,
                                  },
                                );
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Hero(
                                    tag: valueOrDefault<String>(
                                      listViewPropertiesRecord.mainImage,
                                      'data:image/jpeg;base64,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' +
                                          '$listViewIndex',
                                    ),
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: valueOrDefault<String>(
                                          listViewPropertiesRecord.mainImage,
                                          'data:image/jpeg;base64,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',
                                        ),
                                        width: double.infinity,
                                        height: 190.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      'Introduction to programming'
                                          .maybeHandleOverflow(
                                        maxChars: 36,
                                        replacement: '…',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Urbanist',
                                            color: FlutterFlowTheme.of(context)
                                                .darkText,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      'Online'.maybeHandleOverflow(
                                        maxChars: 90,
                                        replacement: '…',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                          ),
                                    ),
                                  ),
                                  StreamBuilder<List<ReviewsRecord>>(
                                    stream: queryReviewsRecord(
                                      queryBuilder: (reviewsRecord) =>
                                          reviewsRecord.where('propertyRef',
                                              isEqualTo:
                                                  listViewPropertiesRecord
                                                      .reference),
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
                                          containerReviewsRecordList =
                                          snapshot.data!;
                                      return Container(
                                        height: 40.0,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 24.0, 12.0),
                                          child: StreamBuilder<
                                              List<ReviewsRecord>>(
                                            stream: queryReviewsRecord(
                                              queryBuilder: (reviewsRecord) =>
                                                  reviewsRecord.where(
                                                      'propertyRef',
                                                      isEqualTo:
                                                          listViewPropertiesRecord
                                                              .reference),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ReviewsRecord>
                                                  ratingBarReviewsRecordList =
                                                  snapshot.data!;
                                              final ratingBarReviewsRecord =
                                                  ratingBarReviewsRecordList
                                                          .isNotEmpty
                                                      ? ratingBarReviewsRecordList
                                                          .first
                                                      : null;
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.star_rounded,
                                                    color: Color(0xFFFFA130),
                                                    size: 24.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      '3.4',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: Color(
                                                                    0xFF8B97A2),
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(2.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Rating',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: Color(
                                                                    0xFF8B97A2),
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
