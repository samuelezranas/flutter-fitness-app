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
  String train1img;
  String train2img;
  String train3img;
  String train1name;
  String train2name;
  String train3name;

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
    required this.train1img,
    required this.train2img,
    required this.train3img,
    required this.train1name,
    required this.train2name,
    required this.train3name,
  });
}

var trainingModelList = [
  TrainingModel(
    name: 'Push Up',
    category: 'Strength',
    description:
        'Push-up adalah latihan kekuatan yang sangat efektif untuk memperkuat otot tubuh bagian atas dan inti.',
    basicRep: '5x',
    interRep: '10x',
    hardRep: '20x',
    basicSet: '3 set',
    interSet: '5 set',
    hardSet: '7 set',
    imageAsset: 'assets/images/pushupmany.webp',
    train1img: 'https://www.maxnrgpt.com.au/blog/wp-content/uploads/2010/07/incline-push-up-start.jpg',
    train2img: 'https://cdn.outsideonline.com/wp-content/uploads/2019/02/15/8-wide-b_0.jpg',
    train3img: 'https://www.maxnrgpt.com.au/blog/wp-content/uploads/2010/07/incline-push-up-start.jpg',
    train1name: 'Incline Push Up',
    train2name: 'Wide Hands Push Up',
    train3name: 'Incline Push Up',
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
    train1img: 'assets/images/pushupmany.webp',
    train2img: 'assets/images/pushupmany.webp',
    train3img: 'assets/images/pushupmany.webp',
    train1name: 'Incline Push Up',
    train2name: 'Incline Push Up',
    train3name: 'Incline Push Up',
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
    train1img: 'assets/images/pushupmany.webp',
    train2img: 'assets/images/pushupmany.webp',
    train3img: 'assets/images/pushupmany.webp',

    train1name: 'Incline Push Up',
    train2name: 'Incline Push Up',
    train3name: 'Incline Push Up',

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
    train1img: 'assets/images/pushupmany.webp',
    train2img: 'assets/images/pushupmany.webp',
    train3img: 'assets/images/pushupmany.webp',

    train1name: 'Incline Push Up',
    train2name: 'Incline Push Up',
    train3name: 'Incline Push Up',

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
    train1img: 'assets/images/pushupmany.webp',
    train2img: 'assets/images/pushupmany.webp',
    train3img: 'assets/images/pushupmany.webp',

    train1name: 'Incline Push Up',
    train2name: 'Incline Push Up',
    train3name: 'Incline Push Up',

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
    train1img: 'assets/images/pushupmany.webp',
    train2img: 'assets/images/pushupmany.webp',
    train3img: 'assets/images/pushupmany.webp',

    train1name: 'Incline Push Up',
    train2name: 'Incline Push Up',
    train3name: 'Incline Push Up',

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
    train1img: 'assets/images/pushupmany.webp',
    train2img: 'assets/images/pushupmany.webp',
    train3img: 'assets/images/pushupmany.webp',

    train1name: 'Incline Push Up',
    train2name: 'Incline Push Up',
    train3name: 'Incline Push Up',

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
    train1img: 'assets/images/pushupmany.webp',
    train2img: 'assets/images/pushupmany.webp',
    train3img: 'assets/images/pushupmany.webp',

    train1name: 'Incline Push Up',
    train2name: 'Incline Push Up',
    train3name: 'Incline Push Up',

  ),
];
