import 'package:gradient_borders/gradient_borders.dart';
import 'package:hcricket/bloc/ipl_squads_bloc/ipl_squads_bloc.dart';
import 'package:hcricket/bloc/ipl_squads_bloc/ipl_squads_event.dart';
import 'package:hcricket/bloc/ipl_squads_bloc/ipl_squads_state.dart';
import 'package:hcricket/models/ipl_team_squad_model/ipl_team_squad_model.dart';
import 'package:hcricket/views/view.dart';

class IplSquadScreen extends StatefulWidget {
  dynamic imageId;
  dynamic teamName;
  dynamic teamSName;
  dynamic teamId;

  IplSquadScreen(
      {super.key, this.imageId, this.teamName, this.teamSName, this.teamId});

  @override
  State<IplSquadScreen> createState() => _IplSquadScreenState();
}

class _IplSquadScreenState extends State<IplSquadScreen> {
  late IplSquadsBloc iplSquadsBloc;

  @override
  void initState() {
    super.initState();
    iplSquadsBloc = IplSquadsBloc(iplSquadRepository: MatchHttpApiRepository());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            AppImagepath.mainBg,
            fit: BoxFit.fill,
          ),
        ),
        SafeArea(
            child: Column(
          children: [
            CostumeScoreAppbar(
              AppBarName: AppString.TeamSquads,
            ),
            8.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.r),
                    child: Image.network(
                      GetImage().FlagImage(flagId: widget.imageId),
                      height: 35.h,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error);
                      },
                    ),
                  ),
                  15.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.teamSName,
                        style: Appstyle.textstyle13Regular,
                      ),
                      Text(
                        widget.teamName,
                        style: Appstyle.textstyle15Bold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            12.verticalSpace,
            BlocProvider(
              create: (_) =>
                  iplSquadsBloc..add(GetAllSquadsList(widget.teamId)),
              child: BlocBuilder<IplSquadsBloc, IplSquadsState>(
                builder: (context, state) {
                  var players = state.allSquadsList.data?.player ?? [];

                  if (players.isEmpty) {
                    return Center(child: Text("No players available"));
                  }

                  // Grouping players by categories
                  Map<String, List<Player>> groupedPlayers = {};
                  String? currentCategory;

                  for (var player in players) {
                    if (player.id == null) {
                      // This is a category title
                      currentCategory = player.name;
                      groupedPlayers[currentCategory!] = [];
                    } else if (currentCategory != null) {
                      groupedPlayers[currentCategory]!.add(player);
                    }
                  }

                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: groupedPlayers.entries.map((entry) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    child: _headerText(headertitle: entry.key)),
                                GridView.builder(
                                  shrinkWrap: true,
                                  physics:
                                      NeverScrollableScrollPhysics(), // Prevents nested scrolling issues
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        2, // Ensures players appear line by line
                                    mainAxisSpacing: 10,
                                    mainAxisExtent: 250,
                                    crossAxisSpacing: 15,
                                    childAspectRatio:
                                        3, // Adjust for better layout
                                  ),
                                  itemCount: entry.value.length,
                                  itemBuilder: (context, index) {
                                    var player = entry.value[index];

                                    return Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color.fromARGB(0, 99, 101, 241),
                                            Color.fromARGB(54, 99, 101, 241),
                                          ],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                        border: GradientBoxBorder(
                                          gradient:
                                              AppColors.matchCoveragegradient,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          // Player Image (Fixed)
                                          Container(
                                            height: 137.h,
                                            width: 137.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(12.r),
                                                topRight: Radius.circular(12.r),
                                              ),
                                              image: player.imageId != null
                                                  ? DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                        GetSquadImage()
                                                            .FlagImage(
                                                          flagId: player.imageId
                                                              .toString(),
                                                        ),
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            child: player.imageId == null
                                                ? Icon(Icons.person,
                                                    size: 50,
                                                    color: Colors
                                                        .white) // Placeholder
                                                : null,
                                          ),
                                          4.verticalSpace,
                                          // Player Name
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 8.0.w, right: 8.0.w),
                                            child: Text(
                                              player.name ?? "Unknown",
                                              style: Appstyle.textstyle14bold,
                                              maxLines: 2,
                                            ),
                                          ),
                                          4.verticalSpace,
                                          // Batting Style
                                          Text(
                                            player.battingStyle ?? "",
                                            style: Appstyle.textstyle13Regular
                                                .copyWith(
                                              color: AppColors.whiteColor,
                                            ),
                                          ),
                                          // Bowling Style (if available)
                                          if (player.bowlingStyle != null)
                                            Text(
                                              player.bowlingStyle ?? "",
                                              style:
                                                  Appstyle.textstyle13Regular,
                                            ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        )),
      ]),
    );
  }

  Widget _headerText({
    required String headertitle,
  }) {
    return Container(
      decoration: ShapeDecoration(
          gradient: AppColors.seriesgradient,
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(7.r))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 5.h),
        child: Text(
          headertitle,
          style: Appstyle.textStyle12.copyWith(color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
