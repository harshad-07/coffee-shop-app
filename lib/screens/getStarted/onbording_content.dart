class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Quality Food',
      image: 'assets/quality.svg',
      discription: "Coffees which are made with best quality coffee beans!! "),
  UnbordingContent(
      title: 'Fast Delevery',
      image: 'assets/delevery.svg',
      discription: "Quick Delivery"),
  UnbordingContent(
      title: 'Reward Prizes',
      image: 'assets/reward.svg',
      discription: "Get Chance to Win Exciting Rewards"),
];
