import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskproject/common_widgets/custom_text.dart';
import 'package:taskproject/constants/colors.dart';
import '../controller/alarm_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AlarmController alarmController = Get.put(AlarmController());

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              MyColors.backgroundColor2,
              MyColors.backgroundColor1,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child:
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  PrimaryText(text: "Selected Location", fontSize: 20),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.all(15),
                    height: 56,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: MyColors.darkColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.location_on_outlined,
                            color: MyColors.textColor),
                        const SizedBox(width: 10),
                        Obx(() => CustomText(
                            text:
                            "Selected Location: ${alarmController.location.value}")),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Expanded(
                child: Obx(() => ListView.builder(
                  itemCount: alarmController.alarms.length,
                  itemBuilder: (context, index) {
                    final alarm = alarmController.alarms[index];
                    final alarmId = alarm.millisecondsSinceEpoch;

                    // Ensure switch is initialized
                    alarmController.switchMap.putIfAbsent(
                        alarmId, () => true.obs);

                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: MyColors.darkColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text:
                            "${alarm.hour.toString().padLeft(2, '0')}:${alarm.minute.toString().padLeft(2, '0')}",
                          ),
                          Row(
                            children: [
                              CustomText(
                                text:
                                "${alarm.day}/${alarm.month}/${alarm.year}",
                                fontSize: 14,
                              ),
                              const SizedBox(width: 10),
                              Obx(() => Switch(
                                value:
                                alarmController.switchMap[alarmId]
                                    ?.value ??
                                    false,
                                onChanged: (val) {
                                  alarmController.toggleAlarm(
                                      alarmId, val, alarm);
                                },
                              )),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                )),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2100),
          );

          if (pickedDate != null) {
            TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );

            if (pickedTime != null) {
              DateTime alarmDateTime = DateTime(
                pickedDate.year,
                pickedDate.month,
                pickedDate.day,
                pickedTime.hour,
                pickedTime.minute,
              );
              alarmController.addAlarm(alarmDateTime);
            }
          }
        },
        backgroundColor: MyColors.buttonColor,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: MyColors.textColor),
      ),
    );
  }
}
