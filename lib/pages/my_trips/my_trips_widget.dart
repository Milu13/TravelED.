import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/review_trip/review_trip_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'my_trips_model.dart';
export 'my_trips_model.dart';

class MyTripsWidget extends StatefulWidget {
  const MyTripsWidget({Key? key}) : super(key: key);

  @override
  _MyTripsWidgetState createState() => _MyTripsWidgetState();
}

class _MyTripsWidgetState extends State<MyTripsWidget> {
  late MyTripsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyTripsModel());
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
      backgroundColor: FlutterFlowTheme.of(context).dark600,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).dark600,
        automaticallyImplyLeading: false,
        title: Text(
          'My Trips',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Urbanist',
                color: FlutterFlowTheme.of(context).tertiary,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(0.0, 0),
                      child: TabBar(
                        labelColor: FlutterFlowTheme.of(context).turquoise,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).grayIcon,
                        labelStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w500,
                                ),
                        indicatorColor: FlutterFlowTheme.of(context).turquoise,
                        indicatorWeight: 4.0,
                        tabs: [
                          Tab(
                            text: 'Upcoming',
                          ),
                          Tab(
                            text: 'Completed',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: StreamBuilder<List<TripsRecord>>(
                                stream: queryTripsRecord(
                                  queryBuilder: (tripsRecord) => tripsRecord
                                      .where('userRef',
                                          isEqualTo: currentUserReference)
                                      .where('cancelTrip', isEqualTo: false)
                                      .where('upcoming', isEqualTo: true)
                                      .orderBy('tripBeginDate',
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
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    );
                                  }
                                  List<TripsRecord> listViewTripsRecordList =
                                      snapshot.data!;
                                  if (listViewTripsRecordList.isEmpty) {
                                    return Center(
                                      child: Image.asset(
                                        'assets/images/noTrips@2x.png',
                                        width: 300.0,
                                      ),
                                    );
                                  }
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewTripsRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewTripsRecord =
                                          listViewTripsRecordList[
                                              listViewIndex];
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
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child:
                                              StreamBuilder<PropertiesRecord>(
                                            stream:
                                                PropertiesRecord.getDocument(
                                                    listViewTripsRecord
                                                        .propertyRef!),
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
                                              final columnPropertiesRecord =
                                                  snapshot.data!;
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'tripDetails',
                                                    queryParams: {
                                                      'propertyRef':
                                                          serializeParam(
                                                        columnPropertiesRecord,
                                                        ParamType.Document,
                                                      ),
                                                      'tripRef': serializeParam(
                                                        listViewTripsRecord,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'propertyRef':
                                                          columnPropertiesRecord,
                                                      'tripRef':
                                                          listViewTripsRecord,
                                                    },
                                                  );
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  CachedNetworkImage(
                                                                imageUrl:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  columnPropertiesRecord
                                                                      .mainImage,
                                                                  'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoGCBMVExcVFRUYGBcZGh8aGhoaGR8jHBwdHBkZGhwaGhocIysjGhwoHx8ZJDUkKCwuMjIyGiE3PDcxOysxMi4BCwsLDw4PHBERHC4fISguMTExLjExLjExMTExMTExMTExMTExMTExMTExMTExMTExMTExMTExMTExMTExMTExMf/AABEIALcBEwMBIgACEQEDEQH/xAAcAAACAgMBAQAAAAAAAAAAAAAEBQMGAAIHAQj/xABDEAACAQIEBAQDBQUHAwMFAAABAhEAAwQSITEFIkFRBhNhcTKBkQdCobHBFFJi0fAjM3KCouHxFpLCFUOyFyRTY6P/xAAaAQADAQEBAQAAAAAAAAAAAAAAAQIDBAUG/8QAJxEAAgICAgIBBAIDAAAAAAAAAAECEQMhBBIxQVETInGBQmEFFKH/2gAMAwEAAhEDEQA/AOd8KxfluGiY6TEyI3/ranlji1w5TlkrOsnqCJMRqATrpB1qsYe7HQe//NFLfJ3NIyaLhh+JLKZmCKqgEKRmJChQc6AssADXX2oTjeKtXCpVmMKFMrCyJ+FcxyiI07yYE0jt3KYcXsG05tm2VCkgMQZcD7+uhXqI0g0EMDuvXtq4p0OhqF2qdMA+4ysQcpUHmUkE80iPunYnbWKCDHsD1qJrA/qKzEM6xIjMoYeoOxr3AYd7hYKeYAGAJJBdVMD0DZvYGgCTAYQXLioSeYxpG8GPxihKaWLYw13NeOquVVABmIBKm4etuIlTvMHYaj8Rs27uZ7DFsqqWXLByhFDPlHXMCWifiB2mgYKGFFYa0W1CsV6kKTHeg+H4Vrm2g2mCZJBIVVGrMYOg6AkwNaYM6qbRN0RbUcqFi4eczBSBlHMTzAx7xFBSCLihHKhg4B0YbMNwfTTp02qVHHpSpsTmYttmJMDbUzAqVL9SWWSxhVZFytzNpuMoYzltnsxgmdtvei04Ywg5uUsVBj1uL/4z/mFV1Me5CKGICGVAAEHfNpu3qddKYWMViAABnygL9zTkJKzI7k/WlQwlUJCcwGfQT3kj9K1UvBMaASTOkTlHvrP0oZ8UQqKRqrZtW03nbofWtsPfYoUyq6kCOcKVILkGSdfibSigJ8Nckkk8qiWP6e5OnzqO876tlIG9R4y3lRUDpGjOQ6mWI2gGYUae+avLXEAugKxuQTudP6+dKgNrlu7MBSTlzGNYB7gbUtvOd9YPp8/yI+tMb2NbMzo1hSwgkvJ+6RIYlZBUEaVJiOJF1ErZzBiRF1AIZXVlgkdGEdstMYgxKkRPUSPY7GgbsU24nae42dVEkDNF1GEgRKhTIHprSW/IJBEEdDTEQXgKhy1K1YLbb5TEEzHQbkdwKoCEoKje3U7g71ExoGD5K1YUWbIz5ZGkTJiSYMCBpvFZcvXV0AyDUcqxMb8252PXpQUBGvKJPmED4mnbrPy3714ybyMrLqQRGm2x2OooAHr0CrDwzwdjryh1sMqfv3CLYjuM8Fh6gGrt4T8D4K1lbFl8Rd38u2CLS7EBjozn6DWINAUzmVjAXmUMltyp2IQkfIgVlfSlrHMoCqlxVGgVQigDsFnSspWPqfNSGiLb1rasDSSdcu38Y0/X6etbNahFb96R7HcfUa0zNoItvTXB3BcAtMYYaWmPc/8AtMf3STofuk9iaAwGGRwOcoe7FMv1LggfI1paYq47hhsZEg9xvQS0FZQmrzm+6o3/AMTdh6bn03qccVKksihWZw7GZBKkkAD7qySY1940qLjw/tJ7lx/23bi/kBQE0EMIxuKa5lzZeVcohQumZm2UAbselDq5Gx30ojEJbe4BZDBSBo7AwYliWAHKNTPYVDdVZhZI7nr6gdB6UEmYi8zsWYyx1J71LwhovqczLlzNmQ8wyozafT50wscHDIHLFV8nzmYrsfONsKBu0gSI79BrQF+4Iy21yr1J+Nv8R6D+Eae+9AEl4vbszsbtx5IWMyBbbCDvkJbYaaa+i8NUxXQSTA29PbtWjCkOyXURIIkSPUSRI9JBHyqfDIzsFA1P9SewA1onFYS5lRcvMi20j94XWuXUZT21KnpI96wXLNslJZ5Uq7qREllMWwRqBBUk75jGkSyze5cu2yF8wxAIKsYIIkREViM7n7zECTuTA6n0qXiVkG3buqyhCuQITzjJodI17ltpJjpW78RDDmzDLGVVO57lzqoHpqZ6b1JQPvW4cVrbxi7vJLOSxHYgCYjXdqItYkWWytuDzIydtQWkaj4du5pDBLr1Az0RxZwzB0+AgKJ3GVEBBH69aWu9NASl62RGIkAkayQO0T9JX6ihleaZcNxLFWtBoBW44A6sLTSp9Coj3igATEWXVQzIwVtiQYOgOh66EH5ihi1FcS4kbpiAqTmCACAcoXcAEwAAJ2AigC9UBszUbh8eq2sjLm0uQexcKB/l0aR7UtL1qzUANb+Jsm2EJgEEggTkYfDP4o3cBG3FJ8RbZTDaHqJ1HoR0PpvW1m9kdXABKsGAOxggwfSiGtC9nZFysCWNsFmLKdSyliSxB3HYzrrQMgFxpDoSHAgwYOgiR3kbitreIcZuXMzNmMiRqCDyxMmSJnap+B8Hu4m4tu0juzGAEAJ9zJAVRpLExXUvD32dYfDIHx7m7c3FpGYW19CRBc/RekGgaVlF8KeHcXjXz2raW7aOXa8wIRSYlQuzmPugdpImuj+E/C2Ew7F8nmXBvduKMxP/AOtBy2x7SfWtOIcWZytu1Fq0miW7fKoHssUqx/F79tlHmPlnXmNTZqoV5Lh/6kAWBBOvXWmGDuqtrOVCs2oA3iqhZ4ndEHMHU/vAH8Ymj18R2Y57BJ99KLHQRezsxMb/AMRrKU3vFF4k5VtqvQRsKygDjdvFuI1mIiRMZdiPapBiSVKvJAACdlgAbe35mh1WtoqjA2U0w4fYLEHKSsnbqQpYID3MR8694fbXy8xKyGflYTMWiU6Rvm69BUF7EM5BYzGw2AHZVGij2oJYfikZ7TXGtBZcQRmkg5s0hiZGbLzHWTuaAFSri3yupIbPAJYSeWYgnUbmtHRgASIDCR6gUEsIsiLVxu7LbH+bMx/+AHzNDhhTfhWKuW8O7AFVVgQwQ87FWUKXA+6WDQTqNKRg0ENDBeI3cqrm5VUoFOoyly5BB0PN+QozC8MOIGayjTIDoFZgpOzKRMoT0Oq+o1Ci02oHSvo3gly3btBUgKsBQAAFECAIpF48fY4RieB30BLKVgE8wZTC2xcOjAHYke6sKgFsJ/ZgK11yELHVbeYxC9GfXVvu9NdR9GNft3FKuqspEFWAII7EHQ1xHxzw+xY4iiWRlQm05UHRCz6qOwgK0dM0Uxzx9dibiHFLmR7TIMri0RJkplt29VPZgJI6En1lTmpl4ntxdX1tr/pZrf8A4R8qVUEhKOYqfD28wf8AhTN9GUH8CfpQIeKJweKCZ5+9bdfmV5fxigZ5ilymPQH6qD+taq+tb3w1weYqnKiIrHsVVVJjeNvrQmakAzDC4hEgXEEidA6jUj/EOncabgSLi42A2AMz3AP60OWqycB4Rbu3ne82WxbVS5G7EohCLHUyOo3HqQi1sVYrAFEL51MCyQAyknzbZcyAZWIjUazW2Cwd1brAhQ6IXyl15szLay51JCsc+k9YHWrVxnwjZvW1v4IgE5psswBaGMMjTAJEaGAdwelVfB8LvW71prltrds3VzM2iQrBnDN8IgKSQTploTG00C4vhpt3Llt7ltChAOcsCZUNoqqx2IqPDgZnBZLlu2jNIWAx0VQCyhxLso1jQGoMTYdWK3JziJkzOgIOYTIIggzqCK34dBL2zp5q5ATsGzK6T2GZQD71QAc1NgsG90wvrqZiQJgkAxoCZOmlaG02bKQQwOXLGszER3nSul+G/s7drWbEOMMLiiRveIg5gyklVUkkxvougK0hpWULimGtjIUKkRBK6ZjJgZT8LqsZpHY65tbN4J+z7FYnJec/s9oMCHaRcYAgk21jtsx0nvXSODcH4dg8vlWgzqIW5c5m1M6TopJ10FFcR4xIOpP9GlZahZ7h0w2Ctm3hbeWTLvpndjuWbr+Q2AFI+I4pmkk70N+352YGZ3Gm42/A/mK3RZ309KLLSoCs2TmmlviBJNWRgqg0mxNouTpQUZ4fbNbCnpUl21Da17wm3kaKJ4mwVgo3NJkgn7OPWsrW7igCRO1ZQUcyw1iYLaJIBJ03Mb1tjnUvyRl20ED5dT89ajOKeMs6SDsOn9TXhvsRl0j0VR+IFWYEtq2MrE7jKR7EkE+omNa0U1OmLbyzbgERAncc+ckHpOxG2gqAT0oIZJbiRmnLImN4nWPWKaHH2XgeWEOclZOZAGVV5gY5RlWBr8+qoqBudew/U7VvwpwL9ssdmB3iSCCFJPwzET0mgVDHDYu0ZRo+8gJ5LRXzEuBjlBZDykQAZkdtV+PZPNc2/wC7LHJoRyzpoST9a04naW3euIoMIxXUztoRPXWahDUEsY4Dh5u2r9wOB5SB8kEu4JIJUDosSx6Cu2YO4fJ92/8AEVxfwm8Yuz1l8vw5pzAqBAIMSRrOnqJFdvFuFA+cVEns2wrTCuEsSRXI/tHaeK3gdg9sf/zt9eldj4Ta10rkv2rYLLi8RcylT5loAk6XA9kmQI0KlIMH7w26tBlWgDivDbRuC6twXLWa6GzXAIdXd0tuWb+zDFlXNsdWBlhSDGWMqW2BQ5lM5XUkNmeQUksoAy6kQfWh87AMASAwAYDYgGQCOsEA1AaZibzTnguIw6m2Ht+YxttoBOZ/NYrbZTvKqokbZtZGyKab+HLQDrdY/CXZRlnMbdvzGBM8g1UTrqw060DRBicYui2QyqFa2SWBNxGuM8tyjuNNYyjXSh4ojhnB7t0HyyhKqWYFsmVVHMzM4CAAazmqy+G/BNy/iFtG4BbFtbty4pVgoJ+AQxkkTDbaHTQikVVijwxwC9jbwtWh6u5+G2v7zH8huTXYeF4LB4VBZtZb15MqNcbKxUhfjI+FCq7Aa7AzvSfxHxmxwqx+z4O0OY8zsxJLHq5GrNA20gRtpXJlL3LoygtdZpECWLEzpGszR+CtRPpEYmwUClFZQIAIBEbdaExWNw2XynS3luk8jAENsDynQjYfMVyzwvxxx5ZNu/etC2M9wmFR9JYXHIVhOYQW9u1XHBcRw2JB8q4jkCDlPMo/MD1+lKzRNMg8TfZ5YvjPhmFpx9xtUbQADN8SwAANwBoBXNeLcCxGDu5b2HBzcqhgzI5O2RrbAluwBB9K7Xhr7CmmHvg7gESD8xqDTE4HOvDfh39lLYzFANinYuqhZSySSSWgxnMzr8MDrWXMU968BnJJMNrsCTzD0BOtWrxTwkuM9pjqea2T+Knp7Gqph8Ff85CEaQZGdArDuAwgMIqJPZpCKSG9yz5Y79QTtr6UtxWMuh8kwI2jSrDxlBkyDfLA+Q0qrX2bEXVtJbOcjK4HUhZ09PWkUjy6DBPKGGuaQFjqSdgIkk7URZc6H61XfFdnHW7Zsrhbq2xPmXWWVbQgjKA0INI6kgH0pp4FxqYjDAtcAa1yXCxA0A5XMnYj8QatJ0S5KxqTIrUjTaKDxviLB21Yrd82ATFsTOWJhjCmJHWq3xHxJfuZltJbtwWEyLjQoBlT8A3UbGJ30o2JyRZcTjLFnnuXFQep3joB1PoKqPHvGoZybKT0DPIHyUa/iKqeNuOzk3GZn6ljJ+vahytVRDmMm4/iT/7seyr/ACrKV1lFE2woVsorQGmmFwqsIlcxtFgus5sxjXYGBG9MAbC2WuMqKJZiAPn37Cj+OYRLDC2jh2yzcPVT+52A6xvrrW/CcCWIhit0OV5WG2VAcpH3gXn2BpbiLLJGYRmAYazIM6yPnUksgJojCW7TB/MuMkKCuVQxJzAEQWXoZ36HtW74FlQXG0Q5dQJ0bNPbUAAx/EveocXeU8qCEHwg/Ef4nI3Y/QbD1oVEvFxbF5/L/uyZt6RynUaH6fKhQRRdjFI1s2rswsm241KHcoZ3tt/paD+8CZxHgRt3QhaEyu7OBmCqt27b+6eYkW5iRudoNAUO/spwHmYo3SBFpdCejvyr/pz11m/cAIEiqh4U4ctjDIFDS/8AaNnADSwGUMATELlETvNHYnEM25P9e1eLyP8AIqGRxS8HucT/AB/aCbfnZdOFXBp0rnn28YFs9m+ASmQox6A5pWe0ydesAVZeAYk6iTI2BOhozjuTEWGR0nQiO8gjLGm+ojTWOtdnH5cckU/FnJyuI4NpHAjw68yq6W2dSJlQTHMV5o21BFQY7BXbYU3EKZ5y5tzlOVpG6wZGsbGnlrF2rJezca9ZZHZWa3dLrGghLTLEEgtq082/ZRgb4uYm21647J5gLM7a5cwJJLEwSAJrtPNogweHzklnCIol3PQHYKu7ueij5wASGOCtve5MPcyHNHkBmFxgsMLkgBbj7kgQRkECAIsHh7BYfFuroGV4ZZKahmS+HDQQpk3LTBv4Y7wwwGDbALed1ytbUeSM/wAZILG7m++5gDLsOg1FJsuMRp4Wwr4m063FCo7kMCJRzJUKbYEMdFbMInMddBltXC/D1jB2WCPcPmMHdneSxACgbAxA2pTh+M2sHgbV1E81GVXOXTLnMlgvYElY6QBTPjHEBctXAUyqoBLPos76agkb/WO9TZqkUP7QeDRaRra4i6RLZxDLNxgWNxQsiQBBEgbGqlwTjJwwYpattcba48kqI0Crtoeae8dqZce8S4hrz22u+ZZUwLYgW25IGbKOaCf9I2MQm4HZtPcK3cxHltlylQc4hgTmIBEBhBI3qkYydvQLisVcuGblx7hGxdiY9p2+VZYulWDKSrDYgwR7Eain2G4bgHRP/uCjs1uc1xAArsPMLDLuswBInLJ0oG7g8MrKjYhZhAbiHMMzsZLKYHlqukq0g6kGYDAsfBvG+ItBf2hDdtt8LkZXIG5Voy3I0/U10jhfFLd2zbu2zC3BK5oB/wAPaQZ0rh97H20uuic9hLtxrYJXMJGQOHynWFtnUESq6VaOA8ct2+HXRdDvF1rltRLxIHLcuAchzyZeJDyJ2qWn6Lg90zpl/EmhsbxV1tnUnso303akP2f8Ve9YFt9btuVdHBzSDo46wVK6jY/KjsQwfVW8sqYcE7EHp3FZuVPZsqqwO7i2uEW1YszHQ9V9T6VbOEWLVlYQAN95j8THTUn9KqdzGWLRLA5nO5UfgOkVoPE6/utHeB/Oan6qMJ8jGtWXxsUfeue/aT4Lt4i2+KwyBbyDM6KNLqjUkKNrg9N9u0F4LxSjPAB29P50ZwzxCouDQwTBEaET1jWqWWJl/sQfs4ROm+nT57/pXouMBysR10PcQfw0pj4ssLbxd9F0VbjZREQpOZRHsQKVzWxZvfvs7ZmMmANgNhA0AAqM1lZFMo8isrMpr2gCUVuCa1KERPaaygAu9jXaNYymVjcHKqzO5MKNSe9Q377OZPQACAAABsABoP8Ac1HNbW7ijdc3zI/KgAvEYq55QAaLdzKCm4myiKGBOxMzpG8a0vzUdZuLci3kAVRdccxmfLLb+6LS40Ek+FTO4WQJ7mB8z0FdD4NwXDee+Ddrj3WTzS5cqEhW+Ar8XxsZ2Ib3qk8MxCDy2Ntn8nM7LIykEiHJ3kMUBGoIUetXX7O7T3XvY25AZ/7NAohQOUtlHYQij/NWHIyfThKXwjo4+L6mRI6FhMJ5iswHKNB0GlJbyZTVje8bOFHLqf1P9fSq0bpZsx0r53mRgoxX8qt/s+k4rk3J/wAbpfoLwisdU+IdOselOzYfKWU6lZkxo24MHQ60nw6lGBbQ6EED8dNKfYxwVDToREREdRA+tHESjFt3a9X/ANOblNuSS8M4346wKLZtObRt3WdjdY5OaTrJtk5paSJ1EHYEVU8Lh2dsqjX6ADuSdAKvn2pYpLuKs4O0Mqyksf3nYqIk7AMSfl2qp4bBXQbSrIe7mlSNmD3LeUiNYCk/M19JjlcFI8DJGptF18DXFweHLtZF03Q7SWAIVCoAG6mWZuo+H0q6W+CnGi1cvWsvJzW7gB+LUzGxBAg+tV/7NMTba0gLs5tO1pXVeXJm5OmiFfxJmuk+cFkxr3p+XstaQBwjw1ZtWhbKqVUnKCSwUFy4EtqYJpZ4g8KXsQ5LXhkyFVWJVGmQ+WYLAdT3NPxjANxUycQSKdIWzm2B+ypLbTduebbgiASsHoeXWR22qgcR4M9k3A1tbhDlQGz6Kr3VzyjKIPlmZ2ldpruHFsW6guoIXSSNvSa4341xDDiF11JDKVgzsTZtho7TrQmZzikgX9kOWbXkMQxACJbbOEPMUa6WM5crD/N2124pir1sHy2u28rsIGUKbYKKl0FVWASwE7EsIiKT2Lz2nV7bFXUyrDcaR+UiPWswtxy5XM39pyPAklCwZoXrESAO2lWQa4ziF64ALlx3A1AZiQD3AoezdZDKMymCJUkEg7gxuD2o3H8Le0js8gpdNoqVIPwlg4ndTlb6UBFAxxgPEd23et3AED2/hbmAGYIrZwNXWFOm/MY2Aqz4TxK17H+VdVLSuMqw2ZfMPMtwPAlXED2I61QCp10239NQNe2pA+dSpjNEDKCbc5W1zAEEhJHQNzA7iTUTgpKmEl2i4nTOLYJrZ5hv/RHuKQYkEGmnB/GVi+gtYlirQALrCJIUatGgMyNO3rTD/p97gJtvbZehzaEd9a4JQlF0eLmw5FOkrKrhiQ0jerJwghVNxzlVAST0AAkmob3CEsKXvXLagd3Ef8+m9VPxN4mNweTZEWupI1ftodgDr3ohjnJ/0PFxskpq9IA/b1e5ev3bedbjMFByyGPMIkGIWJI9O9Y4JU2nUNeC/u21W2qjNmNxdXOWNzHN1OlQ3eLF0K3LauYIDEmVJUCRMjcTAjoBAArxOMXgzPmlmEFmAJgCIgiIjSCCPSQCPRPa8Etx7RLBgUyZmAcAk58kaaTGrBex9KEuPabzDlYExkCwFGozEid4B02k+laYrFG4FBAlQQWEy22rdJ0369elQTTGTYsJnbIyhJ5ZDTHSdN69qCaygAwYgNkDgcsgmJJB/egiY1131qXH2lGqxsDmGxB2Ed5B7ewNAA1PhmnMkA5hI30KqxER8x9KAIaL/YWIJQ5ysyoUzINsELGrDnGsDY+kj4O0XaAYAGYt2A6+8wB6kV69y67hROYnKFQRJYwQAu+Y/WgA5UKXRYZRmR3XPqCQ6FcpHbqOuppSNq6L4c8HqQty6Hu3lYF7aPGQgAqrtlYHQCffrTjh/gFLbZv2fzNRAe6QqkGZlBLdogDSs+6NPpS96Oa8Owyi29x2KKyMFynm+O3bLFfvW+ZhE6lT2rsHAsIlrD2LcZAqhiNzLHO2+5kneobXgRRdW55VkZYjNnuQBAChCVSAOpFLbnjW00lrVudtGaJ+lcvLhLNDrD59nZxHHE25b/Ba+P8AEFcZVmBEfKlNkgHXYgj6jT8YPyqvX/GVqGJtJoBGW4wnmURqpjQk/KtV8W4ciQNZjLn5p9ii6eteTn4PJlLs0n+Gerh5XHjDom0We0NaZ4YE6ZtY6n+dUnBeKVuXAioCCNW8waEsFCkEDUk9+k00xXiO3adUuaMZAh7ZBykAic8TqNK5lwuRB24t/ih5ORin4khD9pOBK4nC3g2TMyoXMQhVwysZ00DE6/u0ViOGBEW0Gz37aFrQIhsoAISxcYS7KYcZt9QNCQN/Hlo4y3btWntgq2dg9wAyQVA0BA3nfWfSh/BvA71nEW1xal7dz+zhjmtzIdVJPQqraHSQBX0PFUlhipar0eLyEnkbW7L74Ywq2sJbGUZsrEwuUbklcoOkFiMvT5U+sW+QDfQb77dahu4VV0RBEzCADSOoHX1ouw2nMINdCMWJsYSAaW+cZ6zTzH2uVm9dKrlz4qluiuyHGDcXAyPIDCDB1MbR6b1RftI8MNbsrifMUlFVLiwcxlzDT1y5guvQD2q/8MsLkB+9Ne8c4WuJstauMypENlIDfiIj0pozmrOCX8T/AGSAJbB5lY+WhJ1kNmIkGDGh+7Sx6Z8Ww5tebaOptXshPeBdWfY5aVE1ZgMbd/zbieddYpcuKb0fdAYqWHSchY/Oux8K8NcMRAP2a0573Fzn5lya5DbS5cUi3ZJDWxbESQSrozmUEZSwA1OmY612rC4Q8oMb60ezSKOafaPw/DYfFeVhreXzbQDLMKrPcVkK5pjVBpMe1UZ1IJB3FdG+1LB+Xi3u3MhttaW2gGr5pGqgjlYAsQf4Y6iaLxGyM1tbcvmRYIBm4xJmF1MzyR3X1qiX5A7VtmYBVLn90Akn5DWjeE4g+aiwqpMtC/dUZm1M65QafeEeGSXU2TcuB0Ih4yydCcp16GMpGkyBqGa/Z3ivMzILYQpcWHuiQXR1BkTPxD/epsKKt4Y4BcxtxwjKmUBmJknmJgADU9asf/03eQovgsdBFswfmziB71v4W4XiOHcQtC+AEuq6B0bMjQpO4EyOxAOtdJa4FYSr7j7jdYjpQ2UkfP8AxPBmzduWmIJtuULD4SVMaGh6d47jF225RMyG3cu5gTvnYyCkDLA01k+21AYribvbFtwphgwbWZCKmsHKZCjUgnsaoQFNMcDh0IXOhOeeeSAgBK6RoWzd+4Ea0smp8NiSpAIzpMlCTl1EEiNm/iGtAEN1YJB0I0I7EaVlMmWw/McQ4J1IZCzD3YfF7/gNqygBdmr1XIMgwRWX7xc5jE+gA/AACa8soWYKNyQPrQAbdU22CqSVfK3vqY+gP1ptwnhNxL6tmBBVsrAxL3EZUVf485Gg9KTXbxyMCI1hIAHcNMbj9fnTPinEbtoeRbeUgFnVRzGNcrRoo20idamV+EVCk7Z23wNh1w+AsIdDkztOkM5LsCWIAgkjfpTH/wBcw8wLtsnsrhjPaEDa1xxG4jctJc811zroMo1WYUyRmIIggmZEUJi8PjmlbmJeOxuEf6RWPb1aOmk/TOt8c8S2/wBnumxcFy7lyoAfvuITeJ11ga6VyEeDscFByw0kMrMAYEQVnU7wexjvoHa8OvmEEd5H5zV1+zqw1m8TmVwnx5GUkzIIYLLHXQA9elLv193+hqN+qEWA8H4vzFS5bQhpJlgAIn4iRM9RlDT1jUgfFeEMZbd8qgqkMeYgoCdJJArrvE8bbDC41uWEFlaDCwQFJE6sTtroDVct8YtXMQWS2qBQyPCqAdVKgmAx2fT19qiWfqrKhi7OimeHvBuMuOrqLb2y0tldToNdBoQw9Y6d6bYrwFjWzxBUszrDW8sPqRq5IPQb1bLOJt27dxUtlVMwEGUllyw4YDpE+wG+1HHHuAH0ZWHxqIGbNsR3gj6SNKwXM7RbRs+M4umc/wAX4V4itoWzba5OmVrttgAB9zMwZTtoD2rOA+HMUSC9m4rI4IBdSuXKwYQpkkzpptNXfiHEpW3cAHLc39YKaepExR9niOa3mIVJOmYx1OoHaRpVxzyl4QpY4rTYy8P3buUeYrdpZYOnX1nf600bUSartzidxFYW8rENoPQwf1NbWuJsSquIbLJUesVssnpnJkioqxhxdotKO+tILiDc/nr9KYeIsWqmDso9e3Yb1Scbxy3mkN16iOvb+dE5bOWWWMfLL3wu8IA0pH4x4o7I1uxe8u7mULl1dmkcpQqQBlzHeZA71LwJw5FxDy9R+R9P96rfj2P2xAj+VFqXf4V1Y5ZiMxIEaenaqhK0XGakUDGYK6rXVuMDnMi4ScpdXnU7glS+/epfD3ARfuZTeUImtwoGzAdlzqASYOuoGm9NOP4rkW7ads5iZUeW8swIIMhjIBj1J6irX9l/DlvBrjWwkxnXdSdxlnpsxB7rqQa1t0CiHeH/AA+9wIluyMNYV1bUzcuhSGGYg6zrqSAJMTNXwYHJB/OiEcKNKHxON9ZppFFP+0DwhaxQuXlDG8trKmvVczKIG8kwZn0iua8I4c+HLPiMyBCCiBMzFjykg9EI3ymTGldxOIkSKW+I+GJibcjlupqjdY6qT2NDDrs5jw7gOIR7d5Xkm6Hm4jW3ZiRIyseadR10autJbdVj5VNw7AICLjgG6QJP7uglVPQUVisUo0AApJfJVfByz7RGurxKwzLc8m1aktByh2zky2wJAQfKnOVDoToU/rXtFWvEPYuK1u5qrAgj37Vri+BWGQNb00gQfw12oYmmjgfGrgGIuEXENxSj5iu7ogOVTE6nTLESo9x4L6urvcQ8zAm45HMCiuygQWDOLTZTMCY6zXRvEng17ji7ZIF1BACwpaSNZiQx05xJ1PeRQPEGPvKBYv4YW2tG3MiTyWxbJuAiHBAJEEASd6admYh4jic7AgZVUZVEAGASdcoAnU/gOlCE0TxDy/Mbyp8ueWRBj2k6bxJJiJoY1QGTWVpWUUFEj6HaPf8ArSt8PbZpCgkxMD3A/WjGYas/xlgTpzaRzKY6yZ16e1e8MxQRlgBSpJ8zWYkEhhJHSNB19aBjLgOEtPdXzWGhBdmcaIurMubQmNBvJIABNX3xDw/CMqPhsAbqFcrf2l1XHaUPNlIhs0bb+tM8N8FbF3LbqWtJbAm7JAzBi2W2d53iPh0p7xnBeZiBeFwgCCHR9SFiGBXWdtY/nWGSW/JtjjrwaX8A6Iquty1B5E886LGiw6yegFLrqFrq27Qcs5gC5cjSCxJKyAIU6metT8awzYi6HvO5JEc9wkQJiAfyqXgfDbHnBjpoygjYcpUGNu281lrybf0bWUtWjkd7GcnRc5OQECDmCLlb0YHarBwdhg3Bs27zZ1BYqsqinqk7gtuWEetVbxNhkF8EwXKrKidgCN4gE6bdqRW7F5pAzAFpAGYLMx7H/mmo3uxOXo7hZ49YYRdtayZzWXTXYnMVgnofWtX4Rw51KhWtZteUkGSSZ5p1kt9TXNODcDxxChXZQeYy7SdNJI1HQRtV14X4ZXMr3b153GuVrrZJERvS6p6exJtbWg8cPwfOgxkP2uBQVBEbQukUHZ4MMly2uPtMrZZWVB5epYOSDoBt/sn4tw29cxARHcJqjQNAh1ZTBBkmOboYOlOOH+GsHbaXNw3EVSbj3HMxptMdBsIqI4oLxFIuWbI/Lsnw/C7OHsOHutcjM8iVUDdgWAMgGTMdu1C4rhjXPKay1trQksoeQTIKtMHMBzGD1j1qxXbVt0KrBVtx0OoP10qfDYRVAUDQCBHoIitFAh5BbwfBsjkmMsQNZ19qR47FM2MAUkCenUDoat2MbIrHTQaVScGs3GeTp19ddqjIqaR5/Lm5UkbeIOIFnbXX8+/vVMvprMb9elO8fYDM5NwiCNI33/Kk/wCxEjlPL1n9Y2qdnnZO0vI54RiXthRmOTNrB03jSivtQ4XnFm5IB/uiYnUgum3+f8KWYIlEZdwRGvQxMjtXRPDwF1bRcBzlMT+8BofpI+dXjdSL4jcZ9Wcr4bwdnw6G42fKDlUbQXLS2kk6kenyq1XWe1Zy22mddAZzFpY6dhA3+6KtTeHBbZvLTMG1iRy6mY9OlL7/AApicwYqNiunQ9NNK6U2nbPZjSFXCMdeZfLOdZ0LCeWD+H+1WZM2XMx23yn+pNacP4cFXWTpptv1qQ2ipORdfU02xt2T3bwCjeT23qO8wX94wJj8YorDWTMsOgqLGYY5hBO8+/p6UmCqzT9pYqCNyvzpRxaxcdTlY5hsJ602FptzME1J5IP86lqzohNR8FOwitAW4GVyIMnqfXanGG4xct2AkgkM0E6kiSR1qTGYbmykSKBxmAGUAToT8p9ayl2S0Ry5OWP7fNnrcYvOZWFPWP07Un8Z4a5irJuMq+daEq8asg+JH6vAEjrp60zwKKpKGZ9qYYZImADynfrpShKXyefCMvbOK2sEtwBSFtv0JkK/sYIn0qAcMKkrcOQ7qd1ZQrkwVkEyFG/U1cvEnAEUm5bJFtmm7agnLP3kjbmPymYgGqreInI3wdW317j+EbT23rqUrNnGhLB7VlGZmGiuY6VlVYjqP/SmEIgpmjYm45Pylq8t+CcIx+Agdgx1/wBX40xxOflVVPNpI6Dqf671pisNeyhVJGcwTOw6gdq405fJ1NR+CC7grVpksWWZAkny9chLayWYHN169e9SY/hBk/2ckiCyNE6egEfWibPhhfL5QczEkltfQCTqBuabcC4ayKFdy5Gkgab6CDR1sLKxieEEAQ92TpOkADpr0qO3wy+GGW0uw5mQAt2MiIq+cQwqqAsdPxoXCYWASQCf19zvR02Pto594i4diGxBYHlMLlDEZsoiTAqzeHuBeXbGa0vmddzE9FkwPU6UzgEc67GRygCe87mvLXEyG5QI6k/Sr0SE4NLigluUTGu8e803wuGDgUsvs11BlElfpRHDbV1VBfQ9gdKpUSybEcIt5pWQ8amTqO5BNUnG4C6164rMFUkKB0aNgetdBtMfiM9jS/inCWuSUfITPQddO29Dj8CUiLguBC21BB2E8069h2pxaEaVBw3DOihWJJH3v3qLJAqkhSYo8S/3cdCdarHDLaoTLT1B/D+dWvi1rPE7Cq3+wRm5jBH0rCa+6zmyQbdijiL87EEHQiJ+VBWcPNpxsZmOusfhvU2OwDZiVXMu89Cf50DhcW2cyDMwSd9e/ek1Zi4fIx4Zh2+AKD+dXPw7hXthQYgeutVvg9gsyn7up9TG3sP9quuBHLtFVjjs0x4ktjdTpNJsaksSKYBtK0e1NbvZ0oAtERBqQqN6lOErzyCBS2VZJbgivblsHWo4ivPP96oRu6ihiNandqhvN2pMpMGxGFUmTvQd2B0+lM3XShGTWalod2V7iGdQSAYG09pAid4/lRnCQxgyDpzL1UnvTO5bDAgnQ/yioMPw22rZl0J3139+9Z9N2T1V2A8R4RbYMCPjBU+syNfkTrVJbwrh1Zkdbkgx8ba9jXUFtKeta4nhweDIkdap36Ha9nMv+jsN/wDjuf8Ac1e10X/0hv3vxryl9/yO4fARYsKQACIqVcIPoZ03qDB4hN4j3EfpFGeapETFSmimma3EJ02Ar20ANjXqOBuwNeXbiDtTsVEr2w2+9YtiNooF8YemUfKvExRJ1Kn2p90HVnnEbTGQpHuentS7A8GynUyPWKbJfXrp9KlGKX94fhU3ZR5aYoIFF27mmoocXAetbeaO4qk2S0Fh+xFem/QvnD0rQv7U+wupNfxUUuxHEDRFxlP/ACKEvBTsPypOTDqRXcU5/r8qGwaC4xEa6yDRcj9OlbJAIO0GpE4o8bhqlMsD3FV/FcPGaMsnYk9ferb+0jYUPfQfP+utU0ielgXDsIVAE6D+t6cWWihLOgntUgemtB1GKvUoelTYtRuahHFgDH61XdB1Y8mvGcUrHEF/o1q/EVH+9Pug6sPutQlzEQdPyoJ+METmUAejfpFLcRx5VbmiD6iR8o2qXL4KUfksDXpG1QWrwJJMaUlHGA4HMoHvRPmKwhXBPoRU9iqCsZxCOVQST6GAPeKDvcVRfjJHpBrUY8IYciB9fkOtV/j+MW4Cq2zvo5PN8h2o7Dodpxa1O5+YP50TdxqsvKSfb9DVHwuFcH++gdjE/IE05w964ABmierKuv0pdgoH4tiryscpIEQDEn5ULY4jiVAOa4SO6Az+NMb/AJ5nmVh9PwOle4bhLXYLFgB1DR9I0NLsFHlvxHdAEqf+w/yrKeW+CWABLE+5rKYhUnEF269d/wDiiFxUjc/103rKysjYIs3JIkad69V80gSexPX5V5WUCPBpqyfiPx1rT9rA0IA7GP5TWVlNAD465qNCRMwToYOxjpWmJxaTKoU3IAdyJPozEKOwG1eVlUiWF4O/CzJjtP8AtRlrEiOtZWUAYmL3PapBxCdImsrKQGftcaFQZ1PavGxa6bdQNK8rKYEGK4kBIAkgSdOmle2sa+0dNiB/OsrKQjy/i2+6SCOgA1j3rVsa5AifoO096yspgYl+57D+o61LdxDgSGn0j+ZrysoQEF+6SobSD6VGCSYBnsIisrKQzS4twmQd9B6fjUOKuOnxtI1+vyrKymIE89rilUOU+uv8tPQUBe4ZmddzHaB+dZWVSEx1gsCoAhToep29NCNKIu2G1EanU+n+qsrKllESYF1BIH5fzrdrJ0kfh37HNXlZSGaPg2mZ/AfzrYWWWBm0/wAIrKygAm6CFnlYeiwfnrQ+EgvCMVPaPToZj615WUgYb+2uNMo09B/OvKysosR//9k=',
                                                                ),
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag:
                                                                  valueOrDefault<
                                                                      String>(
                                                                columnPropertiesRecord
                                                                    .mainImage,
                                                                'data:image/jpeg;base64,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' +
                                                                    '$listViewIndex',
                                                              ),
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: valueOrDefault<
                                                            String>(
                                                          columnPropertiesRecord
                                                              .mainImage,
                                                          'data:image/jpeg;base64,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' +
                                                              '$listViewIndex',
                                                        ),
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    8.0),
                                                          ),
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl:
                                                                valueOrDefault<
                                                                    String>(
                                                              columnPropertiesRecord
                                                                  .mainImage,
                                                              'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoGCBMVExcVFRUYGBcZGh8aGhoaGR8jHBwdHBkZGhwaGhocIysjGhwoHx8ZJDUkKCwuMjIyGiE3PDcxOysxMi4BCwsLDw4PHBERHC4fISguMTExLjExLjExMTExMTExMTExMTExMTExMTExMTExMTExMTExMTExMTExMTExMTExMf/AABEIALcBEwMBIgACEQEDEQH/xAAcAAACAgMBAQAAAAAAAAAAAAAEBQMGAAIHAQj/xABDEAACAQIEBAQDBQUHAwMFAAABAhEAAwQSITEFIkFRBhNhcTKBkQdCobHBFFJi0fAjM3KCouHxFpLCFUOyFyRTY6P/xAAaAQADAQEBAQAAAAAAAAAAAAAAAQIDBAUG/8QAJxEAAgICAgIBBAIDAAAAAAAAAAECEQMhBBIxQVETInGBQmEFFKH/2gAMAwEAAhEDEQA/AOd8KxfluGiY6TEyI3/ranlji1w5TlkrOsnqCJMRqATrpB1qsYe7HQe//NFLfJ3NIyaLhh+JLKZmCKqgEKRmJChQc6AssADXX2oTjeKtXCpVmMKFMrCyJ+FcxyiI07yYE0jt3KYcXsG05tm2VCkgMQZcD7+uhXqI0g0EMDuvXtq4p0OhqF2qdMA+4ysQcpUHmUkE80iPunYnbWKCDHsD1qJrA/qKzEM6xIjMoYeoOxr3AYd7hYKeYAGAJJBdVMD0DZvYGgCTAYQXLioSeYxpG8GPxihKaWLYw13NeOquVVABmIBKm4etuIlTvMHYaj8Rs27uZ7DFsqqWXLByhFDPlHXMCWifiB2mgYKGFFYa0W1CsV6kKTHeg+H4Vrm2g2mCZJBIVVGrMYOg6AkwNaYM6qbRN0RbUcqFi4eczBSBlHMTzAx7xFBSCLihHKhg4B0YbMNwfTTp02qVHHpSpsTmYttmJMDbUzAqVL9SWWSxhVZFytzNpuMoYzltnsxgmdtvei04Ywg5uUsVBj1uL/4z/mFV1Me5CKGICGVAAEHfNpu3qddKYWMViAABnygL9zTkJKzI7k/WlQwlUJCcwGfQT3kj9K1UvBMaASTOkTlHvrP0oZ8UQqKRqrZtW03nbofWtsPfYoUyq6kCOcKVILkGSdfibSigJ8Nckkk8qiWP6e5OnzqO876tlIG9R4y3lRUDpGjOQ6mWI2gGYUae+avLXEAugKxuQTudP6+dKgNrlu7MBSTlzGNYB7gbUtvOd9YPp8/yI+tMb2NbMzo1hSwgkvJ+6RIYlZBUEaVJiOJF1ErZzBiRF1AIZXVlgkdGEdstMYgxKkRPUSPY7GgbsU24nae42dVEkDNF1GEgRKhTIHprSW/IJBEEdDTEQXgKhy1K1YLbb5TEEzHQbkdwKoCEoKje3U7g71ExoGD5K1YUWbIz5ZGkTJiSYMCBpvFZcvXV0AyDUcqxMb8252PXpQUBGvKJPmED4mnbrPy3714ybyMrLqQRGm2x2OooAHr0CrDwzwdjryh1sMqfv3CLYjuM8Fh6gGrt4T8D4K1lbFl8Rd38u2CLS7EBjozn6DWINAUzmVjAXmUMltyp2IQkfIgVlfSlrHMoCqlxVGgVQigDsFnSspWPqfNSGiLb1rasDSSdcu38Y0/X6etbNahFb96R7HcfUa0zNoItvTXB3BcAtMYYaWmPc/8AtMf3STofuk9iaAwGGRwOcoe7FMv1LggfI1paYq47hhsZEg9xvQS0FZQmrzm+6o3/AMTdh6bn03qccVKksihWZw7GZBKkkAD7qySY1940qLjw/tJ7lx/23bi/kBQE0EMIxuKa5lzZeVcohQumZm2UAbselDq5Gx30ojEJbe4BZDBSBo7AwYliWAHKNTPYVDdVZhZI7nr6gdB6UEmYi8zsWYyx1J71LwhovqczLlzNmQ8wyozafT50wscHDIHLFV8nzmYrsfONsKBu0gSI79BrQF+4Iy21yr1J+Nv8R6D+Eae+9AEl4vbszsbtx5IWMyBbbCDvkJbYaaa+i8NUxXQSTA29PbtWjCkOyXURIIkSPUSRI9JBHyqfDIzsFA1P9SewA1onFYS5lRcvMi20j94XWuXUZT21KnpI96wXLNslJZ5Uq7qREllMWwRqBBUk75jGkSyze5cu2yF8wxAIKsYIIkREViM7n7zECTuTA6n0qXiVkG3buqyhCuQITzjJodI17ltpJjpW78RDDmzDLGVVO57lzqoHpqZ6b1JQPvW4cVrbxi7vJLOSxHYgCYjXdqItYkWWytuDzIydtQWkaj4du5pDBLr1Az0RxZwzB0+AgKJ3GVEBBH69aWu9NASl62RGIkAkayQO0T9JX6ihleaZcNxLFWtBoBW44A6sLTSp9Coj3igATEWXVQzIwVtiQYOgOh66EH5ihi1FcS4kbpiAqTmCACAcoXcAEwAAJ2AigC9UBszUbh8eq2sjLm0uQexcKB/l0aR7UtL1qzUANb+Jsm2EJgEEggTkYfDP4o3cBG3FJ8RbZTDaHqJ1HoR0PpvW1m9kdXABKsGAOxggwfSiGtC9nZFysCWNsFmLKdSyliSxB3HYzrrQMgFxpDoSHAgwYOgiR3kbitreIcZuXMzNmMiRqCDyxMmSJnap+B8Hu4m4tu0juzGAEAJ9zJAVRpLExXUvD32dYfDIHx7m7c3FpGYW19CRBc/RekGgaVlF8KeHcXjXz2raW7aOXa8wIRSYlQuzmPugdpImuj+E/C2Ew7F8nmXBvduKMxP/AOtBy2x7SfWtOIcWZytu1Fq0miW7fKoHssUqx/F79tlHmPlnXmNTZqoV5Lh/6kAWBBOvXWmGDuqtrOVCs2oA3iqhZ4ndEHMHU/vAH8Ymj18R2Y57BJ99KLHQRezsxMb/AMRrKU3vFF4k5VtqvQRsKygDjdvFuI1mIiRMZdiPapBiSVKvJAACdlgAbe35mh1WtoqjA2U0w4fYLEHKSsnbqQpYID3MR8694fbXy8xKyGflYTMWiU6Rvm69BUF7EM5BYzGw2AHZVGij2oJYfikZ7TXGtBZcQRmkg5s0hiZGbLzHWTuaAFSri3yupIbPAJYSeWYgnUbmtHRgASIDCR6gUEsIsiLVxu7LbH+bMx/+AHzNDhhTfhWKuW8O7AFVVgQwQ87FWUKXA+6WDQTqNKRg0ENDBeI3cqrm5VUoFOoyly5BB0PN+QozC8MOIGayjTIDoFZgpOzKRMoT0Oq+o1Ci02oHSvo3gly3btBUgKsBQAAFECAIpF48fY4RieB30BLKVgE8wZTC2xcOjAHYke6sKgFsJ/ZgK11yELHVbeYxC9GfXVvu9NdR9GNft3FKuqspEFWAII7EHQ1xHxzw+xY4iiWRlQm05UHRCz6qOwgK0dM0Uxzx9dibiHFLmR7TIMri0RJkplt29VPZgJI6En1lTmpl4ntxdX1tr/pZrf8A4R8qVUEhKOYqfD28wf8AhTN9GUH8CfpQIeKJweKCZ5+9bdfmV5fxigZ5ilymPQH6qD+taq+tb3w1weYqnKiIrHsVVVJjeNvrQmakAzDC4hEgXEEidA6jUj/EOncabgSLi42A2AMz3AP60OWqycB4Rbu3ne82WxbVS5G7EohCLHUyOo3HqQi1sVYrAFEL51MCyQAyknzbZcyAZWIjUazW2Cwd1brAhQ6IXyl15szLay51JCsc+k9YHWrVxnwjZvW1v4IgE5psswBaGMMjTAJEaGAdwelVfB8LvW71prltrds3VzM2iQrBnDN8IgKSQTploTG00C4vhpt3Llt7ltChAOcsCZUNoqqx2IqPDgZnBZLlu2jNIWAx0VQCyhxLso1jQGoMTYdWK3JziJkzOgIOYTIIggzqCK34dBL2zp5q5ATsGzK6T2GZQD71QAc1NgsG90wvrqZiQJgkAxoCZOmlaG02bKQQwOXLGszER3nSul+G/s7drWbEOMMLiiRveIg5gyklVUkkxvougK0hpWULimGtjIUKkRBK6ZjJgZT8LqsZpHY65tbN4J+z7FYnJec/s9oMCHaRcYAgk21jtsx0nvXSODcH4dg8vlWgzqIW5c5m1M6TopJ10FFcR4xIOpP9GlZahZ7h0w2Ctm3hbeWTLvpndjuWbr+Q2AFI+I4pmkk70N+352YGZ3Gm42/A/mK3RZ309KLLSoCs2TmmlviBJNWRgqg0mxNouTpQUZ4fbNbCnpUl21Da17wm3kaKJ4mwVgo3NJkgn7OPWsrW7igCRO1ZQUcyw1iYLaJIBJ03Mb1tjnUvyRl20ED5dT89ajOKeMs6SDsOn9TXhvsRl0j0VR+IFWYEtq2MrE7jKR7EkE+omNa0U1OmLbyzbgERAncc+ckHpOxG2gqAT0oIZJbiRmnLImN4nWPWKaHH2XgeWEOclZOZAGVV5gY5RlWBr8+qoqBudew/U7VvwpwL9ssdmB3iSCCFJPwzET0mgVDHDYu0ZRo+8gJ5LRXzEuBjlBZDykQAZkdtV+PZPNc2/wC7LHJoRyzpoST9a04naW3euIoMIxXUztoRPXWahDUEsY4Dh5u2r9wOB5SB8kEu4JIJUDosSx6Cu2YO4fJ92/8AEVxfwm8Yuz1l8vw5pzAqBAIMSRrOnqJFdvFuFA+cVEns2wrTCuEsSRXI/tHaeK3gdg9sf/zt9eldj4Ta10rkv2rYLLi8RcylT5loAk6XA9kmQI0KlIMH7w26tBlWgDivDbRuC6twXLWa6GzXAIdXd0tuWb+zDFlXNsdWBlhSDGWMqW2BQ5lM5XUkNmeQUksoAy6kQfWh87AMASAwAYDYgGQCOsEA1AaZibzTnguIw6m2Ht+YxttoBOZ/NYrbZTvKqokbZtZGyKab+HLQDrdY/CXZRlnMbdvzGBM8g1UTrqw060DRBicYui2QyqFa2SWBNxGuM8tyjuNNYyjXSh4ojhnB7t0HyyhKqWYFsmVVHMzM4CAAazmqy+G/BNy/iFtG4BbFtbty4pVgoJ+AQxkkTDbaHTQikVVijwxwC9jbwtWh6u5+G2v7zH8huTXYeF4LB4VBZtZb15MqNcbKxUhfjI+FCq7Aa7AzvSfxHxmxwqx+z4O0OY8zsxJLHq5GrNA20gRtpXJlL3LoygtdZpECWLEzpGszR+CtRPpEYmwUClFZQIAIBEbdaExWNw2XynS3luk8jAENsDynQjYfMVyzwvxxx5ZNu/etC2M9wmFR9JYXHIVhOYQW9u1XHBcRw2JB8q4jkCDlPMo/MD1+lKzRNMg8TfZ5YvjPhmFpx9xtUbQADN8SwAANwBoBXNeLcCxGDu5b2HBzcqhgzI5O2RrbAluwBB9K7Xhr7CmmHvg7gESD8xqDTE4HOvDfh39lLYzFANinYuqhZSySSSWgxnMzr8MDrWXMU968BnJJMNrsCTzD0BOtWrxTwkuM9pjqea2T+Knp7Gqph8Ff85CEaQZGdArDuAwgMIqJPZpCKSG9yz5Y79QTtr6UtxWMuh8kwI2jSrDxlBkyDfLA+Q0qrX2bEXVtJbOcjK4HUhZ09PWkUjy6DBPKGGuaQFjqSdgIkk7URZc6H61XfFdnHW7Zsrhbq2xPmXWWVbQgjKA0INI6kgH0pp4FxqYjDAtcAa1yXCxA0A5XMnYj8QatJ0S5KxqTIrUjTaKDxviLB21Yrd82ATFsTOWJhjCmJHWq3xHxJfuZltJbtwWEyLjQoBlT8A3UbGJ30o2JyRZcTjLFnnuXFQep3joB1PoKqPHvGoZybKT0DPIHyUa/iKqeNuOzk3GZn6ljJ+vahytVRDmMm4/iT/7seyr/ACrKV1lFE2woVsorQGmmFwqsIlcxtFgus5sxjXYGBG9MAbC2WuMqKJZiAPn37Cj+OYRLDC2jh2yzcPVT+52A6xvrrW/CcCWIhit0OV5WG2VAcpH3gXn2BpbiLLJGYRmAYazIM6yPnUksgJojCW7TB/MuMkKCuVQxJzAEQWXoZ36HtW74FlQXG0Q5dQJ0bNPbUAAx/EveocXeU8qCEHwg/Ef4nI3Y/QbD1oVEvFxbF5/L/uyZt6RynUaH6fKhQRRdjFI1s2rswsm241KHcoZ3tt/paD+8CZxHgRt3QhaEyu7OBmCqt27b+6eYkW5iRudoNAUO/spwHmYo3SBFpdCejvyr/pz11m/cAIEiqh4U4ctjDIFDS/8AaNnADSwGUMATELlETvNHYnEM25P9e1eLyP8AIqGRxS8HucT/AB/aCbfnZdOFXBp0rnn28YFs9m+ASmQox6A5pWe0ydesAVZeAYk6iTI2BOhozjuTEWGR0nQiO8gjLGm+ojTWOtdnH5cckU/FnJyuI4NpHAjw68yq6W2dSJlQTHMV5o21BFQY7BXbYU3EKZ5y5tzlOVpG6wZGsbGnlrF2rJezca9ZZHZWa3dLrGghLTLEEgtq082/ZRgb4uYm21647J5gLM7a5cwJJLEwSAJrtPNogweHzklnCIol3PQHYKu7ueij5wASGOCtve5MPcyHNHkBmFxgsMLkgBbj7kgQRkECAIsHh7BYfFuroGV4ZZKahmS+HDQQpk3LTBv4Y7wwwGDbALed1ytbUeSM/wAZILG7m++5gDLsOg1FJsuMRp4Wwr4m063FCo7kMCJRzJUKbYEMdFbMInMddBltXC/D1jB2WCPcPmMHdneSxACgbAxA2pTh+M2sHgbV1E81GVXOXTLnMlgvYElY6QBTPjHEBctXAUyqoBLPos76agkb/WO9TZqkUP7QeDRaRra4i6RLZxDLNxgWNxQsiQBBEgbGqlwTjJwwYpattcba48kqI0Crtoeae8dqZce8S4hrz22u+ZZUwLYgW25IGbKOaCf9I2MQm4HZtPcK3cxHltlylQc4hgTmIBEBhBI3qkYydvQLisVcuGblx7hGxdiY9p2+VZYulWDKSrDYgwR7Eain2G4bgHRP/uCjs1uc1xAArsPMLDLuswBInLJ0oG7g8MrKjYhZhAbiHMMzsZLKYHlqukq0g6kGYDAsfBvG+ItBf2hDdtt8LkZXIG5Voy3I0/U10jhfFLd2zbu2zC3BK5oB/wAPaQZ0rh97H20uuic9hLtxrYJXMJGQOHynWFtnUESq6VaOA8ct2+HXRdDvF1rltRLxIHLcuAchzyZeJDyJ2qWn6Lg90zpl/EmhsbxV1tnUnso303akP2f8Ve9YFt9btuVdHBzSDo46wVK6jY/KjsQwfVW8sqYcE7EHp3FZuVPZsqqwO7i2uEW1YszHQ9V9T6VbOEWLVlYQAN95j8THTUn9KqdzGWLRLA5nO5UfgOkVoPE6/utHeB/Oan6qMJ8jGtWXxsUfeue/aT4Lt4i2+KwyBbyDM6KNLqjUkKNrg9N9u0F4LxSjPAB29P50ZwzxCouDQwTBEaET1jWqWWJl/sQfs4ROm+nT57/pXouMBysR10PcQfw0pj4ssLbxd9F0VbjZREQpOZRHsQKVzWxZvfvs7ZmMmANgNhA0AAqM1lZFMo8isrMpr2gCUVuCa1KERPaaygAu9jXaNYymVjcHKqzO5MKNSe9Q377OZPQACAAABsABoP8Ac1HNbW7ijdc3zI/KgAvEYq55QAaLdzKCm4myiKGBOxMzpG8a0vzUdZuLci3kAVRdccxmfLLb+6LS40Ek+FTO4WQJ7mB8z0FdD4NwXDee+Ddrj3WTzS5cqEhW+Ar8XxsZ2Ib3qk8MxCDy2Ntn8nM7LIykEiHJ3kMUBGoIUetXX7O7T3XvY25AZ/7NAohQOUtlHYQij/NWHIyfThKXwjo4+L6mRI6FhMJ5iswHKNB0GlJbyZTVje8bOFHLqf1P9fSq0bpZsx0r53mRgoxX8qt/s+k4rk3J/wAbpfoLwisdU+IdOselOzYfKWU6lZkxo24MHQ60nw6lGBbQ6EED8dNKfYxwVDToREREdRA+tHESjFt3a9X/ANOblNuSS8M4346wKLZtObRt3WdjdY5OaTrJtk5paSJ1EHYEVU8Lh2dsqjX6ADuSdAKvn2pYpLuKs4O0Mqyksf3nYqIk7AMSfl2qp4bBXQbSrIe7mlSNmD3LeUiNYCk/M19JjlcFI8DJGptF18DXFweHLtZF03Q7SWAIVCoAG6mWZuo+H0q6W+CnGi1cvWsvJzW7gB+LUzGxBAg+tV/7NMTba0gLs5tO1pXVeXJm5OmiFfxJmuk+cFkxr3p+XstaQBwjw1ZtWhbKqVUnKCSwUFy4EtqYJpZ4g8KXsQ5LXhkyFVWJVGmQ+WYLAdT3NPxjANxUycQSKdIWzm2B+ypLbTduebbgiASsHoeXWR22qgcR4M9k3A1tbhDlQGz6Kr3VzyjKIPlmZ2ldpruHFsW6guoIXSSNvSa4341xDDiF11JDKVgzsTZtho7TrQmZzikgX9kOWbXkMQxACJbbOEPMUa6WM5crD/N2124pir1sHy2u28rsIGUKbYKKl0FVWASwE7EsIiKT2Lz2nV7bFXUyrDcaR+UiPWswtxy5XM39pyPAklCwZoXrESAO2lWQa4ziF64ALlx3A1AZiQD3AoezdZDKMymCJUkEg7gxuD2o3H8Le0js8gpdNoqVIPwlg4ndTlb6UBFAxxgPEd23et3AED2/hbmAGYIrZwNXWFOm/MY2Aqz4TxK17H+VdVLSuMqw2ZfMPMtwPAlXED2I61QCp10239NQNe2pA+dSpjNEDKCbc5W1zAEEhJHQNzA7iTUTgpKmEl2i4nTOLYJrZ5hv/RHuKQYkEGmnB/GVi+gtYlirQALrCJIUatGgMyNO3rTD/p97gJtvbZehzaEd9a4JQlF0eLmw5FOkrKrhiQ0jerJwghVNxzlVAST0AAkmob3CEsKXvXLagd3Ef8+m9VPxN4mNweTZEWupI1ftodgDr3ohjnJ/0PFxskpq9IA/b1e5ev3bedbjMFByyGPMIkGIWJI9O9Y4JU2nUNeC/u21W2qjNmNxdXOWNzHN1OlQ3eLF0K3LauYIDEmVJUCRMjcTAjoBAArxOMXgzPmlmEFmAJgCIgiIjSCCPSQCPRPa8Etx7RLBgUyZmAcAk58kaaTGrBex9KEuPabzDlYExkCwFGozEid4B02k+laYrFG4FBAlQQWEy22rdJ0369elQTTGTYsJnbIyhJ5ZDTHSdN69qCaygAwYgNkDgcsgmJJB/egiY1131qXH2lGqxsDmGxB2Ed5B7ewNAA1PhmnMkA5hI30KqxER8x9KAIaL/YWIJQ5ysyoUzINsELGrDnGsDY+kj4O0XaAYAGYt2A6+8wB6kV69y67hROYnKFQRJYwQAu+Y/WgA5UKXRYZRmR3XPqCQ6FcpHbqOuppSNq6L4c8HqQty6Hu3lYF7aPGQgAqrtlYHQCffrTjh/gFLbZv2fzNRAe6QqkGZlBLdogDSs+6NPpS96Oa8Owyi29x2KKyMFynm+O3bLFfvW+ZhE6lT2rsHAsIlrD2LcZAqhiNzLHO2+5kneobXgRRdW55VkZYjNnuQBAChCVSAOpFLbnjW00lrVudtGaJ+lcvLhLNDrD59nZxHHE25b/Ba+P8AEFcZVmBEfKlNkgHXYgj6jT8YPyqvX/GVqGJtJoBGW4wnmURqpjQk/KtV8W4ciQNZjLn5p9ii6eteTn4PJlLs0n+Gerh5XHjDom0We0NaZ4YE6ZtY6n+dUnBeKVuXAioCCNW8waEsFCkEDUk9+k00xXiO3adUuaMZAh7ZBykAic8TqNK5lwuRB24t/ih5ORin4khD9pOBK4nC3g2TMyoXMQhVwysZ00DE6/u0ViOGBEW0Gz37aFrQIhsoAISxcYS7KYcZt9QNCQN/Hlo4y3btWntgq2dg9wAyQVA0BA3nfWfSh/BvA71nEW1xal7dz+zhjmtzIdVJPQqraHSQBX0PFUlhipar0eLyEnkbW7L74Ywq2sJbGUZsrEwuUbklcoOkFiMvT5U+sW+QDfQb77dahu4VV0RBEzCADSOoHX1ouw2nMINdCMWJsYSAaW+cZ6zTzH2uVm9dKrlz4qluiuyHGDcXAyPIDCDB1MbR6b1RftI8MNbsrifMUlFVLiwcxlzDT1y5guvQD2q/8MsLkB+9Ne8c4WuJstauMypENlIDfiIj0pozmrOCX8T/AGSAJbB5lY+WhJ1kNmIkGDGh+7Sx6Z8Ww5tebaOptXshPeBdWfY5aVE1ZgMbd/zbieddYpcuKb0fdAYqWHSchY/Oux8K8NcMRAP2a0573Fzn5lya5DbS5cUi3ZJDWxbESQSrozmUEZSwA1OmY612rC4Q8oMb60ezSKOafaPw/DYfFeVhreXzbQDLMKrPcVkK5pjVBpMe1UZ1IJB3FdG+1LB+Xi3u3MhttaW2gGr5pGqgjlYAsQf4Y6iaLxGyM1tbcvmRYIBm4xJmF1MzyR3X1qiX5A7VtmYBVLn90Akn5DWjeE4g+aiwqpMtC/dUZm1M65QafeEeGSXU2TcuB0Ih4yydCcp16GMpGkyBqGa/Z3ivMzILYQpcWHuiQXR1BkTPxD/epsKKt4Y4BcxtxwjKmUBmJknmJgADU9asf/03eQovgsdBFswfmziB71v4W4XiOHcQtC+AEuq6B0bMjQpO4EyOxAOtdJa4FYSr7j7jdYjpQ2UkfP8AxPBmzduWmIJtuULD4SVMaGh6d47jF225RMyG3cu5gTvnYyCkDLA01k+21AYribvbFtwphgwbWZCKmsHKZCjUgnsaoQFNMcDh0IXOhOeeeSAgBK6RoWzd+4Ea0smp8NiSpAIzpMlCTl1EEiNm/iGtAEN1YJB0I0I7EaVlMmWw/McQ4J1IZCzD3YfF7/gNqygBdmr1XIMgwRWX7xc5jE+gA/AACa8soWYKNyQPrQAbdU22CqSVfK3vqY+gP1ptwnhNxL6tmBBVsrAxL3EZUVf485Gg9KTXbxyMCI1hIAHcNMbj9fnTPinEbtoeRbeUgFnVRzGNcrRoo20idamV+EVCk7Z23wNh1w+AsIdDkztOkM5LsCWIAgkjfpTH/wBcw8wLtsnsrhjPaEDa1xxG4jctJc811zroMo1WYUyRmIIggmZEUJi8PjmlbmJeOxuEf6RWPb1aOmk/TOt8c8S2/wBnumxcFy7lyoAfvuITeJ11ga6VyEeDscFByw0kMrMAYEQVnU7wexjvoHa8OvmEEd5H5zV1+zqw1m8TmVwnx5GUkzIIYLLHXQA9elLv193+hqN+qEWA8H4vzFS5bQhpJlgAIn4iRM9RlDT1jUgfFeEMZbd8qgqkMeYgoCdJJArrvE8bbDC41uWEFlaDCwQFJE6sTtroDVct8YtXMQWS2qBQyPCqAdVKgmAx2fT19qiWfqrKhi7OimeHvBuMuOrqLb2y0tldToNdBoQw9Y6d6bYrwFjWzxBUszrDW8sPqRq5IPQb1bLOJt27dxUtlVMwEGUllyw4YDpE+wG+1HHHuAH0ZWHxqIGbNsR3gj6SNKwXM7RbRs+M4umc/wAX4V4itoWzba5OmVrttgAB9zMwZTtoD2rOA+HMUSC9m4rI4IBdSuXKwYQpkkzpptNXfiHEpW3cAHLc39YKaepExR9niOa3mIVJOmYx1OoHaRpVxzyl4QpY4rTYy8P3buUeYrdpZYOnX1nf600bUSartzidxFYW8rENoPQwf1NbWuJsSquIbLJUesVssnpnJkioqxhxdotKO+tILiDc/nr9KYeIsWqmDso9e3Yb1Scbxy3mkN16iOvb+dE5bOWWWMfLL3wu8IA0pH4x4o7I1uxe8u7mULl1dmkcpQqQBlzHeZA71LwJw5FxDy9R+R9P96rfj2P2xAj+VFqXf4V1Y5ZiMxIEaenaqhK0XGakUDGYK6rXVuMDnMi4ScpdXnU7glS+/epfD3ARfuZTeUImtwoGzAdlzqASYOuoGm9NOP4rkW7ads5iZUeW8swIIMhjIBj1J6irX9l/DlvBrjWwkxnXdSdxlnpsxB7rqQa1t0CiHeH/AA+9wIluyMNYV1bUzcuhSGGYg6zrqSAJMTNXwYHJB/OiEcKNKHxON9ZppFFP+0DwhaxQuXlDG8trKmvVczKIG8kwZn0iua8I4c+HLPiMyBCCiBMzFjykg9EI3ymTGldxOIkSKW+I+GJibcjlupqjdY6qT2NDDrs5jw7gOIR7d5Xkm6Hm4jW3ZiRIyseadR10autJbdVj5VNw7AICLjgG6QJP7uglVPQUVisUo0AApJfJVfByz7RGurxKwzLc8m1aktByh2zky2wJAQfKnOVDoToU/rXtFWvEPYuK1u5qrAgj37Vri+BWGQNb00gQfw12oYmmjgfGrgGIuEXENxSj5iu7ogOVTE6nTLESo9x4L6urvcQ8zAm45HMCiuygQWDOLTZTMCY6zXRvEng17ji7ZIF1BACwpaSNZiQx05xJ1PeRQPEGPvKBYv4YW2tG3MiTyWxbJuAiHBAJEEASd6admYh4jic7AgZVUZVEAGASdcoAnU/gOlCE0TxDy/Mbyp8ueWRBj2k6bxJJiJoY1QGTWVpWUUFEj6HaPf8ArSt8PbZpCgkxMD3A/WjGYas/xlgTpzaRzKY6yZ16e1e8MxQRlgBSpJ8zWYkEhhJHSNB19aBjLgOEtPdXzWGhBdmcaIurMubQmNBvJIABNX3xDw/CMqPhsAbqFcrf2l1XHaUPNlIhs0bb+tM8N8FbF3LbqWtJbAm7JAzBi2W2d53iPh0p7xnBeZiBeFwgCCHR9SFiGBXWdtY/nWGSW/JtjjrwaX8A6Iquty1B5E886LGiw6yegFLrqFrq27Qcs5gC5cjSCxJKyAIU6metT8awzYi6HvO5JEc9wkQJiAfyqXgfDbHnBjpoygjYcpUGNu281lrybf0bWUtWjkd7GcnRc5OQECDmCLlb0YHarBwdhg3Bs27zZ1BYqsqinqk7gtuWEetVbxNhkF8EwXKrKidgCN4gE6bdqRW7F5pAzAFpAGYLMx7H/mmo3uxOXo7hZ49YYRdtayZzWXTXYnMVgnofWtX4Rw51KhWtZteUkGSSZ5p1kt9TXNODcDxxChXZQeYy7SdNJI1HQRtV14X4ZXMr3b153GuVrrZJERvS6p6exJtbWg8cPwfOgxkP2uBQVBEbQukUHZ4MMly2uPtMrZZWVB5epYOSDoBt/sn4tw29cxARHcJqjQNAh1ZTBBkmOboYOlOOH+GsHbaXNw3EVSbj3HMxptMdBsIqI4oLxFIuWbI/Lsnw/C7OHsOHutcjM8iVUDdgWAMgGTMdu1C4rhjXPKay1trQksoeQTIKtMHMBzGD1j1qxXbVt0KrBVtx0OoP10qfDYRVAUDQCBHoIitFAh5BbwfBsjkmMsQNZ19qR47FM2MAUkCenUDoat2MbIrHTQaVScGs3GeTp19ddqjIqaR5/Lm5UkbeIOIFnbXX8+/vVMvprMb9elO8fYDM5NwiCNI33/Kk/wCxEjlPL1n9Y2qdnnZO0vI54RiXthRmOTNrB03jSivtQ4XnFm5IB/uiYnUgum3+f8KWYIlEZdwRGvQxMjtXRPDwF1bRcBzlMT+8BofpI+dXjdSL4jcZ9Wcr4bwdnw6G42fKDlUbQXLS2kk6kenyq1XWe1Zy22mddAZzFpY6dhA3+6KtTeHBbZvLTMG1iRy6mY9OlL7/AApicwYqNiunQ9NNK6U2nbPZjSFXCMdeZfLOdZ0LCeWD+H+1WZM2XMx23yn+pNacP4cFXWTpptv1qQ2ipORdfU02xt2T3bwCjeT23qO8wX94wJj8YorDWTMsOgqLGYY5hBO8+/p6UmCqzT9pYqCNyvzpRxaxcdTlY5hsJ602FptzME1J5IP86lqzohNR8FOwitAW4GVyIMnqfXanGG4xct2AkgkM0E6kiSR1qTGYbmykSKBxmAGUAToT8p9ayl2S0Ry5OWP7fNnrcYvOZWFPWP07Un8Z4a5irJuMq+daEq8asg+JH6vAEjrp60zwKKpKGZ9qYYZImADynfrpShKXyefCMvbOK2sEtwBSFtv0JkK/sYIn0qAcMKkrcOQ7qd1ZQrkwVkEyFG/U1cvEnAEUm5bJFtmm7agnLP3kjbmPymYgGqreInI3wdW317j+EbT23rqUrNnGhLB7VlGZmGiuY6VlVYjqP/SmEIgpmjYm45Pylq8t+CcIx+Agdgx1/wBX40xxOflVVPNpI6Dqf671pisNeyhVJGcwTOw6gdq405fJ1NR+CC7grVpksWWZAkny9chLayWYHN169e9SY/hBk/2ckiCyNE6egEfWibPhhfL5QczEkltfQCTqBuabcC4ayKFdy5Gkgab6CDR1sLKxieEEAQ92TpOkADpr0qO3wy+GGW0uw5mQAt2MiIq+cQwqqAsdPxoXCYWASQCf19zvR02Pto594i4diGxBYHlMLlDEZsoiTAqzeHuBeXbGa0vmddzE9FkwPU6UzgEc67GRygCe87mvLXEyG5QI6k/Sr0SE4NLigluUTGu8e803wuGDgUsvs11BlElfpRHDbV1VBfQ9gdKpUSybEcIt5pWQ8amTqO5BNUnG4C6164rMFUkKB0aNgetdBtMfiM9jS/inCWuSUfITPQddO29Dj8CUiLguBC21BB2E8069h2pxaEaVBw3DOihWJJH3v3qLJAqkhSYo8S/3cdCdarHDLaoTLT1B/D+dWvi1rPE7Cq3+wRm5jBH0rCa+6zmyQbdijiL87EEHQiJ+VBWcPNpxsZmOusfhvU2OwDZiVXMu89Cf50DhcW2cyDMwSd9e/ek1Zi4fIx4Zh2+AKD+dXPw7hXthQYgeutVvg9gsyn7up9TG3sP9quuBHLtFVjjs0x4ktjdTpNJsaksSKYBtK0e1NbvZ0oAtERBqQqN6lOErzyCBS2VZJbgivblsHWo4ivPP96oRu6ihiNandqhvN2pMpMGxGFUmTvQd2B0+lM3XShGTWalod2V7iGdQSAYG09pAid4/lRnCQxgyDpzL1UnvTO5bDAgnQ/yioMPw22rZl0J3139+9Z9N2T1V2A8R4RbYMCPjBU+syNfkTrVJbwrh1Zkdbkgx8ba9jXUFtKeta4nhweDIkdap36Ha9nMv+jsN/wDjuf8Ac1e10X/0hv3vxryl9/yO4fARYsKQACIqVcIPoZ03qDB4hN4j3EfpFGeapETFSmimma3EJ02Ar20ANjXqOBuwNeXbiDtTsVEr2w2+9YtiNooF8YemUfKvExRJ1Kn2p90HVnnEbTGQpHuentS7A8GynUyPWKbJfXrp9KlGKX94fhU3ZR5aYoIFF27mmoocXAetbeaO4qk2S0Fh+xFem/QvnD0rQv7U+wupNfxUUuxHEDRFxlP/ACKEvBTsPypOTDqRXcU5/r8qGwaC4xEa6yDRcj9OlbJAIO0GpE4o8bhqlMsD3FV/FcPGaMsnYk9ferb+0jYUPfQfP+utU0ielgXDsIVAE6D+t6cWWihLOgntUgemtB1GKvUoelTYtRuahHFgDH61XdB1Y8mvGcUrHEF/o1q/EVH+9Pug6sPutQlzEQdPyoJ+METmUAejfpFLcRx5VbmiD6iR8o2qXL4KUfksDXpG1QWrwJJMaUlHGA4HMoHvRPmKwhXBPoRU9iqCsZxCOVQST6GAPeKDvcVRfjJHpBrUY8IYciB9fkOtV/j+MW4Cq2zvo5PN8h2o7Dodpxa1O5+YP50TdxqsvKSfb9DVHwuFcH++gdjE/IE05w964ABmierKuv0pdgoH4tiryscpIEQDEn5ULY4jiVAOa4SO6Az+NMb/AJ5nmVh9PwOle4bhLXYLFgB1DR9I0NLsFHlvxHdAEqf+w/yrKeW+CWABLE+5rKYhUnEF269d/wDiiFxUjc/103rKysjYIs3JIkad69V80gSexPX5V5WUCPBpqyfiPx1rT9rA0IA7GP5TWVlNAD465qNCRMwToYOxjpWmJxaTKoU3IAdyJPozEKOwG1eVlUiWF4O/CzJjtP8AtRlrEiOtZWUAYmL3PapBxCdImsrKQGftcaFQZ1PavGxa6bdQNK8rKYEGK4kBIAkgSdOmle2sa+0dNiB/OsrKQjy/i2+6SCOgA1j3rVsa5AifoO096yspgYl+57D+o61LdxDgSGn0j+ZrysoQEF+6SobSD6VGCSYBnsIisrKQzS4twmQd9B6fjUOKuOnxtI1+vyrKymIE89rilUOU+uv8tPQUBe4ZmddzHaB+dZWVSEx1gsCoAhToep29NCNKIu2G1EanU+n+qsrKllESYF1BIH5fzrdrJ0kfh37HNXlZSGaPg2mZ/AfzrYWWWBm0/wAIrKygAm6CFnlYeiwfnrQ+EgvCMVPaPToZj615WUgYb+2uNMo09B/OvKysosR//9k=',
                                                            ),
                                                            width:
                                                                double.infinity,
                                                            height: 140.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  12.0,
                                                                  16.0,
                                                                  8.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Chemistry',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .darkText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: Text(
                                                                'online',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend Deca',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .grayIcon,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            formatNumber(
                                                              listViewTripsRecord
                                                                  .tripCost,
                                                              formatType:
                                                                  FormatType
                                                                      .decimal,
                                                              decimalType:
                                                                  DecimalType
                                                                      .automatic,
                                                              currency: '\$',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  4.0,
                                                                  16.0,
                                                                  12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Total',
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .grayIcon,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: StreamBuilder<List<TripsRecord>>(
                                stream: queryTripsRecord(
                                  queryBuilder: (tripsRecord) => tripsRecord
                                      .where('userRef',
                                          isEqualTo: currentUserReference)
                                      .where('complete', isEqualTo: true)
                                      .orderBy('tripEndDate'),
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
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    );
                                  }
                                  List<TripsRecord> listViewTripsRecordList =
                                      snapshot.data!;
                                  if (listViewTripsRecordList.isEmpty) {
                                    return Center(
                                      child: Image.asset(
                                        'assets/images/noTripsCompleted@2x.png',
                                        width: 300.0,
                                      ),
                                    );
                                  }
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewTripsRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewTripsRecord =
                                          listViewTripsRecordList[
                                              listViewIndex];
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
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child:
                                              StreamBuilder<PropertiesRecord>(
                                            stream:
                                                PropertiesRecord.getDocument(
                                                    listViewTripsRecord
                                                        .propertyRef!),
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
                                              final columnPropertiesRecord =
                                                  snapshot.data!;
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'tripDetails',
                                                    queryParams: {
                                                      'propertyRef':
                                                          serializeParam(
                                                        columnPropertiesRecord,
                                                        ParamType.Document,
                                                      ),
                                                      'tripRef': serializeParam(
                                                        listViewTripsRecord,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'propertyRef':
                                                          columnPropertiesRecord,
                                                      'tripRef':
                                                          listViewTripsRecord,
                                                    },
                                                  );
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    8.0),
                                                          ),
                                                          child: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              columnPropertiesRecord
                                                                  .mainImage,
                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-property-finder-834ebu/assets/jyeiyll24v90/pixasquare-4ojhpgKpS68-unsplash.jpg',
                                                            ),
                                                            width:
                                                                double.infinity,
                                                            height: 140.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        if (listViewTripsRecord
                                                            .cancelTrip)
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.89,
                                                                    -0.76),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 36.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xD8ED7070),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30.0),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'Cancelled',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Urbanist',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  12.0,
                                                                  16.0,
                                                                  8.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            dateTimeFormat(
                                                              'MMMEd',
                                                              listViewTripsRecord
                                                                  .tripBeginDate!,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .darkText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          Text(
                                                            ' - ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .darkText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          Text(
                                                            dateTimeFormat(
                                                              'MMMEd',
                                                              listViewTripsRecord
                                                                  .tripEndDate!,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .darkText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            formatNumber(
                                                              listViewTripsRecord
                                                                  .tripCost,
                                                              formatType:
                                                                  FormatType
                                                                      .decimal,
                                                              decimalType:
                                                                  DecimalType
                                                                      .automatic,
                                                              currency: '\$',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium,
                                                          ),
                                                          if (!listViewTripsRecord
                                                              .rated)
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  barrierColor:
                                                                      Color(
                                                                          0xB316202A),
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (bottomSheetContext) {
                                                                    return Padding(
                                                                      padding: MediaQuery.of(
                                                                              bottomSheetContext)
                                                                          .viewInsets,
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            450.0,
                                                                        child:
                                                                            ReviewTripWidget(
                                                                          propertyReference:
                                                                              columnPropertiesRecord,
                                                                          tripDetails:
                                                                              listViewTripsRecord,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));
                                                              },
                                                              text: 'Rate Trip',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 130.0,
                                                                height: 44.0,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Urbanist',
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                elevation: 2.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30.0),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
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
          ],
        ),
      ),
    );
  }
}
