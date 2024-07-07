class AppAssets {
  // ###########################################################################
  // registeration

  // documentation
  static const documentationFileIcon = 'assets/images/docs_file.svg';
  static const filesIcon = 'assets/images/files.svg';
  static const documentsIcon = 'assets/images/documents-icon.svg';
  static const downloadIcon = 'assets/images/download_icon.svg';

  // mobile & email
  static const addPhoneIcon = 'assets/images/registeration/add_phone.png';
  static const otpIcon = 'assets/images/registeration/otp.png';
  static const emailMsgIcon = 'assets/images/email_msg.svg';
  static const emailMsgInactiveIcon = 'assets/images/email_msg_inactive.svg';
  static const mobileMsgIcon = 'assets/images/mobile_msg.svg';
  static const mobileMsgInactiveIcon = 'assets/images/mobile_msg_inactive.svg';

  // contract
  static const contractIcon = 'assets/images/contract_icon.svg';
  static const chefConrtactIcon = 'assets/images/chef_contract.svg';
  static const driverContractIcon = 'assets/images/driver_contract.svg';

  // map
  static const mapPinIcon = 'assets/images/map/map_pin.svg';

  // onboarding flow
  static onboardingStepIcon(String icon, bool isDone) =>
      'assets/images/flow/${icon + (isDone ? '-done' : '')}.svg';

  // ###########################################################################
  // login
  static const appleIcon = 'assets/images/apple.svg';
  static const googleIcon = 'assets/images/google.svg';
  static const facebookIcon = 'assets/images/facebook.svg';

  // ###########################################################################

  static const vegiesIcon = 'assets/images/vegies.png';
  static const driverFlowIcon = 'assets/images/flow/driver-flow.png';
  static const ridesIcon = 'assets/images/flow/rides.png';
  static const motorcycleIcon = 'assets/images/flow/motorcycle.svg';
  static const addScheduleIcon = 'assets/images/flow/add-schedule.svg';
  static const logoutMenuIcon = 'assets/images/logout_menu.svg';

  static const addVisaCardIcon = 'assets/images/add_visa_card.svg';
  static const scheduleMenuIcon = 'assets/images/schedule_menu.svg';
  static const voucherIcon = 'assets/images/voucher.svg';

  static const welcomeChefIcon = 'assets/images/welocme_chef_icon.svg';
  static const welcomeDriverIcon = 'assets/images/welcom_driver_icon.svg';
  static const ellipseIcon = 'assets/images/Ellipse1.svg';
}
