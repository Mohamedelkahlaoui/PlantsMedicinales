class Plant {
  final int plantId;
  final int price;
  final String size;
  final double rating;
  final int humidity;
  final String temperature;
  final String category;
  final String plantName;
  final String imageURL;
  bool isFavorated;
  final String decription;
  bool isSelected;

  Plant(
      {required this.plantId,
      required this.price,
      required this.category,
      required this.plantName,
      required this.size,
      required this.rating,
      required this.humidity,
      required this.temperature,
      required this.imageURL,
      required this.isFavorated,
      required this.decription,
      required this.isSelected});

  //List of Plants data
  static List<Plant> plantList = [
    Plant(
        plantId: 0,
        price: 22,
        category: 'Indoor',
        plantName: 'La sauge (Salvia officinale)',
        size: 'Small',
        rating: 4.5,
        humidity: 34,
        temperature: '23 - 34',
        imageURL: 'assets/images/plant-one.png',
        isFavorated: false,
        decription:
            'La sauge officinale est une plante vivace rustique, pouvant aller jusqu’à 80cm en tous sens. Elle porte des feuilles ovales,'
            'gris-vert et duveteuses. Au froissement, elles dégagent une puissante odeur camphrée. En été apparaissent des épis bleu violacé.',
        isSelected: false),
    Plant(
        plantId: 1,
        price: 11,
        category: 'Outdoor',
        plantName: 'Les menthes (Mentha)',
        size: 'Medium',
        rating: 4.8,
        humidity: 56,
        temperature: '19 - 22',
        imageURL: 'assets/images/plant-two.png',
        isFavorated: false,
        decription:
            'Les menthes, appartenant au genre Mentha, sont des plantes herbacées de la famille des Lamiacées.'
            ' Elles sont largement répandues à travers le monde et sont appréciées pour leur arôme distinctif de menthe.',
        isSelected: false),
    Plant(
        plantId: 2,
        price: 18,
        category: 'Indoor',
        plantName: 'La lavande (Lavandula)',
        size: 'Large',
        rating: 4.7,
        humidity: 34,
        temperature: '22 - 25',
        imageURL: 'assets/images/plant-three.png',
        isFavorated: false,
        decription:
            'La lavande, du genre Lavandula, est un genre de plantes appartenant à la famille des Lamiacées.'
            'Ces plantes sont largement connues pour leurs fleurs parfumées et sont souvent cultivées à des fins ornementales, aromatiques et médicinales. ',
        isSelected: false),
    Plant(
        plantId: 3,
        price: 30,
        category: 'Outdoor',
        plantName: 'Le souci des jardins',
        size: 'Small',
        rating: 4.5,
        humidity: 35,
        temperature: '23 - 28',
        imageURL: 'assets/images/plant-four.png',
        isFavorated: false,
        decription:
            'Le souci est une plante annuelle incontournable de nos jardins. Ses fleurs se remarquent par leur couleur lumineuse allant du jaune'
            'soleil à l’orange vif et parfois presque jusqu’au rouge brique.',
        isSelected: false),
    Plant(
        plantId: 4,
        price: 24,
        category: 'Recommended',
        plantName: 'La camomille allemande',
        size: 'Large',
        rating: 4.1,
        humidity: 66,
        temperature: '12 - 16',
        imageURL: 'assets/images/plant-five.png',
        isFavorated: false,
        decription:
            'La camomille allemande est une petite plante annuelle qui fleurit tout l’été. Ses fleurs ressemblent à de petites marguerites blanches à cœur jaune.'
            'Elle présente un feuillage très découpé et forme une jolie touffe de 50 à 60cm de haut.',
        isSelected: false),
    Plant(
        plantId: 5,
        price: 24,
        category: 'Outdoor',
        plantName: 'La guimauve',
        size: 'Medium',
        rating: 4.4,
        humidity: 36,
        temperature: '15 - 18',
        imageURL: 'assets/images/plant-six.png',
        isFavorated: false,
        decription:
            'La guimauve est une plante vivace au port arbustif qui peut atteindre 1,50m de hauteur, voire plus pour 1m d’envergure.'
            'Les nombreuses fleurs rose pâle apparaissent en été sur un feuillage duveteux vert gris.',
        isSelected: false),
    Plant(
        plantId: 6,
        price: 19,
        category: 'Garden',
        plantName: 'L’ortie',
        size: 'Small',
        rating: 4.2,
        humidity: 46,
        temperature: '23 - 26',
        imageURL: 'assets/images/plant-seven.png',
        isFavorated: false,
        decription:
            'La grande ortie est une plante vivace aux rhizomes traçants qui peut mesurer jusqu’à 1,50m de hauteur voire plus.'
            'Elle présente des fleurs femelles (grappes verdâtres et pendantes) et des fleurs mâles (en épis jaunâtres plus à l’horizontale) sur des pieds différents.'
            'Toute la plante est recouverte de poils urticants.',
        isSelected: false),
    Plant(
        plantId: 7,
        price: 23,
        category: 'Garden',
        plantName: 'La mélisse',
        size: 'Medium',
        rating: 4.5,
        humidity: 34,
        temperature: '21 - 24',
        imageURL: 'assets/images/plant-eight.png',
        isFavorated: false,
        decription:
            'La mélisse est une plante vivace buissonnante d’environ 80cm. Elle se reconnaît à ses feuilles vert tendre, gaufrées,'
            'largement crénelées et dégageant une odeur citronnée lorsqu’on les froisse. Minuscules, les fleurs blanches s’avèrent peu visibles.',
        isSelected: false),
    Plant(
        plantId: 8,
        price: 46,
        category: 'Recommended',
        plantName: 'La valériane',
        size: 'Medium',
        rating: 4,
        humidity: 30,
        temperature: '21 - 25',
        imageURL: 'assets/images/plant-nine.png',
        isFavorated: false,
        decription:
            'La valériane est une vivace dont les tiges cannelées peuvent atteindre 2 m de haut. En été,'
            's’épanouissent des fleurs rose pâle à l’extrémité des hampes florales. Les feuilles sont fortement découpées, vert sombre et aromatiques.',
        isSelected: false),
    Plant(
        plantId: 9,
        price: 47,
        category: 'Recommended',
        plantName: 'La sarriette des montagnes',
        size: 'Medium',
        rating: 4.7,
        humidity: 36,
        temperature: '21 - 28',
        imageURL: 'assets/images/plant-ten.png',
        isFavorated: false,
        decription:
            'Sous-arbrisseaux habillés de petites feuilles sombres, persistantes et aromatiques, disparaissant sous une nuée de fleurs blanches au printemps et'
            'en été. Elle forme une touffe ligneuse de 30 à 40cm en tous sens.',
        isSelected: false),
    Plant(
        plantId: 10,
        price: 25,
        category: 'Recommended',
        plantName: 'Le romarin',
        size: 'Medium',
        rating: 4.7,
        humidity: 46,
        temperature: '21 - 25',
        imageURL: 'assets/images/plant-eleven.png',
        isFavorated: false,
        decription:
            'Le romarin est un arbrisseau toujours vert dont le feuillage persistant est aromatique. Sa floraison a lieu dès la fin de l’hiver avec une'
            'remontée en automne en région méditerranéenne, plutôt au printemps au nord de la Loire.',
        isSelected: false),
    Plant(
        plantId: 11,
        price: 46,
        category: 'Recommended',
        plantName: 'L’origan',
        size: 'Medium',
        rating: 4.7,
        humidity: 46,
        temperature: '21 - 25',
        imageURL: 'assets/images/plant-twelve.png',
        isFavorated: false,
        decription:
            'L’origan ou marjolaine sauvage est une plante vivace qui forme une touffe fortement aromatique d’environ 50cm en tous sens.'
            'L’été voit apparaître de jolies fleurs roses pourprées à l’extrémité des pousses. L’origan est parfaitement rustique et facile à cultiver.',
        isSelected: false),
    Plant(
        plantId: 12,
        price: 40,
        category: 'Recommended',
        plantName: 'La marjolaine',
        size: 'Medium',
        rating: 4.7,
        humidity: 46,
        temperature: '21 - 25',
        imageURL: 'assets/images/plant-thirteen.png',
        isFavorated: false,
        decription:
            'Haute d’environ 40cm, elle présente d’innombrables petites feuilles vert sombre, légèrement duveteuses.'
            'Elle ne fleurit généralement pas en culture mais dans son environnement naturel apparaissent de minuscules fleurs blanches.',
        isSelected: false),
    Plant(
        plantId: 13,
        price: 20,
        category: 'Recommended',
        plantName: 'Les plantains',
        size: 'Medium',
        rating: 4.7,
        humidity: 46,
        temperature: '21 - 25',
        imageURL: 'assets/images/plant-fourteen.png',
        isFavorated: false,
        decription:
            'Vivaces, ces deux plantains se distinguent par des rosettes basales de feuilles, étroites, érigées et côtelées chez le plantain lancéolé.'
            'Tandis que les feuilles sont larges, plates et plaquées au sol chez le grand plantain. L’un comme l’autre, la floraison se manifeste par des épis brunâtres.',
        isSelected: false),
    Plant(
        plantId: 14,
        price: 30,
        category: 'Recommended',
        plantName: 'Le millepertuis',
        size: 'Medium',
        rating: 4.7,
        humidity: 46,
        temperature: '21 - 25',
        imageURL: 'assets/images/plant-fifteen.png',
        isFavorated: false,
        decription:
            'Le millepertuis se caractérise par des tiges solides, rougeâtres dont l’extrémité ramifiée porte de nombreuses fleurs jaunes étoilées en été.'
            'Par transparence, les feuilles apparaissent criblées de trous qui sont des poches contenant des essences. Selon la richesse de la terre,'
            'la plante mesure de 30 à 80cm de haut.',
        isSelected: false),
  ];

  //Get the favorated items
  static List<Plant> getFavoritedPlants() {
    List<Plant> _travelList = Plant.plantList;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }

  //Get the cart items
  static List<Plant> addedToCartPlants() {
    List<Plant> _selectedPlants = Plant.plantList;
    return _selectedPlants
        .where((element) => element.isSelected == true)
        .toList();
  }
}
