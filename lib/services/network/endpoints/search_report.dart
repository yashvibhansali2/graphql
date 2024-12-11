class SearchReportEndpoints {
  static const String getSearchReport = r'''
  mutation getCheckinData ($startDate: String, $endDate: String) {
    getCheckinData(startDate:$startDate, endDate: $endDate) {
      data {
        searches
        date
      }
      hostelName
    }
  }
''';
}
