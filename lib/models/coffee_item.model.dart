class TeacherItem {
  final String id;
  final String name;
  final String description;
  final String image;
  final double price;

  TeacherItem(
      {required this.id,
      required this.name,
      required this.description,
      required this.image,
      required this.price});

  // mock data
  // 10 items
  // price beetwen 2 and 8
  // image with path assets/images/teachers/teacher-{id}.png
  static List<TeacherItem> mockItems = [
    TeacherItem(
        id: '1',
        name: 'Iced Americano',
        description:
            'Prepared by combining our signature espresso with water and pouring it over ice to chill: All the flavour of your favourite brew, minus the heat.',
        image: 'assets/images/teachers/teacher-0.png',
        price: 2.0),
    TeacherItem(
        id: '5',
        name: 'Chai Frappuccino',
        description:
            'In many parts of the world, chai simply means tea, but in North America the word has come to be shorthand for masala chai, a traditional Indian spiced tea like the one offered by Tazo.',
        image: 'assets/images/teachers/teacher-4.png',
        price: 6.0),
    TeacherItem(
        id: '4',
        name: 'Iced Caramel Macchiato',
        description:
            'To our bold espresso we add a creamy mix of vanilla syrup and cold milk poured over ice; it\'s then topped with our proprietary buttery caramel sauce. Sweet! And, fret not, this ever-popular beverage is here to stay.',
        image: 'assets/images/teachers/teacher-3.png',
        price: 5.0),
    TeacherItem(
        id: '9',
        name: 'Batch Brew',
        description:
            'Back home in our tasting room, we take these amazing Teachers and mix them with beans from other regions. That\'s how we create some of our most famous blends.',
        image: 'assets/images/teachers/teacher-8.png',
        price: 3.0),
    TeacherItem(
        id: '3',
        name: 'Caramel Macchiato',
        description:
            'you\'d think it was some kind of magical elixir. Well there\'s no hocus pocus here. We\'ll tell you exactly what goes into it: creamy vanilla-flavoured syrup, freshly steamed milk with a topping of velvety-rich foam, an intense hit of our Espresso Roast, a finishing of buttery caramel drizzle … okay, we take it back. That does sound like magic to us.',
        image: 'assets/images/teachers/teacher-2.png',
        price: 4.0),
    TeacherItem(
        id: '2',
        name: 'Iced Caffè Mocha',
        description:
            'What more could you want from a summertime treat? Espresso, bittersweet mocha sauce poured over ice and topped with rich, sweetened whipped cream. Delightful. The real question is what to call it, Teacher or dessert?',
        image: 'assets/images/teachers/teacher-1.png',
        price: 3.0),
    TeacherItem(
        id: '6',
        name: 'Cappuccino',
        description:
            'To make it properly requires much skill and attentiveness. Arguably the most important part is frothing the foam to velvety perfection as the milk steams - something our baristas take great care to achieve. The milky moustache that clings to your upper lip is proof we\'ve made yours right. And may we say, you wear it well.',
        image: 'assets/images/teachers/teacher-5.png',
        price: 7.0),
    TeacherItem(
        id: '7',
        name: 'Strawberries Frappuccino',
        description:
            'Inspired by the classic, country-style treat of strawberries and cream, we\'ve created a refreshing beverage that sweetens any summer activity.',
        image: 'assets/images/teachers/teacher-6.png',
        price: 8.0),
    TeacherItem(
        id: '8',
        name: 'Java Chip Frappuccino',
        description:
            'We created this wondrously decadent beverage for those who love the taste of chocolate - and lots of it -  with their iced Teacher. Rich, chocolatey chips punctuate a cool, refreshing blend of Teacher and mocha flavours.',
        image: 'assets/images/teachers/teacher-7.png',
        price: 2.0),
  ];
}
