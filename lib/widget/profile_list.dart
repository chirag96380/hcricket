import 'package:hcricket/widget/widgets_exports.dart';

class ProfileList {
  // ignore: non_constant_identifier_names
  String? Icon;
  String? title;

  ProfileList(this.Icon, this.title);
}

List<ProfileList> profileTabs = [
  ProfileList(
    AppImagepath.rateIcon,
    "App rate",
  ),
  ProfileList(AppImagepath.policyIcon, "Privacy policy"),
  ProfileList(AppImagepath.termsIcon, "Tearm and condition"),
];
