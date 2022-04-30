import 'package:flutter/cupertino.dart';
import 'package:skeletons/skeletons.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          SkeletonLists(),
          SkeletonLists(),
          SkeletonLists(),
        ],
      ),
    );
  }
}

class SkeletonLists extends StatelessWidget {
  const SkeletonLists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 230,
        child: Padding(
          padding: const EdgeInsets.only(top: 22, left: 22, right: 30, bottom: 20),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, index) {
                return SkeletonAvatar(style: SkeletonAvatarStyle(
                  height: 187,
                  width: 270,
                  borderRadius: BorderRadius.circular(8),
                ),);},
              separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(
                width: 20,),
              itemCount: 10),
        ));
  }
}
