class TrainingModel {
  String name;
  String category;
  String description;
  String basicRep;
  String interRep;
  String hardRep;
  String basicSet;
  String interSet;
  String hardSet;
  String imageAsset;
  List<String> imageUrls;

  TrainingModel({
    required this.name,
    required this.category,
    required this.description,
    required this.basicRep,
    required this.interRep,
    required this.hardRep,
    required this.basicSet,
    required this.interSet,
    required this.hardSet,
    required this.imageAsset,
    required this.imageUrls,
  });
}

var trainingModelList = [
  TrainingModel(
    name: 'Push Up',
    category: 'Strength',
    description:
        'Push-up adalah latihan kekuatan yang sangat efektif untuk memperkuat otot tubuh bagian atas dan inti. Latihan ini menargetkan otot dada, triceps, dan bahu, serta membantu meningkatkan stabilitas otot inti.',
    basicRep: '5x',
    interRep: '10x',
    hardRep: '20x',
    basicSet: '3 set',
    interSet: '5 set',
    hardSet: '7 set',
    imageAsset: 'assets/images/pushupmany.webp',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'
    ],
  ),
  TrainingModel(
    name: 'Sit Up',
    category: 'Strength',
    description:
        'Sit-up adalah latihan kekuatan yang membantu memperkuat otot perut dan bagian inti tubuh.',
    basicRep: '5x',
    interRep: '10x',
    hardRep: '20x',
    basicSet: '3 set',
    interSet: '5 set',
    hardSet: '7 set',
    imageAsset: 'assets/images/situp-cool.webp',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-o/12/6b/63/0b/bosscha-observatory.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-p/0d/6a/88/9b/photo3jpg.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-o/11/3f/04/39/p-20171111-110220-largejpg.jpg',
    ],
  ),
  TrainingModel(
    name: 'Plank',
    category: 'Endurance',
    description:
        'Plank adalah latihan untuk memperkuat otot inti yang melibatkan stabilitas tubuh dalam posisi statis.',
    basicRep: '5x',
    interRep: '10x',
    hardRep: '20x',
    basicSet: '3 set',
    interSet: '5 set',
    hardSet: '7 set',
    imageAsset: 'assets/images/plank.webp',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-o/0d/c2/e7/e6/quotes-kota-bandung.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/17/f4/44/01/jalan-asia-afrika.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-s/0a/ef/36/e2/jalan-asia-afrika.jpg',
    ],
  ),
  TrainingModel(
    name: 'Squat',
    category: 'Strength',
    description:
        'Squat adalah latihan yang melibatkan otot-otot kaki, paha, dan pinggul, serta melatih keseimbangan tubuh.',
    basicRep: '5x',
    interRep: '10x',
    hardRep: '20x',
    basicSet: '3 set',
    interSet: '5 set',
    hardSet: '7 set',
    imageAsset: 'assets/images/squats.webp',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-o/15/01/d7/4b/p-20180510-153310-01.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/15/68/00/32/stone-garden-citatah.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-o/0d/a2/cb/05/stone-garden-citatah.jpg',
    ],
  ),
  TrainingModel(
    name: 'Lunges',
    category: 'Strength & Balance',
    description:
        'Lunges adalah latihan yang fokus pada otot kaki dan pinggul, serta meningkatkan keseimbangan.',
    basicRep: '5x',
    interRep: '10x',
    hardRep: '20x',
    basicSet: '3 set',
    interSet: '5 set',
    hardSet: '7 set',
    imageAsset: 'assets/images/lunges.webp',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-o/08/8b/87/50/bandung-movie-park.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-o/17/67/d5/53/img-20190505-114509-largejpg.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/09/73/33/05/taman-film-pasopati.jpg',
    ],
  ),
  TrainingModel(
    name: 'Burpee',
    category: 'Strength & Endurance',
    description:
        'Burpee adalah latihan kekuatan dan ketahanan yang menggabungkan gerakan squat, push-up, dan lompatan.',
    basicRep: '5x',
    interRep: '10x',
    hardRep: '20x',
    basicSet: '3 set',
    interSet: '5 set',
    hardSet: '7 set',
    imageAsset: 'assets/images/burpee.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-w/19/1c/8e/f7/geology-museum.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-o/11/a7/35/b7/geology-museum.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-s/1a/55/e0/dc/geology-museum.jpg',
    ],
  ),
  TrainingModel(
    name: 'Mountain Climber',
    category: 'Endurance',
    description:
        'Mountain climber adalah latihan yang melibatkan gerakan cepat untuk melatih kekuatan dan ketahanan otot.',
    basicRep: '5x',
    interRep: '10x',
    hardRep: '20x',
    basicSet: '3 set',
    interSet: '5 set',
    hardSet: '7 set',
    imageAsset: 'assets/images/mountain-climbers.webp',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-o/17/f9/ff/f8/floating-market-bandung.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-p/1a/86/d3/cd/20200103-125059-largejpg.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-p/19/ce/b4/9b/img20181224120857-largejpg.jpg',
    ],
  ),
  TrainingModel(
    name: 'Leg Raises',
    category: 'Strength',
    description:
        'Leg raises adalah latihan yang melatih otot perut bagian bawah dan meningkatkan kekuatan inti.',
    basicRep: '5x',
    interRep: '10x',
    hardRep: '20x',
    basicSet: '3 set',
    interSet: '5 set',
    hardSet: '7 set',
    imageAsset: 'assets/images/leg-raises.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-o/0b/6e/7c/ce/rocks-sticking-out-of.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-p/0b/35/30/14/white-crater.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-o/0a/8b/9a/79/2945-t00572-www-initempatwisat.jpg',
    ],
  ),
];
