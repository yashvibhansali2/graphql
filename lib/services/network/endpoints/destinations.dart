class DestinationEndpoints {
  static const String getDestinationList = r'''
    query{
      getDestinationList{
        destination
        portraitImage
        url
      }
    }
''';
}
