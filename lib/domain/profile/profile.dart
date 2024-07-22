import 'package:common_code/common_code.dart';
import 'package:yumi/global.dart';

extension ProfileX on Profile {
  bool get profileSheetDone {
    if (bio.isEmpty) return false;
    if (profileImage == null) return false;
    if (G().isChefApp && (eventPhotosCount == 0)) return false;

    return true;
  }

  bool get documentaionDone {
    if (idPhoto == null) return false;

    if (G().isDriverApp) {
      if (driverLicensePhoto == null) return false;
      if (driverLicenseCodePhoto == null) return false;
      if (foodDeliveryInsurancePhoto == null) return false;
      // if (evidenceOfResidencePhoto == null) return false;

      return true;
    }

    if (G().isChefApp) {
      if (hygienePhoto == null) return false;
      if (riskPhoto == null) return false;
      if (registerationPhoto == null) return false;

      return true;
    }

    return true;
  }
}
