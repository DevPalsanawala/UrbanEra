import 'package:get/get.dart';
import 'package:UrbanEraFashion/config/image.dart';
import 'package:UrbanEraFashion/config/text_string.dart';

class MyAddressController extends GetxController {
  RxInt selectedContainerIndex = (-1).obs;

  void selectContainer(int index) {
    if (selectedContainerIndex.value == index) {
      selectedContainerIndex.value = -1;
    } else {
      selectedContainerIndex.value = index;
    }
  }

  String getContainerImage(int index) {
    return selectedContainerIndex.value == index
        ? ImageConfig.fillRound
        : ImageConfig.emptyRound;
  }

  List<String> usersName = [
    TextString.janeCooper,
    TextString.dianneRussell,
    TextString.jacobJones,
  ];

  List<String> addressLists = [
    TextString.address1,
    TextString.address2,
    TextString.address3,
  ];

  List<String> addressMobileNumbers = [
    TextString.addressMobile1,
    TextString.addressMobile2,
    TextString.addressMobile2,
  ];
}
