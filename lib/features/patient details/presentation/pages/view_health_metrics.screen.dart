//t2 Core Packages Imports
import 'package:air_medical_station/Data/Model/Health%20Metrics/health_metrics.model.dart';
import 'package:air_medical_station/Data/Repositories/health_metrics.repo.dart';
import 'package:flutter/material.dart';

import '../../../../Data/Model/Patient/patient.dart';

//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports

class ViewHealthMetricsScreen extends StatefulWidget {
  //SECTION - Widget Arguments
  final Patient patient;

  //!SECTION
  //
  const ViewHealthMetricsScreen({
    super.key,
    required this.patient,
  });

  @override
  State<ViewHealthMetricsScreen> createState() =>
      _ViewHealthMetricsScreenState();
}

class _ViewHealthMetricsScreenState extends State<ViewHealthMetricsScreen> {
  //
  //SECTION - State Variables
  //t2 --Controllers
  //t2 --Controllers
  //
  //t2 --State
  //t2 --State
  //
  //t2 --Constants
  //t2 --Constants
  //!SECTION

  @override
  void initState() {
    super.initState();
    //
    //SECTION - State Variables initializations & Listeners
    //t2 --Controllers & Listeners
    //t2 --Controllers & Listeners
    //
    //t2 --State
    //t2 --State
    //
    //t2 --Late & Async Initializers
    //t2 --Late & Async Initializers
    //!SECTION
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //
    //SECTION - State Variables initializations & Listeners
    //t2 --State
    //t2 --State
    //!SECTION
  }

  //SECTION - Stateless functions
  //!SECTION

  //SECTION - Action Callbacks
  //!SECTION

  @override
  Widget build(BuildContext context) {
    //SECTION - Build Setup
    //t2 -Values
    //double w = MediaQuery.of(context).size.width;
    //double h = MediaQuery.of(context).size.height;
    //t2 -Values
    //
    //t2 -Widgets
    //t2 -Widgets
    //!SECTION

    //SECTION - Build Return
    return Scaffold(
      body: StreamBuilder<List<HealthMetrics?>?>(
        stream: HealthMetricsRepo().watch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasError) {
              print("Snapshot Error ${snapshot.error}");
              return const Center(child: Text("Couldn't get health metrics"),);
            }
            if (snapshot.hasData && snapshot.data != null) {
              print("Date is ${snapshot.data}");
              // Safely find the health metrics for the specific patient
              HealthMetrics? healthMetrics = snapshot.data!.firstWhere(
                    (e) => e?.patientId == widget.patient.id,
                orElse: () => null,
              );

              if (healthMetrics != null) {
                return SingleChildScrollView(
                 padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                  padding: const EdgeInsets.all(16),
                            decoration: ShapeDecoration(
                            color:const Color(0xFFFEFCFB),
                            shape: RoundedRectangleBorder(
                            side:const BorderSide(width: 1, color: Color(0xFFE4E2E1)),
                            borderRadius: BorderRadius.circular(8),
                            ),),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Heart Rate',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.25,
                              ),
                            ),
                            const SizedBox(height: 4,),
                            Row(
                              children: [
                                Text("${healthMetrics.heartRate}",style: const TextStyle(
                                  color: Color(0xFF2C2C2C),
                                  fontSize: 22,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),),
                                const SizedBox(width: 4,),
                                const Text(
                                  'bpm',
                                  style: TextStyle(
                                    color: Color(0xFF808080),
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16,),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: ShapeDecoration(
                          color:const Color(0xFFFEFCFB),
                          shape: RoundedRectangleBorder(
                            side:const BorderSide(width: 1, color: Color(0xFFE4E2E1)),
                            borderRadius: BorderRadius.circular(8),
                          ),),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'blood oxygen Level',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.25,
                              ),
                            ),
                            const SizedBox(height: 4,),
                            Row(
                              children: [
                                Text("${healthMetrics.bloodOxygenLevel}",style: const TextStyle(
                                  color: Color(0xFF2C2C2C),
                                  fontSize: 22,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),),
                                const SizedBox(width: 4,),
                                const Text(
                                  '%',
                                  style: TextStyle(
                                    color: Color(0xFF808080),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 4,),
                            // SfRadialGauge(
                            //     axes: <RadialAxis>[
                            //       RadialAxis(minimum: 0, maximum: 100,
                            //           showTicks: false,
                            //           showLabels: false,
                            //           ranges: <GaugeRange>[
                            //             GaugeRange(startValue: 0, endValue: 90, color:Colors.red),
                            //             GaugeRange(startValue: 90,endValue: 95,color: Colors.yellow),
                            //             GaugeRange(startValue: 95,endValue: 100,color: Colors.green)],
                            //           pointers: <GaugePointer>[
                            //             NeedlePointer(value: healthMetrics.bloodOxygenLevel.toDouble())],
                            //           annotations: <GaugeAnnotation>[
                            //             GaugeAnnotation(widget: Container(child:
                            //             Text('90.0',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
                            //                 angle: 90, positionFactor: 0.5
                            //             )]
                            //       )]),

                          Row(
                            children: [
                              Container(
                                width: 4,
                                height: 4,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFA4CD3C),
                                  shape: OvalBorder(),
                                ),
                              ),
                              SizedBox(width: 4,),
                              Text(
                                '95% - 100%',
                                style: TextStyle(
                                  color: Color(0xFF808080),
                                  fontSize: 8,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                            const SizedBox(height: 4,),
                            Row(
                              children: [
                                Container(
                                  width: 4,
                                  height: 4,
                                  decoration: const ShapeDecoration(
                                    color: Color(0xFFFFC916),
                                    shape: OvalBorder(),
                                  ),
                                ),
                                const SizedBox(width: 4,),
                                const Text(
                                  '90% - 94%',
                                  style: TextStyle(
                                    color: Color(0xFF808080),
                                    fontSize: 8,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 4,),
                            Row(
                              children: [
                                Container(
                                  width: 4,
                                  height: 4,
                                  decoration: const ShapeDecoration(
                                    color: Color(0xFFF44336),
                                    shape: OvalBorder(),
                                  ),
                                ),
                                const SizedBox(width: 4,),
                                const Text(
                                  'Below 90%',
                                  style: TextStyle(
                                    color: Color(0xFF808080),
                                    fontSize: 8,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: Text("Couldn't find health metrics"),
                );
              }
            }
            return const Center(
              child: Text("No health metrics available"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

    );
    //!SECTION
  }

  @override
  void dispose() {
    //SECTION - Disposable variables
    //!SECTION
    super.dispose();
  }
}
