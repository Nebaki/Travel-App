import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/app_cubit.dart';
import 'package:travelapp/cubit/app_cubit_state.dart';
import 'package:travelapp/utils/colors.dart';
import 'package:travelapp/widgets/app_large_text.dart';
import 'package:travelapp/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling"
  };
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(body: BlocBuilder<AppCubit, CubitStates>(
      builder: (context, state) {
        if (state is LoadedState) {
          var info = state.places;
          return Container(
            padding: const EdgeInsets.only(top: 60, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.menu,
                      color: Colors.black54,
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                AppLargeText(text: "Discover"),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 20, right: 20),
                      controller: tabController,
                      labelColor: Colors.black,
                      isScrollable: true,
                      unselectedLabelColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: CircleTabIndicator(
                          color: AppColors.mainColor, rad: 4),
                      tabs: const [
                        Tab(text: "Places"),
                        Tab(text: "inspiration"),
                        Tab(text: "Emotion")
                      ]),
                ),
                SizedBox(
                  height: 220,
                  width: double.maxFinite,
                  child: TabBarView(controller: tabController, children: [
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: info.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: (){
                         BlocProvider.of<AppCubit>(context).detailpage(info[index]);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 20, top: 10),
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image:  DecorationImage(
                                image: NetworkImage("http://192.168.137.1:8000/uploads/"+info[index].img),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                    const Text("there"),
                    const Text("bye"),
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(
                        text: "Explore more",
                        size: 22,
                      ),
                      AppText(
                        text: "See all",
                        color: AppColors.textColor2,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 110,
                  width: double.maxFinite,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (_, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 40),
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage("assets/" +
                                        images.keys.elementAt(index)),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child:
                                AppText(text: images.values.elementAt(index)),
                          )
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    ));
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double rad;
  CircleTabIndicator({required this.color, required this.rad});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return CirclePainter(color: color, rad: rad);
  }
}

class CirclePainter extends BoxPainter {
  final Color color;
  double rad;
  CirclePainter({required this.color, required this.rad});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(configuration.size!.width / 2 - rad / 2,
        configuration.size!.height - rad);
    canvas.drawCircle(offset + circleOffset, rad, paint);
  }
}
