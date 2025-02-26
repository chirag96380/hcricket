class GetImage {
  // ignore: non_constant_identifier_names
  String FlagImage({required String flagId}) {
    // return "https://images.cricbuzz.com/team_logos/${flagId}.jpg";

    // return "https://www.cricbuzz.com/a/img/v1/i1/c$flagId/large.jpg";
    return "https://www.cricbuzz.com/a/img/v1/1200x800/i1/c$flagId/.jpg";

    // return "https://static.cricbuzz.com/a/img/v1/200x200/i1/c368671.jpg";
  }
}

class GetSquadImage {
  // ignore: non_constant_identifier_names
  String FlagImage({required String flagId}) {
    // return "https://images.cricbuzz.com/team_logos/${flagId}.jpg";

    // return "https://www.cricbuzz.com/a/img/v1/i1/c$flagId/large.jpg";
    return "https://static.cricbuzz.com/a/img/v1/600x600/i1/c$flagId/.jpg";

    // return "https://static.cricbuzz.com/a/img/v1/200x200/i1/c368671.jpg";
  }
}

//  https://static.cricbuzz.com/a/img/v1/152x152/i1/c244815/.jpg
// https://www.cricbuzz.com/images/team/{ImageID}.png
// https://images.cricbuzz.com/team_logos/{ImageID}.jpg
// https://cdn.cricbuzz.com/img/team/{ImageID}.jpg



// https://www.cricbuzz.com/a/img/v1/595x396/i1/c612419/.jpg