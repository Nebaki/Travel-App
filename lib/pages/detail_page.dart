import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/app_cubit.dart';
import 'package:travelapp/cubit/app_cubit_state.dart';
import 'package:travelapp/utils/colors.dart';
import 'package:travelapp/widgets/Appbutton.dart';
import 'package:travelapp/widgets/ResponsiveButton.dart';
import 'package:travelapp/widgets/app_large_text.dart';
import 'package:travelapp/widgets/app_text.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int getStarColor = 3;
  int selctedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AppCubit, CubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        if (state is DetailState) {
          return Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "http://192.168.137.1:8000/uploads/" +
                                  detail.place.img),
                          fit: BoxFit.cover),
                    ),
                  )),
              Positioned(
                  top: 50,
                  left: 20,
                  child: Row(children: [
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubit>(context).goHome();
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ))
                  ])),
              Positioned(
                  top: 250,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    height: 520,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: detail.place.name,
                              color: Colors.black.withOpacity(0.7),
                            ),
                            AppLargeText(
                              text: "\$ " + detail.place.price.toString(),
                              color: AppColors.mainColor,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            AppText(
                              text: detail.place.location,
                              color: AppColors.textColor1,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Wrap(
                                children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: getStarColor >= index
                                    ? AppColors.starColor
                                    : AppColors.textColor2,
                              );
                            })),
                            SizedBox(
                              width: 5,
                            ),
                            AppText(
                              text: detail.place.stars.toString(),
                              color: AppColors.textColor2,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AppLargeText(
                          text: detail.place.people.toString(),
                          size: 20,
                          color: Colors.black.withOpacity(0.8),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        AppText(
                          text: detail.place.description,
                          color: AppColors.mainTextColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Wrap(
                            children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selctedIndex = index;
                              });
                            },
                            child: Container(
                                margin: EdgeInsets.only(right: 8),
                                child: AppButton(
                                  color: index == selctedIndex
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundcolor: index == selctedIndex
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  size: 50,
                                  isIcon: false,
                                  bordercolor: AppColors.buttonBackground,
                                  text: (index + 1).toString(),
                                )),
                          );
                        })),
                        SizedBox(
                          height: 10,
                        ),
                        AppLargeText(
                          text: "Description",
                          color: Colors.black.withOpacity(0.8),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        AppText(text: detail.place.description),
                        SizedBox(
                          height: 10,
                        ),
                        Positioned(
                          bottom: 20,
                          
                          child: Row(
                            children: [
                              AppButton(
                                isIcon: true,
                                color: AppColors.textColor1,
                                backgroundcolor: Colors.white,
                                size: 50,
                                bordercolor: AppColors.textColor1,
                                icon: Icons.favorite_border,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              ResponsiveButton(
                                isResponsive: true,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          );
        } else {
          return Container();
        }
      },
    ));
  }
}
