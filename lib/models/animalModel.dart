class AnimalsType {
 static List animalType = [
    "Mammals",
    "Birds",
    "Fish",
    "Reptiles",
    "Amphibians",
    "Invertebrates",
  ];
}

class Animal {
  int? id;
  String name;
  String description;
  String image;
  String type;

  Animal({
    this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.type,
  });

  factory Animal.fromMap(Map<String, dynamic> data) {
    return Animal(
        id: data['id'],
        name: data['name'],
        description: data['description'],
        image: data['image'],
        type: data['type']);
  }
}

List<Animal> allAnimals = <Animal>[
  Animal(
    name: "Lion",
    description:
        "The lion (Panthera leo) is a large cat of the genus Panthera native to Africa and India. It has a muscular.",
    image:
        "https://cdn.britannica.com/29/150929-050-547070A1/lion-Kenya-Masai-Mara-National-Reserve.jpg",
    type: "Mammals",
  ),
  Animal(
    name: "Dogs",
    description:
        "The dog or domestic dog is a domesticated descendant of the wolf, and is characterized by an upturning tail.",
    image:
        "https://www.princeton.edu/sites/default/files/styles/half_2x/public/images/2022/02/KOA_Nassau_2697x1517.jpg?itok=iQEwihUn",
    type: "Mammals",
  ),
  Animal(
    name: "Horse",
    description:
        "The horse is a domesticated, odd-toed, hoofed mammal. It belongs to the taxonomic family Equidae and is one of two extant subspecies of Equus ferus.",
    image:
        "https://i.pinimg.com/736x/13/a1/a9/13a1a9646837e34df8e033afd8b75758.jpg",
    type: "Mammals",
  ),
  Animal(
    name: "Panda",
    description:
        "The giant panda, also known as the panda bear  is a bear species endemic to China.",
    image:
        "https://media-cldnry.s-nbcnews.com/image/upload/newscms/2021_27/3489810/210709-pandas-mc-10262.JPG",
    type: "Mammals",
  ),
  Animal(
    name: "Raccoon",
    description:
        "A raccoon is any of seven species of nocturnal mammals characterized by bushy ringed tails.",
    image: "https://animalcorner.org/wp-content/uploads/2015/02/racoon.png",
    type: "Mammals",
  ),
  Animal(
    name: "Monkey",
    description:
        "Monkey is a common name that may refer to most mammals of the infraorder Simiiformes, also known as the simians. Traditionally,",
    image:
        "https://bsmedia.business-standard.com/_media/bs/img/article/2018-01/25/full/1516846187-1195.jpg?im=Resize,width=480",
    type: "Mammals",
  ),
  Animal(
    name: "Angelfish",
    description:
        "Pterophyllum is a small genus of freshwater fish from the family Cichlidae known to most aquarists as angelfish.",
    image:
        "https://www.itsafishthing.com/wp-content/uploads/2021/06/rsz_shutterstock_1698803005-2.jpg",
    type: "Fish",
  ),
  Animal(
    name: "Shark",
    description:
        "Sharks are a group of elasmobranch fish characterized by a cartilaginous skeleton, five to seven gill slits on the sides of the head",
    image:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/White_shark.jpg/800px-White_shark.jpg",
    type: "Fish",
  ),
  Animal(
    name: "Whale",
    description:
        "Whales are a widely distributed and diverse group of fully aquatic placental marine mammals.",
    image:
        "https://nationaltoday.com/wp-content/uploads/2021/10/world-whale-day.jpg",
    type: "Fish",
  ),
  Animal(
    name: "Eel",
    description:
        "Eels are ray-finned fish belonging to the order Anguilliformes, which consists of eight suborders.",
    image:
        "https://c.files.bbci.co.uk/16760/production/_107000029_tv036084412.jpg",
    type: "Fish",
  ),
  Animal(
    name: "Falcons",
    description:
        "Falcons are birds of prey in the genus Falco, which includes about 40 species. Falcons are widely distributed on all continents.",
    image: "https://cdn.britannica.com/07/1907-050-104504BF/kestrel.jpg",
    type: "Birds",
  ),
  Animal(
    name: "Penguins",
    description:
        "Penguins are a group of aquatic flightless birds. They live almost exclusively in the Southern Hemisphere",
    image:
        "https://storage.googleapis.com/oceanwide_web/media-dynamic/cache/widen_1600/media/default/0001/05/30627f237982b80399f5d2db0c8daeeea38a5950.jpeg",
    type: "Birds",
  ),
  Animal(
    name: "Ducks",
    description:
        "Duck is the common name for numerous species of waterfowl in the family Anatidae. Ducks are generally smaller.",
    image:
        "https://d.newsweek.com/en/full/2007912/ducks.jpg?w=790&f=21714db5ad0dd879b25dc3d87dcb2282",
    type: "Birds",
  ),
  Animal(
    name: "Blackbirds",
    description:
        "BThe common blackbird is a species of true thrush. It is also called the Eurasian blackbird, or simply the blackbird ",
    image:
        "https://www.woodlandtrust.org.uk/media/1319/blackbird-male-wtml-1084426-nature-photographers-ltd.jpg",
    type: "Birds",
  ),
  Animal(
    name: "Parrots",
    description:
        "Parrots, also known as psittacines, are birds of the roughly 398 species in 92 genera comprising the order Psittaciformes.",
    image:
        "https://vetmed.tamu.edu/news/wp-content/uploads/sites/9/2018/10/pettalk071218_400x500.jpg",
    type: "Birds",
  ),
  Animal(
    name: "Sparrows",
    description:
        "he name sparrow is most firmly attached to birds of the Old World family Passeridae, particularly to the house sparrow",
    image:
        "https://2.img-dpreview.com/files/p/TS560x560~forums/65781466/103d21caa03c4b3aac3a34deaf502df5",
    type: "Birds",
  ),
  Animal(
    name: "Frog",
    description:
        "A frog is any member of a diverse and largely carnivorous group of short-bodied.",
    image: "https://ichef.bbci.co.uk/images/ic/1920x1080/p09ttryr.jpg",
    type: "Amphibians",
  ),
  Animal(
    name: "Toad",
    description:
        "Toad is a common name for certain frogs, especially of the family Bufonidae, that are characterized by dry.",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXUIsdgo2hCRW24mKE3iAlT5w72q013faybDJWq0vMV5bnVGax1MQmmK_hcXwPpnt7sZk&usqp=CAU",
    type: "Amphibians",
  ),
  Animal(
    name: "Caecilian",
    description:
        "Caecilians are a group of limbless, vermiform or serpentine amphibians.",
    image:
        "https://upload.wikimedia.org/wikipedia/commons/8/8c/Caecilian.jpg?20060615215444",
    type: "Amphibians",
  ),
  Animal(
    name: "Bee",
    description:
        "Bees are winged insects closely related to wasps and ants, known for their role in pollination.",
    image:
        "https://images.newscientist.com/wp-content/uploads/2017/07/25204611/p8401619.jpg?crop=16:9,smart&width=1200&height=675&upscale=true",
    type: "Invertebrates",
  ),
  Animal(
    name: "Ant",
    description:
        "Ants are eusocial insects of the family Formicidae and, along with the related wasps and bees.",
    image:
        "https://frontline.thehindu.com/environment/wild-life/cvwrko/article38430910.ece/alternates/FREE_435/FL11pfWeaver-AntOecophylla-smaragdinaPhoto-by-R-Bhanumathi1",
    type: "Invertebrates",
  ),
  Animal(
    name: "Butterfly",
    description:
        "Butterflies are insects in the macrolepidopteran clade Rhopalocera from the order Lepidoptera.",
    image:
        "https://cff2.earth.com/uploads/2021/11/09170312/shutterstock_1920502829-scaled.jpg",
    type: "Invertebrates",
  ),
  Animal(
    name: "Snakes",
    description:
        "Snakes are elongated, limbless, carnivorous reptiles of the suborder Serpentes.",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeeOuGce0aTSbD0xnrv3nwx5p_1Vlconlrdw&usqp=CAU",
    type: "Reptiles",
  ),
  Animal(
    name: "Turtles",
    description:
        "Turtles are an order of reptiles known as Testudines, characterized by a shell developed mainly from their ribs.",
    image: "https://i.ytimg.com/vi/hblxPDdisbw/maxresdefault.jpg",
    type: "Reptiles",
  ),
];
