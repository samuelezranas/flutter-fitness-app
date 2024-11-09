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
    train1img: 'assets/images/diamond_pushup.jpg',
    train2img: 'assets/images/decline_pushup.jpg',
    train3img: 'assets/images/widegrip_pushup.jpg',
    train1name: 'Diamond Push-Up',
    train2name: 'Decline Push-Up',
    train3name: 'Wide Grip Push-Up',
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
    train1img: 'assets/images/butterfly_situp.webp',
    train2img: 'assets/images/weighted_situp.webp',
    train3img: 'assets/images/v_sit_up.jpg',
    train1name: 'Butterfly Sit-Up',
    train2name: 'Weighted Sit-Up',
    train3name: 'V-Sit',
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
    train1img: 'assets/images/side_plank.jpg',
    train2img: 'assets/images/plank_with_arm_lift.jpg',
    train3img: 'assets/images/forearm_to_high.jpg',
    train1name: 'Side Plank',
    train2name: 'Plank with Arm/Leg Lift',
    train3name: 'Forearm-to-High Plank',

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
    train1img: 'assets/images/sumo_squat.jpg',
    train2img: 'assets/images/jump_squat.jpg',
    train3img: 'assets/images/bulgarian_split_squat.webp',
    train1name: 'Sumo Squat',
    train2name: 'Jump Squat',
    train3name: 'Bulgarian Split Squat',
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
    train1img: 'assets/images/reverse_lunges.jpg',
    train2img: 'assets/images/walking_lunges.avif',
    train3img: 'assets/images/curtsy_lunges.jpg',
    train1name: 'Reverse Lunge',
    train2name: 'Walking Lunges',
    train3name: 'Curtsy Lunge',

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
    train1img: 'assets/images/pushup_burpee.jpg',
    train2img: 'assets/images/tuck_jump_burpee.jpg',
    train3img: 'assets/images/mountain-climbers_burpee.jpg',
    train1name: 'Push-Up Burpee',
    train2name: 'Tuck Jump Burpee',
    train3name: 'Mountain Climber Burpee',
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
    train1img: 'assets/images/cross_body_mountain_climber.jpg',
    train2img: 'assets/images/slowmo_mountain_climbers.jpg',
    train3img: 'assets/images/spiderman_mountain_climbers.jpg',
    train1name: 'Cross-Body Mountain Climber',
    train2name: 'Slow Motion Mountain Climber',
    train3name: 'Spider Mountain Climber',
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
    train1img: 'assets/images/hanging_leg_raises.jpg',
    train2img: 'assets/images/scissors_leg_raises.jpg',
    train3img: 'assets/images/bent_knee_leg_raises.jpg',
    train1name: 'Hanging Leg Raise',
    train2name: 'Scissor Leg Raise',
    train3name: 'Bent-Knee Leg Raise',
  ),
];
