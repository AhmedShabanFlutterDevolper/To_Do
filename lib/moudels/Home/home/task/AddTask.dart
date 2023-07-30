import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../shared/components/componenets.dart';
import '../../../../shared/components/task.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/size_config.dart';
import '../detiles/det.dart';

// import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TaskController _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: context.theme.backgroundColor,
        title: Text(
          'Add Task',
          style: TextStyle(
            color: Get.isDarkMode ? Colors.white : darkGreyClr,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.to(const detailsScrean()),
            icon: Icon(
              Icons.account_circle_outlined,
              size: 35,
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.task,
                    size: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Add Task',
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : darkGreyClr,
                        fontSize: 26,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 3,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(30)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Title',
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : darkGreyClr,
                    fontSize: 26,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 10,
              ),
              dafultTextFromField(
                  prefix: Icons.title,
                  controller: title,
                  label: 'Enter title here',
                  type: TextInputType.text),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 3,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(30)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Note',
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : darkGreyClr,
                    fontSize: 26,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 10,
              ),
              dafultTextFromField(
                controller: note,
                label: 'Enter Note here',
                type: TextInputType.text,
                prefix: Icons.note_alt_rounded,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 3,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(30)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Date',
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : darkGreyClr,
                    fontSize: 26,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 10,
              ),
              dafultTextFromField(
                suffix: Icons.calendar_today,
                controller: date,
                label: '${DateFormat.yMd().format(Date)}',
                type: TextInputType.datetime,
                onPressedIcon: () => GetData(),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 3,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(30)),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Start Time',
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : darkGreyClr,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    width: 45,
                  ),
                  Text(
                    'End Time',
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : darkGreyClr,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        controller: Stime,
                        cursorColor: primaryClr,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          hintText: StartTime,

                          prefixIconColor: primaryClr,
                          suffixIcon: IconButton(
                            icon: Icon(Icons.access_time_filled_rounded),
                            onPressed: () => GetTime(isStartTime: true),
                          ),
                          suffixIconColor: primaryClr,
                          labelStyle: TextStyle(color: Colors.grey[500]),

                          border: myinputborder(), //normal border
                          enabledBorder: myinputborder(), //enabled border
                          focusedBorder: myfocusborder(), //focused border
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                        controller: Etime,
                        cursorColor: primaryClr,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          hintText: EndTime,

                          prefixIconColor: primaryClr,
                          suffixIcon: IconButton(
                            icon: Icon(Icons.access_time_filled_rounded),
                            onPressed: () => GetTime(isStartTime: false),
                          ),
                          suffixIconColor: primaryClr,
                          labelStyle: TextStyle(color: Colors.grey[500]),

                          border: myinputborder(), //normal border
                          enabledBorder: myinputborder(), //enabled border
                          focusedBorder: myfocusborder(), //focused border
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 3,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(30)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Repeat',
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : darkGreyClr,
                    fontSize: 26,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  cursorColor: primaryClr,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    hintText: SelectedRepeat,

                    prefixIconColor: primaryClr,

                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: DropdownButton(
                          dropdownColor: primaryClr,
                          borderRadius: BorderRadius.circular(20),
                          items: RepeatList.map<DropdownMenuItem<String>>(
                              (String e) => DropdownMenuItem<String>(
                                  value: e.toString(),
                                  child: Text(
                                    e,
                                    style: TextStyle(color: Colors.white),
                                  ))).toList(),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.grey,
                          ),
                          elevation: 5,
                          underline: Container(
                            height: 0,
                          ),
                          onChanged: (String? NewValue) {
                            setState(() {
                              SelectedRepeat = NewValue!;
                            });
                          },
                          style: TextStyle(
                            color: Get.isDarkMode ? Colors.white : darkGreyClr,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          )),
                    ),

                    suffixIconColor: primaryClr,
                    labelStyle: TextStyle(color: Colors.grey[500]),

                    border: myinputborder(), //normal border
                    enabledBorder: myinputborder(), //enabled border
                    focusedBorder: myfocusborder(), //focused border
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 3,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(30)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Color',
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : darkGreyClr,
                    fontSize: 26,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        SelectedColor = 0;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        child: SelectedColor == 0
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : null,
                        backgroundColor: pinkClr,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        SelectedColor = 1;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, right: 5, left: 5),
                      child: CircleAvatar(
                        child: SelectedColor == 1
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : null,
                        backgroundColor: Colors.amber,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        SelectedColor = 2;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        child: SelectedColor == 2
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : null,
                        backgroundColor: bunkClr,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        SelectedColor = 3;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, right: 5, left: 5),
                      child: CircleAvatar(
                        child: SelectedColor == 3
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : null,
                        backgroundColor: orangeClr,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        SelectedColor = 4;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        child: SelectedColor == 4
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : null,
                        backgroundColor: primaryClr,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        SelectedColor = 5;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, right: 5, left: 5),
                      child: CircleAvatar(
                        backgroundColor: ColorClr,
                        child: SelectedColor == 5
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 3,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(30)),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  validator();
                },
                child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: primaryClr),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.task,
                          size: 40,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Create Task',
                          style: TextStyle(
                              color:
                                  Get.isDarkMode ? Colors.white : darkGreyClr,
                              fontSize: 26,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  validator() {
    if (title.text.isNotEmpty && note.text.isNotEmpty) {
      addTaskToDb();
      Get.back();
    } else if (title.text.isEmpty || note.text.isEmpty) {
      Get.snackbar('required', 'All fields  are required ',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.red,
          borderRadius: 30.0,
          borderColor: Colors.red,
          borderWidth: 1.5,
          icon: const Icon(
            Icons.warning_amber_outlined,
            color: Colors.red,
          ));
    } else {
      print('################### SOMETHING BAD HAPPENED ####################');
    }
  }

  addTaskToDb() async {
    int value = (await _taskController.addTask(
      task: Task(
        title: title.text,
        note: note.text,
        isCompleted: 0,
        date: DateFormat.yMd().format(SelectedDate),
        startTime: StartTime,
        endTime: EndTime,
        color: SelectedColor,
        repeat: SelectedRepeat,
      ),
    ));
    print('$value');
  }

  GetData() async {
    DateTime? _pickedDate = await showDatePicker(
      context: context,
      initialDate: SelectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(5050),
    ).then((value) {
      date.text = DateFormat.yMMMd().format(value!);
    });
    if (_pickedDate != null)
      setState(() => SelectedDate = _pickedDate!);
    else
      print("IT 's null or something is wrong");
  }

  GetTime({required bool isStartTime}) async {
    TimeOfDay? _pickedTime = (await showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: isStartTime
            ? TimeOfDay.fromDateTime(DateTime.now())
            : TimeOfDay.fromDateTime(
                DateTime.now().add(const Duration(minutes: 20)))));

    String _formattedTime = _pickedTime!.format(context);

    if (isStartTime)
      setState(() => StartTime = _formattedTime);
    else if (!isStartTime)
      setState(() => EndTime = _formattedTime);
    else {
      print('time canceled or  something is wrong');
    }
  }
}
