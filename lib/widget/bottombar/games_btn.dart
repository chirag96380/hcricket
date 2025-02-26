import 'package:hcricket/widget/widgets_exports.dart';

class GamesBtn extends StatelessWidget {
  const GamesBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 75.0, // Desired height
        width: 75.0, // Optional: Adjust width if needed
        child: FloatingActionButton(
          isExtended: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.r),
          ),
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.GameScreen);
          },
          backgroundColor: AppColors.whiteColor.withOpacity(0.7),
          child: Container(
            height: 66.0, // Desired height
            width: 66.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color: AppColors.gameborderColor.withOpacity(0.40),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    gradient: AppColors.gamegradient),
                child: Padding(
                  padding: EdgeInsets.all(8.0.h),
                  child: Image.asset(AppImagepath.gamePokeballicon),
                ),
              ),
            ),
          ),
        ));
  }
}
