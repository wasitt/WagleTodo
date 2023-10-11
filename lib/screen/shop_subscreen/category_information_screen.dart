import 'package:flutter/material.dart';
import 'package:wagle_todo/const/colors.dart';
import 'package:wagle_todo/component/app_bar.dart';

class CategoryInformationScreen extends StatelessWidget {
  const CategoryInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CategoryInformationScreenAppBar(),
      body: const Center(
        child: Column(
          children: [
            CategoryImage(),
            CategoryIntroductionText(),
            TodoPreview(),
            Row(
              children: [
                ShareButton(),
                DownloadButton(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

///대문짝만한 사진
///
class CategoryImage extends StatelessWidget {
  const CategoryImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage("asset/img/서강대아이콘.png"),
      width: MediaQuery.of(context).size.width / 3.0,
      height: MediaQuery.of(context).size.height / 3.5,
    );
  }
}

///카테고리 소개 문구
///
class CategoryIntroductionText extends StatelessWidget {
  const CategoryIntroductionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Container(
        child: Text(
          "서강대학교 학사일정입니다.",
          style: TextStyle(fontSize: 15.0),
        ),
      ),
    );
  }
}

///미리보기
///
class TodoPreview extends StatelessWidget {
  const TodoPreview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.4,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return CalendarExample();
        },
      ),
    );
  }
}

///미리보기
class CalendarExample extends StatelessWidget {
  const CalendarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("10월 7일"),
      subtitle: Text("김지형 배때기 털 뽑기ㅣ"),
    );
  }
}

///공유 버튼
///
///
class ShareButton extends StatelessWidget {
  const ShareButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {}, icon: const Icon(Icons.ios_share));
  }
}

///다운로드 버튼
class DownloadButton extends StatelessWidget {
  const DownloadButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text("다운로드하기"),
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(RED_COLOR.withOpacity(0.7)),
          fixedSize: MaterialStatePropertyAll(Size(
              MediaQuery.of(context).size.width / 1.3,
              MediaQuery.of(context).size.height / 13.0))),
    );
  }
}
