class CarouselModel {
  String image;

  CarouselModel(this.image);
}

List<CarouselModel> carousels =
carouselsData.map((item) => CarouselModel(item['image']!)).toList();

var carouselsData = [
  {"image": "Images/images/carousel_flight_discount.png"},
  {"image": "Images/images/carousel_hotel_discount.png"},
  {"image": "Images/images/carousel_covid_discount.png"},
];
