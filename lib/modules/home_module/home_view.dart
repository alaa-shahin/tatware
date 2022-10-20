import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:tatware/index.dart';
import 'package:tatware/modules/home_module/home_cubit.dart';
import 'package:tatware/modules/home_module/home_states.dart';
import 'package:tatware/util/widget_util.dart';

import 'local_widgets/bottom_nav_bar.dart';
import 'local_widgets/grabbing_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final ScrollController listViewController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 10.w,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/694.jpg'),
        ),
        centerTitle: true,
        title: SvgPicture.asset(
          'assets/images/logo.svg',
          height: 2.h,
        ),
        actions: [
          SvgPicture.asset('assets/icons/search.svg'),
          addHorizontalSpace(3),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        onTabChanged: (int value) {},
      ),
      body: BlocProvider(
        create: (_) => HomeCubit()
          ..getRecommendedExperts()
          ..getOnlineExperts()
          ..getCategory(),
        child: SnappingSheet(
          grabbing: GrabbingWidget(),
          grabbingHeight: 4.h,
          lockOverflowDrag: true,
          sheetAbove: null,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              children: [
                addVerticalSpace(3),
                Row(
                  children: [
                    Text(
                      'Recommended Experts',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Spacer(),
                    SvgPicture.asset('assets/icons/filter.svg'),
                  ],
                ),
                addVerticalSpace(4),
                BlocConsumer<HomeCubit, HomeStates>(
                  listener: (context, state) {
                    if (state is HomeRecommendedExpertsLoadingState) {
                      Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Container(
                      height: 34.h,
                      child: ListView.separated(
                        itemCount:
                            HomeCubit.get(context).recommendedModel!.length,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return addHorizontalSpace(3);
                        },
                        itemBuilder: (context, index) {
                          var recommendedExpert =
                              HomeCubit.get(context).recommendedModel![index];
                          return Container(
                            width: 48.w,
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  child: Container(
                                    child: CachedNetworkImage(
                                      imageUrl: recommendedExpert.image!,
                                      width: double.infinity,
                                      height: 17.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          Text(
                                            '(${recommendedExpert.rate})',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                          ),
                                          Spacer(),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.favorite,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      addVerticalSpace(2),
                                      Text(
                                        recommendedExpert.name!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                      addVerticalSpace(1),
                                      Text(
                                        recommendedExpert.title!,
                                        style:
                                            Theme.of(context).textTheme.caption,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                addVerticalSpace(5),
                Row(
                  children: [
                    Text(
                      'Online Experts',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Spacer(),
                    SvgPicture.asset('assets/icons/filter.svg'),
                  ],
                ),
                addVerticalSpace(5),
                BlocConsumer<HomeCubit, HomeStates>(
                  listener: (context, state) {
                    if (state is HomeOnlineExpertsLoadingState) {
                      Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Container(
                      height: 15.h,
                      child: ListView.separated(
                        itemCount: HomeCubit.get(context).onlineExperts!.length,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return addHorizontalSpace(5);
                        },
                        itemBuilder: (context, index) {
                          var onlineExpert =
                              HomeCubit.get(context).onlineExperts![index];
                          return Column(
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(onlineExpert.image!),
                                    radius: 4.h,
                                  ),
                                  PositionedDirectional(
                                    start: 12.w,
                                    child: CircleAvatar(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      radius: 1.w,
                                    ),
                                  ),
                                ],
                              ),
                              addVerticalSpace(2),
                              Text(
                                onlineExpert.name!,
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          sheetBelow: SnappingSheetContent(
            childScrollController: listViewController,
            draggable: true,
            child: Container(
              color: Colors.white,
              child: BlocConsumer<HomeCubit, HomeStates>(
                  listener: (context, state) {
                if (state is HomeCategoryLoadingState) {
                  Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }, builder: (context, state) {
                return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                  itemCount: HomeCubit.get(context).categoryModel!.length,
                  controller: listViewController,
                  separatorBuilder: (context, index) {
                    return addVerticalSpace(3);
                  },
                  itemBuilder: (context, index) {
                    var category = HomeCubit.get(context).categoryModel![index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 0.2),
                      ),
                      child: ListTile(
                        title: Text(
                          category.name!,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        subtitle: Text(
                          category.title!,
                          style: Theme.of(context).textTheme.caption,
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                        leading: Container(
                          width: 13.w,
                          child: CachedNetworkImage(
                            imageUrl: category.image!,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
