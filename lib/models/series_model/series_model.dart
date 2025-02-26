class SeriesModel {
  String? status;
  List<Response>? response;

  SeriesModel({this.status, this.response});

  SeriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  String? date;
  List<SeriesList>? seriesList;

  Response({this.date, this.seriesList});

  Response.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['seriesList'] != null) {
      seriesList = <SeriesList>[];
      json['seriesList'].forEach((v) {
        seriesList!.add(SeriesList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    if (seriesList != null) {
      data['seriesList'] = seriesList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SeriesList {
  String? seriesId;
  String? seriesName;
  String? seriesDate;

  SeriesList({this.seriesId, this.seriesName, this.seriesDate});

  SeriesList.fromJson(Map<String, dynamic> json) {
    seriesId = json['seriesId'];
    seriesName = json['seriesName'];
    seriesDate = json['seriesDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['seriesId'] = seriesId;
    data['seriesName'] = seriesName;
    data['seriesDate'] = seriesDate;
    return data;
  }
}
