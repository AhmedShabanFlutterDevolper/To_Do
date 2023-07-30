import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tic_tac/moudels/Home/home/task/AddTask.dart';
import 'package:tic_tac/shared/components/task_tile.dart';

import 'package:tic_tac/shared/styles/styles.dart';

import '../../../shared/components/componenets.dart';
import '../../../shared/components/task.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/size_config.dart';
import 'detiles/det.dart';

class homeScrean extends StatefulWidget {
  const homeScrean({super.key});

  @override
  State<homeScrean> createState() => _homeScreanState();
}

class _homeScreanState extends State<homeScrean> {
  @override
  void initState() {
    _taskController.getTask!();

    super.initState();
  }

  final TaskController _taskController = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Get.to(const detailsScrean()),
          icon: Icon(
            Icons.account_circle_outlined,
            size: 35,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                ThemesServices().swicthTheme();
              },
              icon: Icon(Icons.wb_sunny_outlined)),
          IconButton(
              onPressed: () => _taskController.deleteAllTasks(),
              icon: Icon(Icons.cleaning_services_outlined)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            addTaskBar(),
            SizedBox(
              height: 10,
            ),
            addDateBar(),
            SizedBox(
              height: 10,
            ),
            showTasks(),
          ],
        ),
      ),
    );
  }

  addTaskBar() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMd().format(DateTime.now()),
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : darkGreyClr,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'today',
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : darkGreyClr,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 1),
              child: GestureDetector(
                onTap: () async {
                  await Get.to(const AddTask());
                  _taskController.getTask!();
                },
                child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: primaryClr),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Add Task',
                        style: TextStyle(
                            color: Get.isDarkMode ? Colors.white : darkGreyClr,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
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
  }

  addDateBar() {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(
        top: 6,
      ),
      child: DatePicker(
        DateTime.now(),
        width: 70,
        height: 130,
        initialSelectedDate: DateTime.now(),
        dateTextStyle: TextStyle(
          color: Colors.grey[500],
          fontWeight: FontWeight.w700,
        ),
        dayTextStyle: TextStyle(
          color: Colors.grey[400],
        ),
        monthTextStyle:
            TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold),
        selectedTextColor: Colors.white,
        selectionColor: primaryClr,
        onDateChange: (newDate) {
          setState(() {
            SelectedDate = newDate;
          });
        },
      ),
    );
  }

  showTasks() {
    return Expanded(
      child: Obx(() {
        if (TaskController.taskList.isEmpty) {
          return noTaskMsg();
        } else {
          return ListView.builder(
            scrollDirection: SizeConfig.orientation == Orientation.landscape
                ? Axis.horizontal
                : Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var task = TaskController.taskList[index];
              if (task.repeat == 'Daily' ||
                  task.date == DateFormat.yMd().format(SelectedDate)) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: Milliseconds),
                  child: SlideAnimation(
                    horizontalOffset: 300,
                    child: FadeInAnimation(
                      child: GestureDetector(
                        onTap: () {
                          showBottomSheet(context, task);
                        },
                        child: TaskTile(task),
                      ),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
            itemCount: TaskController.taskList.length,
          );
        }
      }),
    );
  }

  noTaskMsg() {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 2000),
          left: 30.0,
          right: 30.0,
          curve: Curves.easeIn,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                SvgPicture.asset(
                  'assets/images/task.svg',
                  height: 90,
                  color: primaryClr.withOpacity(0.5),
                  semanticsLabel: 'Task',
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    'you dont have any task yet ! Add new tasks to make your days  productive',
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : darkGreyClr,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 180,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Get.isDarkMode ? darkGreyClr : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Column(
            children: [
              Container(
                height: 6,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        Get.isDarkMode ? Colors.grey[600] : Colors.grey[300]),
              ),
              const SizedBox(
                height: 20,
              ),
              task.isCompleted == 1
                  ? Container()
                  : buildBottomSheet(
                      label: 'Task Completed',
                      clr: primaryClr,
                      onPressed: () {
                        _taskController.markUsCompleted(task.id!);
                        Get.back();
                      }),
              buildBottomSheet(
                  label: 'delete task',
                  clr: Colors.red,
                  onPressed: () {
                    _taskController.deleteTask(task);
                    Get.back();
                  }),
              Divider(color: Get.isDarkMode ? Colors.grey : darkGreyClr),
              buildBottomSheet(
                  label: 'Cancel',
                  clr: primaryClr,
                  onPressed: () => Get.back()),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  buildBottomSheet(
      {required String label,
      required VoidCallback? onPressed,
      required Color clr,
      bool isClose = false}) {
    return GestureDetector(
      child: MaterialButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 90,
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: isClose
                    ? Get.isDarkMode
                        ? Colors.grey[600]!
                        : Colors.grey[200]!
                    : clr,
              ),
              borderRadius: BorderRadius.circular(30),
              color: isClose ? Colors.transparent : clr,
            ),
            child: Center(
                child: Text(label,
                    style: isClose
                        ? GoogleFonts.lato(
                            textStyle: TextStyle(
                            color: Get.isDarkMode ? Colors.white : darkGreyClr,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ))
                        : GoogleFonts.lato(
                            textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          )))),
          ),
        ),
      ),
    );
  }
}
