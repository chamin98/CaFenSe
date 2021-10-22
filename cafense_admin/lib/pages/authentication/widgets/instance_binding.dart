import 'package:cafense_admin/pages/authentication/widgets/authservices.dart';
import 'package:get/get.dart';

class InstanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Authservices>(() => Authservices());
  }
}
