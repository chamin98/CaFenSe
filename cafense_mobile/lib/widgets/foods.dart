class foods {
  final String name;
  final double price;
  final String image;
  final bool availability;

  foods(
      {required this.name,
      required this.price,
      required this.image,
      required this.availability});

  String getDishname(String dishname) {
    return dishname;
  }

  String getImg(String img) {
    return img;
  }

  double getPrice(double price) {
    return price;
  }
}

class breakfast extends foods {
  breakfast(
    String name,
    double price,
    String image,
    bool availability,
  ) : super(name: name, price: price, image: image, availability: availability);
}

class lunch extends foods {
  lunch(
    String name,
    double price,
    String image,
    bool availability,
  ) : super(name: name, price: price, image: image, availability: availability);
}

class desserts extends foods {
  desserts(
    String name,
    double price,
    String image,
    bool availability,
  ) : super(name: name, price: price, image: image, availability: availability);
}

class fastfoods extends foods {
  fastfoods(
    String name,
    double price,
    String image,
    bool availability,
  ) : super(name: name, price: price, image: image, availability: availability);
}
