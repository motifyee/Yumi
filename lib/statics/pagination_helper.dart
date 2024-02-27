class PaginationHelper {
  static Map<String, dynamic> toJson(
      {required int pageNumber, required int pageSize}) {
    return {'pageNumber': pageNumber, 'pageSize': pageSize};
  }
}
