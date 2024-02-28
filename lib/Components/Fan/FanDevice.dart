import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_home/Components/DeviceStatics/DeviceStatics.dart';
import 'package:smart_home/Components/Timer/TimerTile.dart';
import 'package:smart_home/Conifg/AssestPaths.dart';
import 'package:smart_home/Controller/FanController.dart';
import 'package:smart_home/Models/DeviceData.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class FanDevice extends StatelessWidget {
  const FanDevice({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isOn = true.obs;
    RxString onTime = "12:00 AM".obs;
    RxString offTime = "12:00 PM".obs;

    var data = [
      DeviceData(dateTime: DateTime(2024, 2, 1), value: 12),
      DeviceData(dateTime: DateTime(2024, 2, 2), value: 43),
      DeviceData(dateTime: DateTime(2024, 2, 3), value: 54),
      DeviceData(dateTime: DateTime(2024, 2, 4), value: 23),
      DeviceData(dateTime: DateTime(2024, 2, 5), value: 50),
      DeviceData(dateTime: DateTime(2024, 2, 6), value: 23),
      DeviceData(dateTime: DateTime(2024, 2, 8), value: 34),
    ];

    FanController fanController = Get.put(FanController());
    RxDouble slider = 1.0.obs;
    return Scaffold(
      appBar: AppBar(
        title: Text('Fan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Obx(
              //   () => isOn.value
              //       ? RotationTransition(
              //           turns: Tween(begin: 0.0, end: 1.0)
              //               .animate(fanController.animationController),
              //           child: SvgPicture.asset(IconPaths.fan),
              //         )
              //       : SvgPicture.asset(IconPaths.fan),
              // ),
              // const SizedBox(height: 20),
              // Row(
              //   children: [
              //     Text(
              //       "Set Speed",
              //       style: Theme.of(context).textTheme.labelLarge,
              //     ),
              //   ],
              // ),
              const SizedBox(height: 20),
              Obx(() => SfRadialGauge(
                    animationDuration: 1,
                    enableLoadingAnimation: true,
                    axes: [
                      RadialAxis(
                        useRangeColorForAxis: true,
                        startAngle: 0,
                        endAngle: 360,
                        canRotateLabels: false,
                        interval: 10,
                        isInversed: false,
                        maximum: 100,
                        minimum: 0,
                        showAxisLine: true,
                        showLabels: false,
                        showTicks: true,
                        ranges: [
                          GaugeRange(
                            startValue: 0,
                            endValue: fanController.fanSpeed.value,
                            color: Theme.of(context).colorScheme.primary,
                          )
                        ],
                        pointers: [
                          MarkerPointer(
                            color: Theme.of(context).colorScheme.primary,
                            value: fanController.fanSpeed.value,
                            onValueChanged: fanController.changeSpeed,
                            enableAnimation: true,
                            enableDragging: true,
                            markerType: MarkerType.circle,
                            borderWidth: 30,
                            markerWidth: 20,
                            markerHeight: 20,
                          )
                        ],
                        annotations: [
                          GaugeAnnotation(
                            widget: isOn.value
                                ? RotationTransition(
                                    turns: Tween(begin: 0.0, end: 1.0).animate(
                                        fanController.animationController),
                                    child: SvgPicture.asset(IconPaths.fan),
                                  )
                                : SvgPicture.asset(IconPaths.fan),
                          )
                        ],
                      ),
                    ],
                  )),
              const SizedBox(height: 50),
              // Obx(
              //   () => Directionality(
              //     textDirection: TextDirection.rtl,
              //     child: Slider(
              //       activeColor: Theme.of(context).colorScheme.primaryContainer,
              //       inactiveColor: Theme.of(context).colorScheme.primary,
              //       thumbColor: Theme.of(context).colorScheme.primary,
              //       value: fanController.fanSpeed.value,
              //       min: 1,
              //       max: 100,
              //       onChanged: fanController.changeSpeed,
              //     ),
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text("0", style: Theme.of(context).textTheme.bodySmall),
              //     Text("100", style: Theme.of(context).textTheme.bodySmall),
              //   ],
              // ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Text(isOn.value ? "Fan on" : "Fan off",
                        style: Theme.of(context).textTheme.labelLarge),
                  ),
                  Obx(
                    () => Switch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      inactiveThumbColor: Theme.of(context).colorScheme.primary,
                      inactiveTrackColor:
                          Theme.of(context).colorScheme.background,
                      trackOutlineWidth: MaterialStatePropertyAll(0),
                      trackOutlineColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.onSecondary,
                      ),
                      value: isOn.value,
                      onChanged: (value) {
                        isOn.value = value;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              TimerTile(
                onTime: onTime,
                offTime: offTime,
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    "Statics",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
              SizedBox(height: 10),
              DeviceStatics(
                data: data,
                title: "Fan usage",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
