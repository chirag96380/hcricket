import 'package:hcricket/views/view.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  final _controller = PageController(keepPage: true);
  bool isLast = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                isLast = index == 2;
              });
            },
            children: [
              CostumeOnboard(
                image: AppImagepath.obimgone,
                title: AppString.discover_cricket_like_never_before,
                subtitle: AppString.stay_updated_with_live_scores,
              ),
              CostumeOnboard(
                image: AppImagepath.obimgtwo,
                title: AppString.follow_your_favorite_teams,
                subtitle: AppString.get_personalized_updates,
              ),
              CostumeOnboard(
                image: AppImagepath.obimgthree,
                title: AppString.join_the_cricket_community,
                subtitle: AppString.be_part_of_the_excitement,
              ),
            ],
          ),
          Padding(
              padding:
                  EdgeInsets.only(left: 20.0.w, right: 20.0.w, bottom: 30.h),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: GestureDetector(
                    onTap: () {
                      if (isLast) {
                        Navigator.pushReplacementNamed(
                            context, RoutesName.BottomNav);
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Costumebtn(
                      btname: isLast ? "Get Start" : "Next",
                    ),
                  ))),
        ],
      ),
    );
  }
}
