import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_app_getx/app/core/utils/keys.dart';
import 'package:todo_app_getx/app/data/services/storage/services.dart';

import '../../models/task.dart';

class TaskProvider {
  StorageService storage = Get.find<StorageService>();

  List<Task> readTask() {
    var tasks = <Task>[];
    jsonDecode(storage.read(taskKey).toString())
        .forEach((e) => tasks.add(Task.fromJson(e)));
    return tasks;
  }

  void writeTask(List<Task> tasks) {
    storage.write(taskKey, jsonEncode(tasks));
  }
}
