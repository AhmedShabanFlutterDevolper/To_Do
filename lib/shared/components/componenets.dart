import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tic_tac/shared/components/task.dart';
import 'package:tic_tac/shared/network/localNetwork/db_helper.dart';

import '../styles/colors.dart';
import 'package:flutter/services.dart';

// InputField   widget
var title = TextEditingController();
var note = TextEditingController();
var date = TextEditingController();
var Stime = TextEditingController();
var Etime = TextEditingController();

class TaskController extends GetxController {
  static final RxList<Task> taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) {
    return DBHelper.insert(task!);
  }

  void getTask() async {
    final List<Map<String, dynamic>> tasks =
        (await DBHelper.query()) as List<Map<String, dynamic>>;
    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }

  void deleteTask(Task task) async {
    await DBHelper.delete(task);
    getTask();
  }

  void deleteAllTasks() async {
    await DBHelper.deleteAll();
    getTask();
  }

  void markUsCompleted(int id) async {
    await DBHelper.update(id);
    getTask();
  }
}

DateTime SelectedDate = DateTime.now();
final TaskController _taskController = Get.put(TaskController());
DateTime Date = DateTime.now();
String StartTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
String EndTime = DateFormat('hh:mm a')
    .format(DateTime.now().add(Duration(seconds: 20)))
    .toString();
var formKey = GlobalKey<FormState>();
const int Milliseconds = 1300;

// FlutterAlarmClock.createAlarm(hour: 23, minutes: 59);

int SelectedColor = 0;

getBGCLr(int? color) {
  switch (color) {
    case 0:
      return pinkClr;
    case 1:
      return amberClr;
    case 2:
      return bunkClr;
    case 3:
      return orangeClr;
    case 5:
      return ColorClr;
    default:
      return bluishClr;
  }
}

String SelectedRepeat = 'None';
List<String> RepeatList = [
  'None',
  'Daily',
];

Widget dafultTextFromField({
  required TextEditingController controller,
  required String label,
  VoidCallback? onPressedIcon,
  required TextInputType type,
  IconData? prefix,
  IconData? suffix,
}) =>
    TextFormField(
        controller: controller,
        cursorColor: primaryClr,
        keyboardType: type,
        decoration: InputDecoration(
          hintText: label,
          prefixIcon: Icon(prefix),
          prefixIconColor: primaryClr,
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: onPressedIcon,
                  icon: Icon(
                    suffix,
                  ),
                )
              : null,
          suffixIconColor: primaryClr,
          labelStyle: TextStyle(color: Colors.grey[500]),

          border: myinputborder(), //normal border
          enabledBorder: myinputborder(), //enabled border
          focusedBorder: myfocusborder(), //focused border
        ));

OutlineInputBorder myinputborder() {
  //return type is OutlineInputBorder
  return OutlineInputBorder(
      //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Get.isDarkMode ? Colors.white : darkGreyClr,
        width: 3,
      ));
}

OutlineInputBorder myfocusborder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: primaryClr,
        width: 3,
      ));
}

String faceBook = 'https://www.facebook.com/Mohmedomedov7xmedo82345688';
String gitHub = 'https://github.com/AhmedShabanFlutterDevolper';
String WhatApp = 'https://wa.me/qr/JRVJU3UWI7CRB1';
String linkedin = 'https://www.linkedin.com/in/ahmed-shaban-184049239/';
String instagram =
    'https://www.instagram.com/its__2ahmed_1/?igshid=ZDdkNTZiNTM%3D';
String gitHubIcon = 'assets/images/gihub.png';
String WhatsAppIcon = 'assets/images/whatsapp.png';
String faceBookIcon = 'assets/images/facebook.png';
String LinkedInIcon = 'assets/images/linkedin.png';
String instagramIcon = 'assets/images/instagram.png';

Widget SizeBox(context) => SizedBox(
      height: 5,
    );
Widget line(context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        height: 4,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(50)),
      ),
    );
Widget line3(context) => Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 5),
      child: Container(
        width: double.infinity,
        height: 4,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(50)),
      ),
    );
//
// final alarmSettingsFive = AlarmSettings(
//   id: 42,
//   dateTime: DateTime.now().add(Duration(minutes: 5)),
//   assetAudioPath: 'assets/audio/smartphone_vibrating_alarm_silent-7040.mp3',
//   loopAudio: true,
//   vibrate: true,
//   fadeDuration: 3.0,
//   notificationTitle: 'This is the title',
//   notificationBody: 'This is the body',
//   enableNotificationOnKill: true,
// );
// final alarmSettingsTen = AlarmSettings(
//   id: 42,
//   dateTime: DateTime.now().add(Duration(minutes: 10)),
//   assetAudioPath: 'assets/audio/smartphone_vibrating_alarm_silent-7040.mp3',
//   loopAudio: true,
//   vibrate: true,
//   fadeDuration: 3.0,
//   notificationTitle: 'This is the title',
//   notificationBody: 'This is the body',
//   enableNotificationOnKill: true,
// );
// final alarmSettingsFiFeTeen = AlarmSettings(
//   id: 42,
//   dateTime: DateTime.now().add(Duration(minutes: 15)),
//   assetAudioPath: 'assets/audio/smartphone_vibrating_alarm_silent-7040.mp3',
//   loopAudio: true,
//   vibrate: true,
//   fadeDuration: 3.0,
//   notificationTitle: 'This is the title',
//   notificationBody: 'This is the body',
//   enableNotificationOnKill: true,
// );
// final alarmSettingsTewenty = AlarmSettings(
//   id: 42,
//   dateTime: DateTime.now().add(Duration(minutes: 20)),
//   assetAudioPath: 'assets/audio/smartphone_vibrating_alarm_silent-7040.mp3',
//   loopAudio: true,
//   vibrate: true,
//   fadeDuration: 3.0,
//   notificationTitle: '$title',
//   notificationBody: '$note',
//   enableNotificationOnKill: true,
// );
