class CarouselModel {
  String image;

  CarouselModel(this.image);
}

List<CarouselModel> carousels =
carouselsData.map((item) => CarouselModel(item['image']!)).toList();

var carouselsData = [
  {"image": "assets/img1.jpeg"},
  {"image": "assets/img2.jpeg"},
  {"image": "assets/img3.jpeg"},
  {"image": "assets/img4.jpeg"},
  {"image": "assets/img5.jpeg"},
];
