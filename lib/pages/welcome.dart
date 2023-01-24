import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/app_cubit.dart';
import 'package:travelapp/widgets/ResponsiveButton.dart';
import 'package:travelapp/widgets/app_large_text.dart';
import 'package:travelapp/widgets/app_text.dart';
import 'package:travelapp/utils/colors.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);
  List images = ["welcome-one.png", "welcome-two.png", "welcome-three.png"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: images.length,
            itemBuilder: (_, index) {
              return Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/" + images[index]),
                        fit: BoxFit.cover)),
                child: Container(
                  margin: const EdgeInsets.only(top: 120, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(text: "Trip"),
                          AppText(
                            text: "Mountain",
                            size: 30,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 250,
                            child: AppText(
                              text:
                                  "Mountain  hikes gives you an incredible sense of freedom along with indurance text",
                              color: AppColors.textColor2,
                              size: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<AppCubit>(context).getdata();
                            },
                            child: Container(
                              width: 200,
                              child: Row(
                                children: [
                                  ResponsiveButton(
                                    width: 120,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: List.generate(3, (indexDot) {
                          return Container(
                            margin: const EdgeInsets.all(2),
                            width: 8,
                            height: index == indexDot ? 25 : 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index == indexDot
                                    ? AppColors.mainColor
                                    : AppColors.mainColor.withOpacity(0.2)),
                          );
                        }),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
