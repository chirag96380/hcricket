import 'package:hcricket/bloc/league_bloc/league_bloc.dart';
import 'package:hcricket/bloc/league_bloc/league_event.dart';
import 'package:hcricket/bloc/league_bloc/league_state.dart';
import 'package:hcricket/utils/utils_exports.dart';
import 'package:hcricket/views/view.dart';

class ConstumeLeagueTeam extends StatefulWidget {
  const ConstumeLeagueTeam({super.key});

  @override
  State<ConstumeLeagueTeam> createState() => _ConstumeLeagueTeamState();
}

class _ConstumeLeagueTeamState extends State<ConstumeLeagueTeam> {
  late LeagueBloc leagueBloc;

  @override
  void initState() {
    super.initState();
    leagueBloc = LeagueBloc(leagueRepository: MatchHttpApiRepository());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => leagueBloc..add(GetLeagueList()),
      child: BlocBuilder<LeagueBloc, LeagueState>(builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(left: 8.0.w, right: 8.0.w),
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) {
                    final team = state.allLeague.data?.teams[index];

                    if (team?.belongsTo != "IPL")
                      return const SizedBox.shrink();

                    return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RoutesName.iplSquadScreen,
                              arguments: {
                                "imageId": team?.imageId,
                                "teamName": team?.teamName,
                                "teamSName": team?.teamSName,
                                "teamId": team?.teamId is int
                                    ? team?.teamId
                                    : int.tryParse(
                                            team?.teamId.toString() ?? '') ??
                                        0,
                              });
                        },
                        child: Padding(
                            padding: EdgeInsets.only(left: 9.0.w, right: 9.w),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50.r),
                                  child: Image.network(
                                    GetSquadImage().FlagImage(
                                      flagId: state.allLeague.data?.teams[index]
                                              .imageId
                                              .toString() ??
                                          '',
                                    ),
                                    height: 60.h,
                                    width: 60.h,
                                  ),
                                ),
                                8.verticalSpace,
                                Text(
                                  state.allLeague.data?.teams[index].teamSName
                                          .toString() ??
                                      '',
                                  style: Appstyle.textstyle13,
                                )
                              ],
                            )));
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
