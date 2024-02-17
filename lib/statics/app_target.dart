class AppTarget {
  static AppTargetUser user = AppTargetUser.chefs;
  static String branch = AppTargetBranches.yumi;
}

enum AppTargetUser { customers, chefs, drivers }

class AppTargetBranches {
  static String yumi = '48';
}
