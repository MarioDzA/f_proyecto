import 'package:f_elproyecto/domain/repo/repository.dart';
import 'package:f_elproyecto/pages/controllers/hubcontroller.dart';
import 'package:get/get.dart';

class Hubusecase {
  late Hubdata hubcontroller = Get.find();
  setuser() async {
    hubcontroller.setusername(await Repository().getusername());
    hubcontroller.setuserscore(await Repository().getscore());
  } 
}
