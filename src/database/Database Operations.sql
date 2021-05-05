DROP DATABASE vacayplanner;
CREATE DATABASE vacayplanner;
USE vacayplanner;

CREATE TABLE users (
    UID int NOT NULL AUTO_INCREMENT,
    FirstName varchar(255) NOT NULL,
    LastName varchar(255),
    EmailAddress varchar(255),
    gender varchar(32),
    password varchar(32),
    dob DATE,
    contact VARCHAR(10),
    primary key(UID)
);


CREATE TABLE packages(
	PPID int NOT NULL,
	PackageName varchar(255) NOT NULL,
	description text,
	destination varchar(255) NOT NULL,
	cost int NOT NULL,
	duration varchar(32),
	hotels varchar(255),
	primary key(PPID)
);

CREATE TABLE activity (
	PPID int not null,
	activityname varchar(255),
	description TEXT,
	day int,
	foreign key(ppid) references packages(ppid)
);

CREATE TABLE destinations (
	DestName varchar(255) NOT NULL,
	baseprice int NOT NULL,
	hotel varchar(255),
	cost int NOT NULL,
	primary key(DestName)
);


CREATE TABLE custActivity (
	DestName varchar(255),
	ActivityName varchar(255),
	description TEXT,
	duration int,
	AcitivityCost int NOT NULL,
	primary key(ActivityName),
	foreign key(DestName) references destinations(DestName)
);

CREATE TABLE custPackages(
	CPID int NOT NULL,
	UID int NOT NULL,
	DestName varchar(255) NOT NULL,
	PackageName varchar(255) NOT NULL,
	startDate DATE,
	endDate DATE,
	adults int,
	children int,
	totalCost int NOT NULL,
	status varchar(32),
	primary key(CPID),
	foreign key(DestName) references destinations(DestName),
	foreign key(UID) references users(UID)
);


CREATE TABLE ActivityCache (
	UID int NOT NULL,
	DestName VARCHAR(255) NOT NULL,
	ActivityName VARCHAR(255) NOT NULL,
	day int,
	foreign key(DestName) references destinations(DestName),
	foreign key(UID) references users(UID),
	foreign key(ActivityName) references custActivity(ActivityName)
);

CREATE TABLE bookings (
	BID int NOT NULL,
	UID int NOT NULL,
	PID int not null,
	bookedOn DATE,
	adults int,
	children int,
	totalCost int NOT NULL,
	Primary key(BID)
);

CREATE TABLE bankaccounts (
	CardHolder VARCHAR(255) NOT NULL,
	CardNumber VARCHAR(255) NOT NULL,
	cvv int NOT NULL,
	brand VARCHAR(32) NOT NULL,
	expYear int NOT NULL,
	expMonth int NOT NULL
);

INSERT INTO packages VALUES(
1001,
"Dubai Holiday 3N - Marriot Aloft Deira Hotel Exclusive",
"Are you up for a short relaxing getaway with your family? We've got just the perfect place for you – Dubai. This 3-night holiday will let you and your loved ones experience the best that this marvelous city has to offer. From stately sky-high buildings to the serene turquoise waters, the city is truly a sight to behold. Revel in the comfort and hospitality in  Marriot Aloft Deira, a luxurious Four Star hotel, offers during your stay.",
"Dubai",
57357,
"3 Nights 4 Days",
"Marriott's Aloft City Centre Deira – MMT Special"
);

INSERT INTO activity VALUES(
1001,
"Arrival in Dubai",
"Enjoy the Private Transfer from Airport to hotel in Dubai. Spend the rest of the day at leisure",
1
);

INSERT INTO activity VALUES(
1001,
"Half Day Dubai City Tour, Lunch at Creek Harbour Cruise and Desert Safari (Shared Transfers)",
"Start the day by driving through Al Seef area, Dubai Museum (outside) and Gold Souq/Spice Souq. You get 15-mins photostop at Dubai Frame (from outside), Zabeel Palace and Jumeirah Beach. Further, drive through Palm Jumeirah Atlantis, Sheikh Zayed Road. Then, hop on to the 5 star Creek Harbour Lunch Cruise with Briyani packed lunch, water and recording music on-board. Your day finally ends with the tour to Desert Safari which includes sand dune bashing, traditional Arabic welcome drinks,camel ride, henna painting, falcon display, Tannoura dance show, Belly dance show,Fire Acrobatic dance and an International buffet dinner. The pickup time from the hotel for this activity is at 09:00 AM. The city tour timings are from 09:00 AM to 01:30 PM/02:00 PM, lunch cruise pickup time is from 02:00 PM/02:30 PM, and Desert Safari pickup time is from 03:00 PM to 03:30 PM. This 5 star category combo includes half-day Dubai city tour,lunch at Creek Harbour Cruise and Desert Safari, along with two-way shared transfers from the hotel.",
2
);

INSERT INTO activity VALUES(
1001,
"Dhow Creek Cruise with Dinner on Shared Transfer (4 Star Category)",
"Witness the glittering skyline of Dubai as you savour delicious Emirati delicacies andenjoy a 2-hour traditional Tanoura performance while on Dhow cruise offering perfectviews creek coastline of the latest waterfront attractions and charming traditional districts of Deira and Bur Dubai. This 4.5 hours activity includes cruise entry withdinner and two-way shared transfers from hotel to designated pier in Deira.Hotel pickup at 06:30 PM to 07:00 PM and drop off to the hotel at 11:00 PM. Operational on all days.",
3
);

INSERT INTO activity VALUES(
1001,
" Departure from Ras Al Khaimah",
"Private Transfer from Hotel in Dubai to Airport",
4
);

-- EXAMPLE OF POPULATED CODE

INSERT INTO packages VALUES(
1002,
"Dubai Holiday 4N - Super Saver",
"This amazing package takes you to Dubai, which is characterised by its glittering skyline, artificial islands, lavish hotels, swanky shopping malls and traditional souqs. Whether it is shopping that you want to do, culture you want to explore or sights you want to capture, you can do it all with this tour. The best part is the musical fountain show at The Dubai Mall and so is observing the cityscape from the 124th floor of Burj Khalifa.",
"Dubai",
45500,
"4 Nights 5 Days",
"Hampton by Hilton Dubai"
);

INSERT INTO activity VALUES(
1002,
"Arrival in Dubai",
"Enjoy the Private Transfer from Airport to hotel in Dubai. Spend the rest of the day at leisure",
1);

INSERT INTO activity VALUES(
1002,
"Desert Safari by 4X4 Vehicle with BBQ Dinner on Shared Transfer (4 Star Category)",
"Embark on an enchanting Arabian voyage and experience pure excitement as daring experts lead you along the magnificent desert dunes, one of the wildest roller coasters rides with splendid sunset views in the heart of the desert. Afterwards, proceed to a Bedouin desert camp, take an exhilarating quad bike ride, camel ride, dress up in traditional Arabic attire and get Arabic henna by local artists. Feast on a delicious Arabic dinner and witness some dazzling performances of belly dancing and Tanoura before heading back to your hotel. This experience includes Desert Safari, dinner and two-way shared transfers from the hotel. Hotel pickup time: 02:45 PM to 03:30 PM. The duration of the Safari will be 7 hours. Operational on all days.",
2);

INSERT INTO activity VALUES(
1002,
"Dubai Dolphinarium - Normal Seating Ticket with Creek Park Entry Pass with Shared Transfer",
"Timings: 0930 Hrs – 1000 hrs, Hotek Pick Up time : 0930 Hrs – 1000 hrs. Return pickup 1215 Hrs. Departures / Operational : All Day except sunday / Pick this tour and enjoy a remarkable dolphin and seal show at the Dubai Dolphinarium, located at the city’s beloved Dubai Creek. Settle in a comfortable auditorium and be prepared for an absolutely unforgettable ‘edutainment’ experience. Be captivated by beautiful bottlenose dolphins and seals displaying their incredible skills, performing acrobatics, dances, hoop-jumps, singing, juggling, playing ball, and even painting. Learn about the tender care and welfare, healthy diets and behavior of these gorgeous marine mammals. After a captivating experience, head back home with fond memories.",
3);

INSERT INTO activity VALUES(
1002,
"Nothing planned",
"Spend your time at leisure",
4);

INSERT INTO activity VALUES(
1002,
" Departure from Dubai",
"Private Transfer from Hotel in Dubai to Airport",
5);
INSERT INTO packages VALUES(
1003,
"Soulmate Special Bali with Seminyak Pool Villa - 6 Nights",
"The ‘Island of the Gods’ welcomes you on this holiday. Get a glimpse of Bali’s traditions with the Kintamani tour. The island’s art village, Batubulan, known for Barong dance, is a must-see. Situated inside Mount Batur’s caldera, Lake Batur is a prized wonder. Tirta Empul Holy Water Temple and the rock-cut cave temple, Goa Gajah, will be spiritually illuminating. Along with an exciting photo session at Tanah Lot temple, enjoy the pristine sunset view.",
"Bali",
104978,
"6 Nights 7 Days",
"Ramada Encore Bali Seminyak"
);

INSERT INTO activity VALUES(
1003,
"Arrival in Denpasar Bali",
"Enjoy the Private Transfer from Airport to hotel in Bali. Spend the rest of the day at leisure",
1);

INSERT INTO activity VALUES(
1003,
"Kintamani Tour with Private Transfers from South Bali hotels",
"Discover the natural beauty of Bali during this countryside experience. Around 9:00 AM, a private vehicle will pick you from the hotel's lobby and drive you towards Kintamani. Here, enjoy the panoramic views of the semi-active volcano, and the magnificent sight of Lake Batur with the smoky Agung Volcano in the background. Admire the scenic landscapes and click pictures of the perfect setting. En route, you will also make a stop at Celuk, the centre of gold and silver works and Kemenuh, the centre of woodcarvings. After an interesting and insightful day, you will be dropped back to your hotel.nnThis experience is inclusive of private transfers from and to your hotel in South Bali - Sanur, Kuta, Seminyak, Jimbaran, and Nusa Dua.",
2);

INSERT INTO activity VALUES(
1003,
"Balinese Spa (2 hours)",
"A trip to Bali is quite incomplete without trying the world-famous Balinese spa experience! This two-hour long session in Villa Jerami promises to be an exceptional experience of Bali's unmatchable spa services. nnYou will be picked from your hotel in a shared vehicle from your South Bali Hotel and brought to the luxurious Villa Jerami, situated at a superb location in Seminyak. Enjoy your warm welcome by the friendly staff and proceed with your selected spa experience. Feel your muscles relax and your tiredness seep away as a well-trained masseuse gives you a relaxing massage. After a body and soul pampering spa session, you will be dropped back to your hotel.nn For this experience, you can pick one from a range of specially curated treatments to revitalise your skin:n~Aroma Body Oil Massage (120 minutes): Foot bath, Balinese Massage with Oil, Floral Bath and Ginger Tea n~Tropical Fruit Spa (120 minutes): Foot bath, Balinese Massage with Oil, Candle Nut/Strawberry/Grapefruit body Scrub, Milk Polish, Natural Facial and Ginger Tea n~Jerami Signature (120 minutes): Foot bath, Balinese Massage, Body Scrub, Body Mask, Flower Bath, and Ginger Tean~Chocolate Stone Massage (120 minutes) - Foot bath, Stone Massage with Chocolate Oil, Chocolate Body Polish, Shower Bath, and Ginger Tea n~Chocolate Spa (120 minutes): Foot bath, Balinese Massage with Chocolate Oil, Chocolate Body Scrub, Chocolate Body Mask, Flower bath and Ginger TeannThis experience includes shared transfers from/to the hotel in South Bali area and a two-hour-long spa session in Villa Jerami.nDo note, this is an experience with a shared transfer and in case of any delays, the guest would miss the experience. There would be no refund possible in such a case",
3);

INSERT INTO activity VALUES(
1003,
"Watersports at Tanjung Benoa Beach(Banana Boat, Flying Fish & Jet Ski)",
"An ideal Bali holiday is incomplete without enjoying some fun water sports at the famous Tanjung Benoa beach, located in the serene Benoa peninsula. You will be picked up from your hotel around 10 AM in a shared vehicle. As you descend onto the beach, you could explore around a little and then begin your watersports adventure. With this experience you get to enjoy three different kinds of water sports activities - one Banana Boat ride, one Jet Ski ride and one Flying Fish ride. If you are feeling adventurous and wish to explore the ocean a little more, you could also select additional activities (on direct payment basis) such as parasailing, water skiing, snorkelling, scuba diving, wakeboard, fishing tour, glass bottom boat ride and a tour to Turtle Island. After a fun-filled water adventure, you will be dropped back to your hotel.nnThis experience includes shared transfers in a coach from and to the hotel, one banana boat ride, one flying fish ride, and one jet ski ride. The duration of this experience will be around 4 hours.nnDo note, this is an experience with a shared transfer and in case of any delays, the guest would miss the experience. There would be no refund possible in such a case.",
4);

INSERT INTO activity VALUES(
1003,
"Nothing planned",
"Spend your time at leisure",
5);

INSERT INTO activity VALUES(
1003,
"Sunset at Uluwatu",
"Bali is a beautiful island destination boasting of ample picturesque islands and green landscapes. One of these picturesque locations is home to the temple of Uluwatu and catching a sunset there will be one of the most beautiful experiences that you will ever have in Bali. You will be picked up from your hotel around 4 PM for this two-hour long experience. Built on the top of a cliff about at 825 feet high, Uluwatu Temple offers panoramic views of the vast blue ocean. While witnessing the sunset, you will get a lot of opportunities to capture the surreal beauty in your camera. A stunning view of the temple with the background of a colour changing sky will surely be an unforgettable experience.nnThis experience is inclusive of private transfers from and to the hotel and the duration of the experience will be around 3 hours.",
6);

INSERT INTO activity VALUES(
1003,
"Departure from Bali",
"Private Transfer from Hotel in Bali to Airport",
7);

INSERT INTO packages VALUES(
1004,
"Discover Bali",
"With this 6-night holiday in Bali, the ‘Island of the Gods’, enjoy the best of what it offers. The pristine surroundings of Nusa Penida Island near Bali are a visual treat and a snorkelling haven. Here, the thrilling banana boat and jet ski rides will pump up your adrenaline to the fullest. In Bali, the mesmerising Tegenungan Waterfall surrounded by verdant landscape is extremely calming. The spectacular sight of Lake Batur inside the caldera of Mount Batur also awaits you.",
"Bali",
101436,
"6 Nights 7 Days",
"Ramada Encore Bali Seminyak"
);

INSERT INTO activity VALUES(
1004,
"Arrival in Denpasar Bali",
"Enjoy the Private Transfer from Airport to hotel in Bali. Spend the rest of the day at leisure",
1);

INSERT INTO activity VALUES(
1004,
"Nusa Penida Island Explorer - West Island Tour with Snorkelling ",
"Discover the exotic beauty of the western side of Nusa Penida island on a full-day tour! You will be picked up from your South Bali hotel in a shared vehicle and brought to the harbour to board the Fast Boat to Nusa Penida. Enjoy a short (approx 30min) ride through turquoise waters from Bali to Nusa Penida, where you will be met by your driver-guide upon arrival. nnSip on a welcome drink (orange juice/mineral water) as you board your air-conditioned vehicle for a tour around Nusa Penida island. Start your exploration of this picturesque island with Kelingking Cliff. This Instagram-famous cliff offers the most stunning views of crystal clear water crashing upon a beach below you. Due to the cliff's shape, which resembles a Tyrannosaurus Rex, this place is also known as T-Rex Point! After getting some great pictures here, continue towards Broken Beach. This is a calm cove of clear blue water with an incredible rock arch wrapped around it. A selfie here is quite the done thing! From Broken Beach, continue towards Angel's Billabong, a tidal pool with crystal clear waters cascading into the sea. With its unique landscapes and views of manta rays swimming nearby, Angel's Billabong is a very popular place to visit in Nusa Penida. The last spot on your island tour is Crystal Bay, a gorgeous cove with a fine sandy beach. Boasting a beautiful white sand beach and dotted with coconut trees, this turquoise colored bay is a slice of paradise. Those interested in snorkelling can indulge their wish here.nnEnjoy a delicious Balinese lunch at a local restaurant before returning to the harbour to board the Fast Boat back to Bali. Upon disembarking in Bali, you will be picked up in a shared vehicle and transferred back to your hotel. nnThe tour includes return transfers from South Bali hotels (Kuta, Sanur, Nusa Dua, Seminyak) in a shared vehicle, return tickets on the fast boat to Nusa Penida and back, welcome drink (orange juice/mineral water), transportation by shared air-conditioned vehicle on Nusa Penida, lunch at a local restaurant, snorkelling at one spot, services of a driver-guide, equipment and insurance.",
2);

INSERT INTO activity VALUES(
1004,
"I AM Bali - 3D Interactive Art Museum Bali ",
"You might not be an art enthusiast, but you will surely love the exhibits at I AM Bali - a unique 3D Interactive Art Museum, offering fascinating visuals and educational experience. Located on the ground floor of the Bajra Sandhi Museum in Puputan Square, the museum features more than 120 art pieces. You will be amazed by the vast collection of fun and interactive art, based on agriculture, science, cartoons, etc. Click some unique pictures for your Instagram feed and make special memories on a visit to the fantastic I AM Bali - 3D Interactive Art Museum.nnThis activity only includes entry tickets to I AM Bali - 3D Interactive Art Museum. Transfers to and from the museum are not included",
3);

INSERT INTO activity VALUES(
1004,
"Bali Swing",
"Feel the thrill with this exciting experience as you swing high in the air. See a magnificent view of rice fields, river valleys and dense forests from the famous Bali Swing. Get picked up in a private vehicle from your hotel to reach the Alas Harum Swing in Ubud's Tegalalang. A ride on the Bali Swing is one of the most popular ways in Bali to view the famous Tegalalang Rice Terraces. Once here, meet the staff and learn about the safety instructions to follow. Next, enjoy swinging into the air and get some incredible views. Don't forget to get your picture taken! nnThe experience is inclusive of Bali Swing Entry Ticket and private return transfers from and to your hotel.",
4);

INSERT INTO activity VALUES(
1004,
"Nothing planned",
"Spend your time at leisure",
5);

INSERT INTO activity VALUES(
1004,
"Guided Tanah Lot Tour at Sunset",
"Take in the history and serene ambience of Tanah Lot Temple on this guided tour. Perched on a rocky outcrop amidst the crashing waves, Tanah Lot is home to the pilgrimage temple of Pura Tanah Lot. Be prepared to get enthralled by the history of the temple as the guide narrates it to you. Marvel at the minute traditional architecture of the temple, complete with intricate designs, against the backdrop of the sun gliding below the horizon. The sight is a photographers delight, so it is suggested that you carry your camera along. After watching the sunset, you will be dropped back to your hotel.nnThis tour includes guide services and private return transfers from your accommodation.",
6);

INSERT INTO activity VALUES(
1004,
"Departure from Bali",
"Private Transfer from Hotel in Bali to Airport",
7);

INSERT INTO packages VALUES(
1005,
"Singapore Holiday 6 Nights - Super Saver",
"Singapore is an idyllic holiday destination to spend a wonderful vacation with your family. With this tour package, enjoy theme based fun rides at Universal Studios, surround yourself with lush greenery on Sentosa island and discover the famous landmarks on a city tour. You will also get ample leisure time, during which you could explore places of your choice or just simply indulge in shopping. Customise this package by adding more activities and explore Singapore the way you want.",
"Singapore",
87237,
"6 Nights 7 Days",
"J8 Hotel"
);

INSERT INTO activity VALUES(
1005,
"Arrival in Singapore",
"Enjoy the Private Transfer from Airport to hotel in Singapore. Spend the rest of the day at leisure",
1);

INSERT INTO activity VALUES(
1005,
"AJ Hackett Sentosa Skybridge",
"The AJ Hackett Sentosa Skybridge was created to allow people of all ages to challenge and overcome that age-old fear of heights that causes everyone to get vertigo. The Skybridge crosses the two towers at 47m above the ground. It allows customers to go out on an exposed bridge that is safe enough for everybody to walk on, eliminating the need for a harnessing system. There are see-through sections that can be a good challenge for you and your companions!",
2);

INSERT INTO activity VALUES(
1005,
"River Safari with Boat Ride",
"Take a boat ride into the wild and experience the adventurous River Safari of the Singapore zoo. The River Safari is both a river-themed zoo and aquarium. You will be picked up from your hotel and taken to the venue to enjoy the exhilarating experience. Start with the Giant Panda Forest where you will meet the Giant Pandas, move on to witness the Once Upon a River Show and get an opportunity for an up-close encounter with Pelicans, Beavers, and Capybaras. Continue your safari as you sail into the Wild Amazonia and witness animals such as the Maned Wolf and Jaguar. Proceed to Squirrel Monkey Forest to see beautiful tropical aviaries and the Amazon Flooded Forest to watch the huge manatees swim serenely in their huge aquariums. As your River Safari ends, prepare yourself for the next exciting Night Safari where you witness an animal kingdom of nocturnal creatures roaming freely in their natural habitat. Witness the fiery Thumbuakar Tribal Performance which will thrill your senses and leave you awe-struck with the performers? fire-eating skills. Next, you can explore the wild nightlife on a guided Tram Safari Adventure to view exotic animals such as the Griffon Vulture, Wildebeest, Gazelle, Asiatic Lion, Fishing Cat etc. End your tour with a mesmerizing Creatures of the Night Show, which will give you a glimpse into the unique abilities of the mystical creatures of the night. As your adventurous journey ends, you will be dropped off to your place of stay.nnPlease note, for this activity to be booked, a minimum of 4 people are needed.nnThis activity includes transfers from and to the hotel on shared basis and Entry Tickets to River Safari and Night Safari. The maximum waiting time is only 5 minutes from the scheduled pick-up time. In case of any delay, the guest would miss the activity and would not receive any refund. ",
3);

INSERT INTO activity VALUES(
1005,
"LEGOLAND theme Park ",
"Legoland Malaysia is a one-stop destination which promises fun for everyone. Please connect with your MakeMytrip agent to add Malaysia Visa & transfer in this package. As This activity is without Malaysia Visa & transfer. Enjoy this 8 hours of fun-filled experience at an amazing world constructed entirely out of Lego bricks. The park features seven themed areas of attractions for all age groups of visitors, such as The Beginning, Lego Technic, Lego Kingdoms, Imagination, Lego City, Land of Adventure and Miniland. From Lego experiment centers to rollercoasters, it will be a day-long voyage of discovery for you and your family, offering something to everyone. The highlight of the place is Miniland, where Asian landmarks have been recreated using more than 30 million Lego bricks. It is an interactive world, where people, trains, and airplanes come to life only at the touch of a button. You could also explore the Legoland Water Park which includes 20 slides, pools, and river, with 70 models built by Lego experts. This experience is Exclusive of Legoland tour with return transfer from and to the hotel. The duration of the experience would be around 8 hours. To add Malaysia Visa & Transfer in this package, Please connect with yout MakeMyTrip agent.",
4);

INSERT INTO activity VALUES(
1005,
"Half Day City Tour with Flyer",
"We begin our journey from Suntec City to see the Fountain of Wealth before continuing towards the Padang area, followed by a stop at the Merlion Park where you can take beautiful pictures with the Singapore icon. Other prominent attractions in that area includes the picturesque Fullerton Hotel, Esplanade Theatres on the Bay, Singapore Flyer, Marina Bay Sands Hotel and the Helix Bridge. nnA section of the tour will also bring you to Chinatown to see the Thian Hock Keng Temple, one of the Singapores oldest and most important temple of the Hokkien people in the country. Next, we will explore Little India for some cultural sights and sounds. The last leg of the tour will bring you to Faber Peak Singapore Mount Faber, Singapores iconic hilltop destination to catch a fascinating view of the city skyline. Last stop, visit the Jewellery Wholesale factory.nThe tour includes transfers from and to the hotel on a shared basis in a coach (seat-in-coach). The duration of the tour would be 3.5 hours. The maximum waiting time is only 5 minutes from the scheduled pick-up time.nnDo note, this is a tour with a shared transfer and in case of any delays, the guest would miss the tour. There would be no refund possible in such a case. Will Visit Singapore Flyer",
5);

INSERT INTO activity VALUES(
1005,
"BUNGY JUMP",
"Singapore's latest top attraction is one of the best things to do in Sentosa, giving everyone their dose of adventure and adrenaline right on Siloso Beach, 47m up above!",
6);

INSERT INTO activity VALUES(
1005,
"Departure from Singapore",
"Private Transfer from Hotel in Singapore to Airport",
7);

INSERT INTO packages VALUES(
1006,
"A Short Break to Singapore",
"Enjoy a short yet sweet getaway to Singapore with this delightful holiday package. Tour the stunning city of Singapore and its marvelous attractions. Take selfies with the splendid statue of Merlion, visit the beautiful Gardens by the Bay, and explore the streets of China Town decorated with vibrant paper lanterns at every corner. Climb up the Mount Faber and enjoy stunning views of the Singapore city from the top. This holiday have a great time with your friends and family in Singapore.",
"Singapore",
26607,
"3 Nights 4 Days",
"J8 Hotel"
);

INSERT INTO activity VALUES(
1006,
"Arrival in Singapore",
"Enjoy the Private Transfer from Airport to hotel in Singapore. Spend the rest of the day at leisure",
1);

INSERT INTO activity VALUES(
1006,
"Half Day City Tour of Singapore",
"We begin our journey from Suntec City to see the Fountain of Wealth before continuing towards the Padang area, followed by a stop at the Merlion Park where you can take beautiful pictures with the Singapore icon. Other prominent attractions in that area includes the picturesque Fullerton Hotel, Esplanade Theatres on the Bay, Singapore Flyer, Marina Bay Sands Hotel and the Helix Bridge. nnA section of the tour will also bring you to Chinatown to see the Thian Hock Keng Temple, one of the Singapores oldest and most important temple of the Hokkien people in the country. Next, we will explore Little India for some cultural sights and sounds. The last leg of the tour will bring you to Faber Peak Singapore Mount Faber, Singapores iconic hilltop destination to catch a fascinating view of the city skyline. Last stop, visit the Jewellery Wholesale factory.nThe tour includes transfers from and to the hotel on a shared basis in a coach (seat-in-coach). The duration of the tour would be 3.5 hours. The maximum waiting time is only 5 minutes from the scheduled pick-up time.nnDo note, this is a tour with a shared transfer and in case of any delays, the guest would miss the tour. There would be no refund possible in such a case.",
2);

INSERT INTO activity VALUES(
1006,
"Gardens by the Bay with 1-way",
"Explore one of the top indoor gardens in the world, Gardens by the Bay. The garden is home to 500,000 plants from 2200 species. You will be picked up from your hotel around 9:30 am and taken to visit this awe-inspiring paradise of nature. Step into the Flower Dome where you can witness an enchanting world blooming with a wide variety of vibrant flowers and exotic plants, from thousand-year-old olive trees to peculiar Baobabs. Next, enter the mysterious Cloud Forest which boasts of the world?s tallest indoor waterfall cascading down from a height of 30-metres. As you explore further, make your way through the mist covered Cloud Walk and Treetop Walk and feel yourself amidst the clouds.nnThis activity includes a one-way transfer on a shared basis and Entry Ticket. The duration of the tour would be 3.5 hours. The maximum waiting time is only 5 minutes from the scheduled pick-up time. nnDo note, this is a tour with a shared transfer and in case of any delays, the guest would miss the tour. There would be no refund possible in such a case.",
3);

INSERT INTO activity VALUES(
1006,
"Departure from Singapore",
"Private Transfer from Hotel in Singapore to Airport",
4);

INSERT INTO packages VALUES(
1007,
"Bandos Vacation",
"Your loved ones will certainly enjoy this exciting vacation in the lush tropical landscape of Maldives. Better known as the Island of Hospitality, Bandos offers a peaceful escape for people of all ages. Surrounded by the Indian Ocean and secluded white sand beaches, this plush contemporary resort offers many facilities that you can enjoy on this holiday. Snorkeling in the clear blue waters is one activity here that you don’t want to miss. ",
"Maldives",
60464,
"4 Nights 5 Days",
"Bandos Maldives"
);

INSERT INTO activity VALUES(
1007,
"Arrival in Maldives",
"Enjoy the Private Transfer from Airport to hotel in Maldives. Spend the rest of the day at leisure",
1);

INSERT INTO activity VALUES(
1007,
"Snorkeling excursion at Adaaran Hudhuranfushi",
"Snorkeling excursion at Adaaran Hudhuranfushi once during the stay at the resort including . Day and Timings will be reconfirmed by the resort during the stay",
2);

INSERT INTO activity VALUES(
1007,
"Nothing planned",
"Spend your time at leisure",
3);

INSERT INTO activity VALUES(
1007,
"Aromatherapy Massage in bandos",
"Aromatherapy massage is a valuable relaxation technique for reducing anxiety and stress, and beneficial to the immune system. It is a holistic practice of using aromatic essential oils to evoke a pleasurable mood, remove negative energy and promote physical and mental revitalization",
4);

INSERT INTO activity VALUES(
1007,
"Departure from Maldives",
"Private Transfer from Hotel in Maldives to Airport",
5);

INSERT INTO packages VALUES(
1008,
"Turquoise Hulhulmale Island Vacation",
"Escape to absolute serenity with your loved ones on this vacation to the Maldives, with a stay at Hulhulmale Island Hotel. Enjoy your stay at the breezy villa with beautiful ocean views all around it. Relish the tropical beauty of pure white beaches, sparkling lagoons and the magical marine life during your vacation. Make the most of your free time by indulging in relaxing spa therapy. When in the Maldives, spend your holidays in ecstasy and return home with a bundle of cherishable memories.",
"Maldives",
44684,
"3 Nights 4 Days",
"Turquoise Residence"
);

INSERT INTO activity VALUES(
1008,
"Arrival in Maldives",
"Enjoy the Private Transfer from Airport to hotel in Maldives. Spend the rest of the day at leisure",
1);

INSERT INTO activity VALUES(
1008,
"Taj Exotica on a Speedboat",
"Arrival transfers from the Velana International Airport to Taj Exotica on a shared basis by a speedboat. The approximate time of commute is upto 1 hour. You can avail this service 24 Hours a day.",
2);

INSERT INTO activity VALUES(
1008,
"Half Day Adventure Snorkeling at Arena Beach",
"The adventure to the sandbank starts with a speedboat ride, snorkeling at 3 different points and a Dolphin Cruise. While snorkeling, witness unbelievably beautiful reefs, an abundance of marine life, Manta rays, turtles and even sharks maybe the highlight of the trip.Guest are served with packed lunch along with bottled drink on the sandbank. It is a guided excursion.",
3);

INSERT INTO activity VALUES(
1008,
"Departure from Maldives",
"Private Transfer from Hotel in Maldives to Airport",
4);

-- DESTINATION 1

INSERT INTO destinations VALUES(
	"Las Vegas",
	35788,
	"Mandalay Bay Resort & Casino",
	9544
);

-- ACTIVITY 1

INSERT INTO custActivity VALUES(
	"Las Vegas",
	"Virtual Reality Combat Arena",
	"Literally run full speed while playing the greatest Virtual Reality games on the greatest VR platform in America! Many games to chose from on site including battlefield combat with Elite Force, survive words of zombies in Dead Zone, chase pirates and treasure in BlackBeard and more.",
	2,
	1332
);

-- ACTIVITY 2

INSERT INTO custActivity VALUES(
	"Las Vegas",
	"Stratosphere Tower Observation Deck Ticket",
	"With your ticket, head up to the 1,149-foot Observation Deck, the second-tallest freestanding observation tower in the western hemisphere. Once you have made your way up more than 100 flights in the high-speed elevator, you can check out both the indoor and outdoor decks. The indoor deck features angled windows and air-conditioning while the outdoor deck allows you scan the city through viewfinders or take a walk around the tower. This is where you will get the most unobstructed views of Las Vegas Valley below you.",
	4,
	1732
);

-- ACTIVITY 3

INSERT INTO custActivity VALUES(
	"Las Vegas",
	"Fun City Scavenger Hunt in Las Vegas by Operation City Quest",
	"Explore Las Vegas with Operation City Quest! Using our app and your friendly remote host, you'll be given a checklist of exciting challenges to complete and objects to find around Madison. For everything you complete, the host will give you points. Your host can also supply additional challenges and help you if you need it! Your host will cheer you on and give hints and tips as well. The goal of your Operation City Quest in Las Vegas is to get as many points as you can and hopefully reach the #1 spot in the rankings.",
	2,
	723
);

-- ACTIVITY 4

INSERT INTO custActivity VALUES(
	"Las Vegas",
	"Day Trip to Laughlin, Nevada from Las Vegas",
	"Go through the Eldorado Valley and the historic mining town of Searchlight. Climb over 5,000 feet (1524 meters) in elevation before your motor coach descends 4,500 feet (1371 meters) into the Mohave Valley. Your drivers will provide vivid narration along the way. Explore Laughlin which is nestled on the banks of the Colorado River. This resort destination boasts abundant golf courses and spas, year round near-perfect weather and even a wedding chapel or two. Don't forget the casinos! Try your luck - you may come out of this inexpensive trip ahead of the game!",
	9,
	1036
);

-- ACTIVITY 5

INSERT INTO custActivity VALUES(
	"Las Vegas",
	"Lake Las Vegas 2-Hour Kayak Rental",
	"2 Hour Kayak Rental",
	2,
	2429
);

-- ACTIVITY 6

INSERT INTO custActivity VALUES(
	"Las Vegas",
	"Las Vegas Bar Hunt - Freewheelin' Down Fremont St",
	"Prepare for a night out like never before with a Las Vegas Bar Hunt! Let’s Roam is putting a new spin on the old bar crawl. Download the Let’s Roam scavenger hunt app, grab your friends, and hit the town. The Let’s Roam Las Vegas Bar Hunt is a fun activity for small groups, team builders, date night or even a birthday or bachelorette party. Whether you’re a local or just visiting, this is the best way to explore the hottest spots in town. Complete exciting photo and video challenges at the as you make your way through pubs, clubs, and dives to see who will be crowned the Bar Hunt Champion!",
	2,
	2147
);

-- ACTIVITY 7

INSERT INTO custActivity VALUES(
	"Las Vegas",
	"Party Bus Nightclub Crawl",
	"This definitely isn’t your average evening out on the town. When you join this Las Vegas nightclub crawl, you can count on having a VIP party experience.

A dedicated professional guide will meet you and your fellow partiers at the first venue, an always-packed nighttime hotspot – but you won’t be waiting outside with the massive crowds. You’ll be ushered right inside, without paying a cover charge, and your host will treat you to exclusive drink specials.

As the nightlife tour continues, you’ll hit three more of the most exciting venues in Sin City – the best party hotspots, clubs on everyone’s bucket list. And at every stop, you’ll enjoy instant VIP entry, with no lines and no covers, as well as big savings on cocktails. Plus, you’ll have a dedicated pro party guide, always ready to amp up the fun.

But wait, there’s more! This nightclub crawl includes luxury transportation – you’ll get to cruise the Vegas Strip twice, riding in style aboard our posh party bus. You can relax in plush comfort or get up and dance, taking a turn on the stripper poles. Either way, you’ll delight in the complimentary beverages!

If you want to party like a boss without paying an over-the-top price, this Las Vegas nightclub crawl won’t disappoint. Book your tickets now!",
	6,
	2203	
);

-- ACTIVITY 8

INSERT INTO custActivity VALUES(
	"Las Vegas",
	"Las Vegas Strip Run",
	"The Las Vegas Strip is probably the most iconic symbol in all of Las Vegas and most of the time it is seen by car on the way from point A to point B. A lot of the character of the Strip can be missed this way however, which makes this a great place to take in on your next Run/Walk.

Las Vegas Strip Run Tour begins and ends centrally on the Las Vegas Strip. After a short warm up / stretch you're off and running. Your running tour is a 4.2 mile run and is designed for all levels of runners, from beginners to advanced. Your guide will describe points of interest as well as stop and take pictures along the way. 

Many sights can be seen on this run and it will give you a good workout with climbing stairs on the side street crossovers to sprinting to beat the lights.

Depending on what time of year you run, you can get cooled off periodically by misters spraying a fog of mist on you along the the way. So leave your water bottle at home but make sure you bring your camera to take pictures of some interesting scenery.",
	4,
	2499
);

-- ACTIVITY 9

INSERT INTO custActivity VALUES(
	"Las Vegas",
	"Axe Throwing Experience in Las Vegas",
	"After arriving at the local facility, check-in with the staff and then meet your trainer who will go over a safety briefing before taking you to your designated lanes. 

From there, you'll learn four basic throws and practice until you're comfortable.  Next the trainer will teach you or your party the different games to create come competition among everyone.  After your choice of session your are more than welcome to take pictures around the facility before leaving.",
	2,
	1648
);

-- ACTIVITY 10

INSERT INTO custActivity VALUES(
	"Las Vegas",
	"Mike Hammer Comedy Magic Show",
	"Part magician, part comedian, Mike Hammer takes audience interaction to the limit in this fast-paced 70-minute show. Blending cutting wit with legitimately stunning magic, anything can and frequently does happen. From swallowing razorblades to reading your mind, the show builds in complexity, culminating in the Pick Pocket Booth of Solitude, a masterful combination of all things Mike Hammer.

This family-friendly show will have you on the edge of your seat with laughter. This award-winning sleight-of-hand master is sure to grab your attention. See why the Las Vegas Review Journal says You may have seen other magicians, but Hammer gives it the extra dimension.",
	1,
	2040
);

-- DESTINATION 2

INSERT INTO destinations VALUES(
	"Greece",
	41173,
	"Centrotel Hotel",
	2535
);

-- ACTIVITY 1

INSERT INTO custActivity VALUES(
	"Greece",
	"Dance with the Greeks",
	"This entertaining evening will start with a pick up from your hotel, where we you will drive you to the Plaka area. We take a brief walk through Plaka, the oldest part of Athens under the Acropolis.
We reach a traditional place (Rigas or Kalokairinos Restaurants). Both venues combines Greek cuisine and entertainment and our ensemble of folk dancers will perform the most popular Greek dances while you try delicious Greek food, with 3-Course Meal and wine, a night with a full and amazing experience, not to be missed!
",
	5,
	989
);

-- ACTIVITY 2

INSERT INTO custActivity VALUES(
	"Greece",
	"Athens by Night Food Tour & Wine Tasting",
	"Are you looking for an extraordinary culinary experience to tease your senses? Follow our foodie-expert guide on a night quest to discover Athens’ nightlife, and experience exquisite Athenian fine dining. Enjoy the best views of Athens after dusk and explore sophisticated eateries to devour the finest of authentic Greek cuisine. And our topping to end the night?",
	4,
	799
);

-- ACTIVITY 3

INSERT INTO custActivity VALUES(
	"Greece",
	"National Garden Segway Tour",
	"Explore ancient and modern Athens in an easy and fun segway tour that allows you visit the most important sites of the city, followed by a pleasant ride inside the National Garden of Athens.

The unique National Garden Tour is the perfect way to explore that part of the city where Antiquity meets the Modern Times. From the Temple of Zeus, the biggest ancient temple of the city, where the lighting of the Winter Olympic Flame takes place, to the first modern Olympic Stadium, the Kallimarmaron – “The beautifully marbled stadium”. Visit the landmarks of the city like Hadrian’s Arch, the gate to the city of Athens, as well as the Neoclassical jewels of the city, like the Zappeion Megaron, the first modern Olympic Village. Learn more about the political life of Greece with visits to the Presidential Mansion, once the Crown Prince’s Palace and the building of the Hellenic Parliament, the former royal palace of Greece, where you can also watch the ceremonial change of the Presidential Guards’ shift. And of course, don’t miss out on all the fun riding inside the National – once royal – Garden of Athens, one of the biggest and most spectacular parks in Europe.

The tour includes visits to the Temple of Ζeus, Hadrian's Arch, the Zappeion Mansion, the Panathinaikon Olympic Stadium, the Presidential Mansion, the Parliament's House, the National Gardens and the Roman Baths.",
	24,
	5214
);

-- ACTIVITY 4

INSERT INTO custActivity VALUES(
	"Greece",
	"Highlights of Athens and New Acropolis Museum Walking Tour",
	"The tour begins inside your hotel lobby where your guide will explain to you the paths of this tour. You will then be taken to the start point to begin your walking tour of Athens. Begin at the House of the Greek parliament and the Monument to the Unknown Soldier and watch the changing of the guards. Your tour then continues towards the National Gardens passing by the Panathenaic Stadium and on to the beautiful neoclassical Zappeion Hall, in front of which tower the surviving columns of the Temple of Zeus and Hadrian's Arch, both of which you will have an opportunity to visit. From there you enter the famous Plaka district where you see the portrait of Melina Merkouri. After we head towards the beautiful pedestrian walk way of Dionyssiou Areopagitou, passing by the Odeon of Herodes Atticus until we reach Areopagus Hill where we will begin our ascent while taking in the spectacular views of the city below.
Your guide will give you a detailed explanation into the glorious monuments of the Acropolis such as the Parthenon, Erechtheion, Propylaea, Nike Temple and the surrounding monuments (such as Temple of Hephaestus, Philopappos Hill, Observatory, Pnyx Hill and Ancient Agora).Your tour will end at the New Acropolis Museum, a must see, for anybody visiting the city and the best way to complete your city tour of Athens, with its 4,000 artefacts on display and excavations visible under stunning glass floors.",
	5,
	4065
);

-- ACTIVITY 5

INSERT INTO custActivity VALUES(
	"Greece",
	"Dinner in the Sky",
	"Dinner in the Sky is a multi-awarded extraordinary culinary proposal that welcomes 22 guests along with our Chefs who prepare a 6-course menu, which is served at 40 meters up in the sky, offering a once in a lifetime experience.
Dinner in the Sky takes you to heaven, while the nightlife of Athens “awakens”. As the table slowly rotates you get views ranging from the sculpturally lit Acropolis, the surrounding mountains, the sea and of course the Athenian cityscape.

Choose between the Sunset Dinner or the Starlit Acropolis Dinner invite your friends, loved ones or colleagues to a special dinner and spice up your nights in Athens with a combination of exceptional food and breathtaking views.

Dinner in the sky is also the “foodies’ heaven”! The menu consists of 6 dishes, which combine the Greek tradition with modern culinary inspiration. The menu is accompanied by delicious Greek wines, which are well-known for their superior taste and quality.

Whether you are a local or visiting Greece for business, leisure or to celebrate your honeymoon, Dinner in the Sky is certainly one of the best things to do in Athens and a memorable experience of a lifetime!",
	2,
	12648
);

-- ACTIVITY 6

INSERT INTO custActivity VALUES(
	"Greece",
	"Athens for Foodies - A Greek Gastronomy Tour",
	"What better way to explore Athens than eating your way through it? With an in-the-know foodie guide, you’ll enjoy 15 (!) tastings of the Greek cuisine as you walk through the non-touristy neighborhoods of Athens, to meet vendors and learn about traditional Greek recipes. From crunchy phyllo pies to cold cuts, and from stuffed tomatoes to loukoumades, your taste buds will be tingling the entire time. Big tip: come hungry.

* More than 15 different Greek products and authentic recipes
* Off-the-beaten-track eateries and local favorites
* Discover the Athens Central Market
* Chow down on the best of Greek cuisine",
	5,
	5744
);

-- ACTIVITY 7

INSERT INTO custActivity VALUES(
	"Greece",
	"Boat tour to Rhenia island with swim stop",
	"Get on board the best boat tour in Mykonos. You will cross the crystal clear waters of the Aegean Sea while enjoying an open bar of flavored Mojitos, beer, soft drinks, water and sangria.

The boat has two floors, a trampoline, a slide, two bathrooms, a bar and a glass floor to observe the seabed.

Stop for swimming, snorkeling, paddle surfing, inflatables and more surprises!

Food included, a full day at sea!",
	5,
	5892
);

-- ACTIVITY 8

INSERT INTO custActivity VALUES(
	"Greece",
	"Mykonos Beach Getaway",
	"Stop At: Mykonos, Mykonos, Cyclades, South Aegean.

Mykonos is an island in the Cyclades group in the Aegean Sea. It's popularly known for its summer party atmosphere. Beaches such as Paradise and Super Paradise have bars that blare thumping music. Massive dance clubs attract world-renowned DJs and typically stay open well past dawn. Iconic landmarks include a row of 16th-century windmills, which sit on a hill above Mykonos town. (Inclusive of private transfers)",
	6899,
	10
);

-- ACTIVITY 9

INSERT INTO custActivity VALUES(
	"Greece",
	"Cruise 3 Islands to Agistri, Moni and Aegina - Semi-Private",
	"The excursion begins at Marina Zeas where guests are expected to come on board at 08:45 am. The first stop of the cruise is the island of Agistri, surrounded by vibrant blue waters and clothed in pine trees. Here you can connect with the lush nature and feel the presence of ancients Greeks and deities while swimming and relaxing on the hot fine sand of the long flax-golden beach between Megalochori and Skala. Adventure lovers can join our optional bike tour between Melalochori and Chalikiada Beach.
From there, we move onto the island of Moni. While here, we will serve a delicious traditional Greek lunch, accompanied by traditional wine, beers soft drinks and coffee. Once you finished your feast, you have the chance to jump off the boat, snorkel, swim around the boat, or swim to the island. This gorgeous and unique island has no inhabitants but is populated with law protected deer, wild goats, rabbits and peacocks.
We will make a final journey around 3pm towards the beautiful island of Aegina. Aegina is famous for its white stone houses, flowery backyards, pistachios, the red volcanic landscape, sensational food, the temple of Apollo and the temple of Aphaia; in fewer words an earthly paradise for those who want to escape modern life. Here you will enjoy the crystal-clear water and sandy beaches of the island, while exploring the breath-taking waterfront and traditional Greek cuisine. An excellent selection of jewellery, clothes and textiles are available from the locals.
At approx. 4:45pm we will sail back to the port of Marina Zeas while enjoying the ambiance of a select and chill music, delicious Mediterranean fruits, coffee, and drinks.",
	11532,
	10
);

-- ACTIVITY 10

INSERT INTO custActivity VALUES(
	"Greece",
	"Cooking Class in Athens",
	"Be whisked off on your gustatory adventure straight from your hotel lobby. A short ride through the city will bring you to the South area of Athens.

Learn the secrets of Greek cooking during your 3-hour Greek Group cooking class. Run in the heart of Athens you'll prepare an authentic 3-course meal and then get the chance to enjoy your creations over a glass of Greek wine. The recipes are yours to keep!",
	7511,
	3
);

-- DESTINATION 3

INSERT INTO destinations VALUES(
	"Seychelles",
	33451,
	"Savoy Seychelles Resort & Spa",
	5799
);


-- ACTIVITY 1

INSERT INTO custActivity VALUES(
	"Seychelles",
	"Marine Park, Fish Feeding & Snorkeling Excursion",
	"A chauffeur will transfer you from your accommodation to Marine Charter in Victoria

Pass By: Eden Island, Eden Island

Visit of the west coastal side of Eden Island

Stop At: Ste Anne Marine National Park, Sainte Anne Island Seychelles

Arrive in the marine park, feed some fish and listen to a brief historical background of all the 5 islands that make up the St Anne marine national park

Duration: 1 hour

Stop At: Ste Anne Marine National Park, Sainte Anne Island Seychelles

The skipper of the boat will ask those who wish to snorkel. All equipment will be provided by the boat crew. Those who wish not to snorkel can carry on to Moyenne Island which is the main stop for the excursion

Duration: 1 hour

Stop At: Moyenne Island, Ste Anne Marine National Park, Mahe Island Seychelles

Moyenne Island is a small island in the Ste Anne Marine National Park off the north coast of Mahé, Seychelles. Since the 1970s it has been a flora and fauna reserve and home to many giant tortoises. Enjoy a BBQ buffet lunch (Suitable for vegetarians & halal). Snorkel around the island or enjoy a short 45 minute hike around the island discovering untouched beauties and spectacular views.

Duration: 3 hours",
	6,
	10764
);

-- ACTIVITY 2

INSERT INTO custActivity VALUES(
	"Seychelles",
	"Professional Photoshoot in Seychelles",
	"To have a better understanding about your feeling for the photoshoot, our photographer will do a quick Pre Consultation session before conducting the shoot

During the Photography session you will get a chance to get your every candid moment clicked. Not only candid clicks, also our photographer will suggest you some beautiful poses which will make the shoot memorable and classy.

Getting clicked on unexplored places is an amazing feeling. Our photographers are professional and localities so they will take you to some unexplored places which will make the pictures more memorable and distinctive.

Don't miss out on capturing your happy memories that you can cherish forever.
Few days later you will receive a google drive link consisting of All RAW Pictures, 30+ Edited Images, 3 Social Media Stories, 3 Collages",
	3,
	7866
);

-- ACTIVITY 3

INSERT INTO custActivity VALUES(
	"Seychelles",
	"Starfish PLUS on Odezir",
	"Creole Travel Services welcomes you to discover the treasures of the Marine Park with an exclusive touch. Each couple is offered a bottle of sparkling wine, a variety of snacks and a sumptuous BBQ lunch served on board our catamaran. Complemented by the jovial tunes of our local musician, let yourself relax, be entertained and enjoy as you bask in the smooth sail of our beautiful Odezir. Leave behind nothing but your footsteps and take away nothing more than photographs and memories.",
	5,
	2482
);

-- ACTIVITY 4

INSERT INTO custActivity VALUES(
	"Seychelles",
	"Full Day Mahe Island tour",
	'Pick Up at the Hotel/Port and travel to Victoria for the start of the tour, take a stroll down market street and glaze at the vibrant colors of fresh  fruits, vegetables and fish from local producers. Begin this day with a taste of the locally grown "red coconut" or ripe mango fruits.admire the various monuments, each telling their own story of our unique history.Take a photo up close with the iconic Clock tower or purchase some locally produced fine craft work. 

We will then move on to the north of Mahe to the stunning Beau Vallon beach, where the sea is always inviting.then we will move on to mission lodge lookout to get a glimpse of the west coast.the day will continue with a drive along some of the most beautiful beaches one has ever seen on the east coast toward the south tip of the island.Visit the Jardin du Roi, Rum distillery and craft village for a sublime experience you will indeed never forget,  

Scheduled stops
- Victoria (1 hour)
- Beau Vallon Beach
- Mission lodge
- Tea Factory
- Jardin du roi/ spice garden 
- Rum distillery 
- View points
- Beaches

Highlights 
- Victoria market
- Hindu temple
- Historic monuments
- Clock tower
- Cathedral
- La Domus
- Bel air cemetery
- Panoramic views
- white sand beaches
- Giant tortoises
- Coco de mer (world''s Biggest Nut)
- Spice garden trail
- Rum tasting (optional)
- Purchase craft and souvenir MADE IN SEYCHELLES
- Tasting local fruits
',
	12,
	5330
);

-- ACTIVITY 5

INSERT INTO custActivity VALUES(
	"Seychelles",
	"Vallee De Mai Tour ",
	"Vallee de Mai is considered as a World Heritage Site by UNESCO and one of the must-visit places of Praslin Island of Seychelles. It is one of the rarest places on Earth where coco de mer palm grows in its natural form.

Vallee de Mai is also a bird watcher’s paradise; here you can spot the endangered Seychelles bulbul, the lovely blue pigeon, the Seychelles warbler, and the endangered black parrot. The plantations here have three hiking trails, many sub trails, and guided walks – all of them are equally interesting",
	3,
	2299
);

-- ACTIVITY 6

INSERT INTO custActivity VALUES(
	"Seychelles",
	"Explore Morne National Park",
	"Morne National Park in Seychelles is a favourite hotspot amongst nature lovers and trekkers. Exploring this expansive bio reserve is one of the most thrilling activities to do in Seychelles.

Morne National Park consists of a rich diversity of flora and fauna and numerous interlinked trails that are perfect for adventure enthusiasts and nature lovers.",
	3,
	3199
);

-- ACTIVITY 7

INSERT INTO custActivity VALUES(
	"Seychelles",
	"Coconut Plantation House at La Digue",
	"Explore the vintage plantation house of La Digue which is one of the most popular and best things to do in Seychelles. Spread over sprawling 300 hectares of land- this age-old building is now counted as a national monument and showcases the cultural and historical significance of the place. Must see places around the plantation house are the surrounding thick coconut plantations, old cemetery, coconut oil mill, Copra house, and tortoise enclosure",
	2,
	2599
);

-- ACTIVITY 8

INSERT INTO custActivity VALUES(
	"Seychelles",
	"30-Minute Helicopter Ride - See The Best Of The Heavenly Archipelago",
	"Island hopping on Island is fun, but have you thought of a helicopter ride over the islands? One of the best ways to get the best of the heavenly archipelago is by taking a helicopter tour over the pristine islands in the Indian Ocean. Sweep in the surreal ways of the exotic islands from the sky. It is another level of fun.",
	1,
	30000
);

-- ACTIVITY 9

INSERT INTO custActivity VALUES(
	"Seychelles",
	"Rock Climbing At Constance Ephelia",
	"Challenge yourself as you climb the massive granite outcrops of Mahé at Constance Ephélia- the luxury resort. The adventure zone at this resort in Mahe offers various grades of rock climbing depending on expertise and thrilling zip-lining through the luxuriant tropical vegetation of the island.
Operational on all days from 9 am to 5 pm. Private Transfers are Inclusive.",
	2,
	5499
);

-- ACTIVITY 10

INSERT INTO custActivity VALUES(
	"Seychelles",
	"Zip Lining At Constance Ephelia",
	"The zipline base is located at the Constance Ephelia Resort at Port Launay, on the North West coast of Mahe Island.

The 8 zip lines range from 85 meters to 120 metres. These run over the lush green forest canopy and impressive granitic boulders of Mahe’s forest. The best part about this is that all ages can participate and they provide smaller harnesses for children as well.
Operational on all days from 9 am to 5 pm. Private Transfers are Inclusive.",
	2,
	4563
);

-- DESTINATION 4

INSERT INTO destinations VALUES(
	"Dubai",
	11371,
	"Movenpick Hotel Bur Dubai",
	6099
);


-- ACTIVITY 1

INSERT INTO custActivity VALUES(
	"Dubai",
	"Dhow Marina Cruise with Dinner on Shared Transfer",
	"Sail past the incredible skyline of Dubai aboard the traditional Dhow Marina cruise with modern facilities, open-air upper deck and glass-enclosed windows at the lower deck on this exciting journey. From the hotel, get transferred to the Dubai Marina Pier, one of the world's largest human-made marinas. Relax on the tunes of Arabic music and capture some of the tallest buildings lit up in the evening light. Get a glimpse of Dubai Marina Yacht Club Promenade and Residences, Dubai Marina Mall, magnificent five-star hotels and Palm Jumeirah, all showcasing world-class architectural brilliance. Savour delicious local flavours, including famous dishes from Asia, Europe, and America. This activity includes 2-hour Cruising, dinner and two-way shared transfer from the hotel. Hotel pickup time: 06:30 PM to 07:00 PM and return pickup: 10:30 PM. Duration: 4-hour from 06:30 PM to 10:30 PM. Operational on all days.",
	2,
	2955
);

-- ACTIVITY 2

INSERT INTO custActivity VALUES(
	"Dubai",
	"Burj Khalifa 124th Floor At the Top Non-Prime Time Ticket on Shared Transfer",
	"Dubai's Burj Khalifa, the tallest of all the buildings in the world, stands tall and proud amongst the other skyscrapers of the city. Visit this magnificent building to know more about the history of Dubai and the story of its construction. Post this, visit the 124th-floor observatory deck (At the Top) on the fastest elevator to have a 360-degree panoramic view of the entire city of Dubai. Guests can also enjoy the worlds largest dancing fountain show which operates in intervals of every 30 mins on the ground floor of Dubai mall beginning from 04:00 PM to 10:30 PM. This activity includes non-prime time entry ticket to 124th Floor of the building along with two-way shared transfers. Hotel pickup time: 04:00 PM to 04:30 PM and return pickup from Dubai Mall at 10:30 PM. Burj Khalifa slots will be during 07:00 PM to 09:00 PM. Operational on all days.",
	3,
	3826
);

-- ACTIVITY 3

INSERT INTO custActivity VALUES(
	"Dubai",
	"A Talise Ottoman Spa Treatment",
	"Unwind with some Ottoman hospitality by revelling in a luxurious Turkish Hammam, saltwater pool or snow room spa therapy.",
	4,
	2921
);

-- ACTIVITY 4

INSERT INTO custActivity VALUES(
	"Dubai",
	"Dubai Frame at Zabeel with entry ticket with Shared transfer",
	"Timings: 10:00 Hrs – 10:30 hrs, Hotel Pick Up time : 10:00 Hrs – 10:30 hrs. Return pickup 12:30 Hrs. Departures / Operational : All Day Visit one of the the world’s largest standing structured frame and take in stunning, picture-perfect views of the city’s magnificent skyline on an excursion to the Dubai Frame. Your journey begins at the intriguing, interactive 3D museum as you enter, where you receive an introduction to the project, followed by a visual story about the city’s rapid growth and transformation from a fishing village into a record-breaking, iconic metropolis. Take a fascinating elevator ride to the glass bridge platform 150 meters above the ground, and enjoy 360-degree panoramic views of the past and present. Gaze at low rise buildings of old Dubai to the North, and mesmerizing skyscrapers of modern Dubai to the South. Descend back to ground level, and step into a futuristic 2050 Dubai, during the Future Show interactive video. Get an insight into the future of this dynamic city, with virtual reality technology, and learn about the vision of Dubai in the next few decades.",
	2,
	2177
);

-- ACTIVITY 5

INSERT INTO custActivity VALUES(
	"Dubai",
	"Dubai Half Day Morning City Tour on Shared Transfer",
	"Enjoy a half-day city tour of Dubai, beginning from the traditional Al Fahidi cultural district, Dubai Creek, Dubai Museum, the Gold and Spice Souks, Al Seef area and Zabeel Royal Palace, the largest structured frame in the world. Continue the tour to the modern side of the city, along Jumeirah Beach and enjoy capturing close-up views of the magnificent Burj Al Arab hotel. The journey ends with a private visit to the famous Bollywood venue at Atlantis Hotel and marvellous views of Burj Khalifa. The tour spans around 4-hours and includes a local professional guide, 15-minutes photo-stop at Dubai Frame, 15-minutes photo-stop at Zabeel Palace, 25-minutes photo-stop at Jumeirah Beach and two-way shared transfers from the hotel. Hotel pickup time: 08:30 AM to 09:00 AM and return at 01:30 PM. Operational on all days except Friday.",
	3,
	1158
);

-- ACTIVITY 6

INSERT INTO custActivity VALUES(
	"Dubai",
	"A Romantic Hot Air Balloon Ride",
	"Go for an adventure with an unforgettable experience of flying in a hot air balloon, followed by a lovely breakfast in the desert.",
	5,
	35699
);

-- ACTIVITY 7

INSERT INTO custActivity VALUES(
	"Dubai",
	"Bedouin breakfast and Love Lakes Desert Safari",
	"Experience life as a Bedouin nomad, learning how to survive in Dubais unforgiving desert. See how these hardy and resourceful people herded, hunted, camped, and thrived in the ultimate cultural safari. Your journey starts in the morning, as youre driven out to the Dubai desert in an air-conditioned classic Land Rover Defender. Once you have reached our private desert property, you will start your cultural journey by traversing the desert on a camel, also traditionally called the ship of the desert. Arriving at your destination: a nomadic Bedouin camp, you will experience an insight into authentic Bedouin life. Youll be greeted in traditional fashion, with rose water, Arabic coffee, and dates. Explore the village, constructed of traditional woven goat hair, wood, and stones; a tribute to the resourcefulness of the nomadic people. Youll have the chance to meet and chat with Bedouin storytellers, pet farm animals, get up close with the Arabian hunting dogs called Salukis, and learn about Bedouin-style hunting, and how the combination of falconry and Saluki dogs became their main means of hunting. You will also be able to watch the worlds fastest animal in flight in a spectacular falconry presentation. Our Guides will explain how to prepare your own traditional Arabic breakfast while enjoying the traditional dances performed by young local Bedouin. See how Land Rovers, first introduced in 1948, transformed Bedouins life, as they could finally trade, explore and survey the vast desert areas with ease. Climb aboard a vintage Land Rover into the Dubai Desert Conservation Reserve for a short wildlife safari, stopping and seeing how the native flora and fauna were used for survival. Head over to the iconic Love Lakes in your Classic Land Rover Defender to end the morning walking around one of the most instagrammable places in Dubai.",
	5,
	13174
);

-- ACTIVITY 8

INSERT INTO custActivity VALUES(
	"Dubai",
	"A Quick Drive to Al Qadra Lakes - a Desert Oasis",
	"Cherish a sunset & check out the wild animals of Dubai- desert foxes, oryxes & birds. Savour a bite from a food truck or a restaurant.",
	8,
	7160
);

-- ACTIVITY 9

INSERT INTO custActivity VALUES(
	"Dubai",
	"Al Fahidi - Historical Dubai Neighbourhood",
	"Visit the Al Fahidi neighbourhood and relive the past of Dubai as you check out the protected buildings from ancient times.",
	4,
	5155
);

-- ACTIVITY 10

INSERT INTO custActivity VALUES(
	"Dubai",
	"Creekside Walking Tour",
	"This tour includes a walk through the Al Bastakiya neighborhood of the Al Fahidi Historic District and a visit to the Diwan Mosque and Textile Souq. Guests then board an abra boat, and journey across Dubai Creek to Deira to visit the Gold Souk and Spice Souk. Head back to the SMCCU house for a cultural discovery Q&A session while enjoying Arabic tea, coffee and dates. This tour is by special request only.",
	2,
	7179
);

-- DESTINATION 5

INSERT INTO destinations VALUES(
	"Prague",
	23337,
	"Cosmopolitan Hotel Prague",
	6460
);


-- ACTIVITY 1

INSERT INTO custActivity VALUES(
	"Prague",
	"The Bone Church of Kutna Hora -The Real and Imagined Audio Tour by VoiceMap",
	"Pass By: Historicke Centrum Kutne Hory, Kutna Hora Czech Republic

Kutna Hora was founded in the tenth century, and built its vast wealth with silver mining, fast becoming a favorite residence for Bohemian Kings.

Pass By: Cathedral of Assumption of Our Lady and St. John the Baptist, U Zastávky 280, Sedlec, 284 03 Kutná Hora, Czechia

The Church of the Assumption of Our Lady and Saint John the Baptist was built right around 1300. She is the first High Gothic building in the Kingdom of Bohemia and gives a nod to Kutna Hora's glittering past. She is also the first church in the kingdom that resembles the French High Gothic cathedrals, which were all the rage at the time.
",
	1,
	375
);

-- ACTIVITY 2

INSERT INTO custActivity VALUES(
	"Prague",
	"Private Tour - Prague Castle and Old Town",
	"Enjoy a full day in Prague with a private guide in tour custom-made for you.
Explore the world’s largest castle complex, Prague Castle, St Vitus’s Cathedral, and the Golden Lane; admire the distinctive landmarks of Prague’s Old Town; enjoy walking in the famous Charles Bridge.
Explore Prague’s Old Town Square and the astronomical clock. You will enjoy also the cablecar and boat trip.
This private tour can be customized to your interests and ensures you’ll receive personalized attention from your guide",
	8,
	28675
);

-- ACTIVITY 3

INSERT INTO custActivity VALUES(
	"Prague",
	"Prague Ghosts, Legends, and Dungeon Evening Walking Tour",
	"Stop At: Prague Underground Tours, Male Namesti 459/11 Ticket Office, Prague 110 00 Czech Republic

Walking tour including the Prague Oldtown and the Jewish Quarter, Tourguide in costume and visit to the Medieval Underground Dungeon.",
	10,
	1324
);

-- ACTIVITY 4

INSERT INTO custActivity VALUES(
	"Prague",	
	"One-Hour Sightseeing Cruise with Commentary",
	"Enjoy a view of the Charles Bridge and Prague Castle from another perspective, while your feet rest during a 50-minute cruise on the Vltava River. You can learn many interesting facts about the most famous Prague sights thanks to audio commentaries in 8 languages.

Tour the historic centre of Prague comfortably from the deck of a boat during a 50-minute cruise. You will see up close the pillars of Charles Bridge with its mysterious details and you will enjoy a breath-taking view of Prague Castle from the river. Right on the left bank of the Vltava you will see the Straka Academy – the seat of the Czech government, the classicist building of the Civic Swimming Pool and above you the Prague Metronome perched on the Letná hill. On the right bank you can admire the Rudolfinum concert hall and the architecture of Old Town.",
	1,
	1253
);

-- ACTIVITY 5

INSERT INTO custActivity VALUES(
	"Prague",
	"Czech Beer Tasting in Prague",
	"You will taste a few samples of a different types of beer of Czech production, famous labels as well as very local ones and taste snacks served traditionally to beer.",
	2,
	2099
);

-- ACTIVITY 6

INSERT INTO custActivity VALUES(
	"Prague",
	"Prague - 2 Hour Beer Bike tour",
	"Stop At: Original Prague Beer Bike, Hybernska 2086/15, Prague 10100 Czech Republic

Our waitress will meet you on the beerbike, draft you a beer and the tour is getting started! You will go through the city, with this fantastic moving bar on wheels. Fun, laughter and party with friends guaranteed!",
	5,
	10877
);

-- ACTIVITY 7

INSERT INTO custActivity VALUES(
	"Prague",
	"Private Day Trip to Cesky Krumlov from Prague",
	"Stop At: Cesky Krumlov, Cesky Krumlov, South Bohemian Region, Bohemia

A beautiful city in South Bohemia feels like a fairy tale from the Middle Ages. Quaint houses, a grand castle, a meandering river.

Duration: 3 hours

Stop At: Cesky Krumlov Castle, Zamek cp. 59, Cesky Krumlov 381 01 Czech Republic

Český Krumlov Castle is one of the most important monuments in Central Europe in terms of architectural level, cultural tradition and scale.

Duration: 2 hours

Stop At: Church of St. Vitus, Kostelni, Cesky Krumlov Czech Republic

Catholic church with Gothic & other architectural styles, plus frescos & a 17th-century altar.

Duration: 30 minutes

Stop At: Vltava River, Melnik Czech Republic

Enjoy a break near the waters of Vatlava river in the picturesque town of Cesky Krumlov.

Duration: 2 hours",
	8,
	11255
);

-- ACTIVITY 8

INSERT INTO custActivity VALUES(
	"Prague",
	"Prague Castle Quest - Gothic Prague - City Exploration Game!",
	"Embark on a quest through grand boulevards, winding cobblestone streets, and up the oldest castle stairs to discover the secrets of gothic Prague. Along the way, learn about important 14th C cathedrals, squares, and landmarks.
Are you ready for a 3,5km adventure to discover the mysteries of gothic Prague with a ghost as your guide?
Highlights
You will learn the 14th C history of Prague through the eyes of their greatest medieval ruler and builder, Charles IV
You will begin in Wenceslas Square and walk to the castle, seeing many major city highlights including: Old Town Square and the Astronomical Clock, Charles Bridge, Prague Castle and St. Vitus
Storyline
You were peacefully asleep floating through a land of blissful dreams. But suddenly, a force pulls you through. You open your eyes and see your beloved Prague, but it looks so different!
You look down upon yourself and notice that you are translucent. You’re a ghost. Of course, you remember that you used to be King Charles IV, the first Czech King crowned Holy Roman Emperor in 1355.
Before you can ask yourself why you were brought back, a voice starts to reverberate through your whole phantasmatic body: Save the Crown Jewels. Someone is trying to steal them.",
	2,
	2599	
);

-- ACTIVITY 9

INSERT INTO custActivity VALUES(
	"Prague",
	"Prague Castle by Night Guided Tour",
	"Stop At: Lesser Town, Malostranske Namesti Praha 1, Prague 11800 Czech Republic

This tour includes Lesser Town, the less busy, more romantic, side of Prague, opposite the Charles bridge.

Duration: 10 minutes

Stop At: Prague Castle, Hradcany, Prague 11908 Czech Republic

We cover all the grounds: the gardens, Saint-Vitus church, the presidential courtyard, the belvedere, golden lane when it is open and so on.

Please note we do not go inside the buildings.

Duration: 1 hour 10 minutes

Pass By: Nerudova Street, Prague 110 00 Czech Republic

A dramatic street, with Prague's most spectacular mansions.

Especially scenic at night time.

Definitely a must-see of Prague. You cannot visit Prague and not have seen Nerudova street.

Stop At: Golden Lane, Daliborky 30/38, Prague 119 00 Czech Republic

This is where alchemists turned lead into gold. And where legendary Kafka once lived.

We visit if and when Golden Lane is open - schedules are unpredictible.

Duration: 10 minutes",
	2,
	1944
);

-- ACTIVITY 10

INSERT INTO custActivity VALUES(
	"Prague",
	"Gastrotour - snails farm with degustation",
	"Let’s go to the largest snail’s farm in Prague and try four dishes from the chef!

At the farm you’ll see how snails grow, eat and why they need a lot of water. Then, after theoretic part the owner of the farm’ll show you how to cook snails in a different ways. You’ll try all this dishes with a glass of white wine (it is in price!). So, what meals are waiting for you?

-Tortilla with snails
-Spicy dish: snails in shells with Salsa sauce
-Snails with Parmesan, baked in mushrooms
-Burgundy snails (immortal classic!)

After degustation you can also try another positions in menu. Your dinner will happen in cozy open-air restaurant.",
	3,
	2916
);

-- DESTINATION 6

INSERT INTO destinations VALUES(
	"Thailand",
	9876,
	"Anajak Bangkok Hotel",
	3044
);

-- ACTIVITY 1

INSERT INTO custActivity VALUES(
	"Thailand",
	"Half Day Temples City Tour + Shopping at Jewellery Factory",
	"Know about Bangkok's heritage through a city tour and visit the famous gem factory with this excursion. It includes a visit to Wat Jetuphon (better known as Wat Pho), the oldest of the city temples situated opposite the Grand Palace. The temple is famous for its instructive murals, illustrating the finer points of Thai massage and statue of a reclining Buddha. The activity also includes a visit to Wat Traimitr, located near Bangkok's main railway station, which features a 5.5-tonne gold Buddha. The tour terminates with a visit to a jewellery retailer at a gems factory.",
	2,
	2171
);

-- ACTIVITY 2

INSERT INTO custActivity VALUES(
	"Thailand",
	"Under Water World by Private Transfer",
	"One of the largest and the most modern ocean aquariums in Asia, Underwater World allows visitors to experience Thailand's marine life through a 100-meter underwater tunnel. It is divided into four parts, each with unique exhibits. Touch Pool zone of the underwater world allows visitors to see and interact with various underwater species. The Reef Tank features Sharks and Rays Zone houses seemingly dangerous and graceful species. The Shipwrecks Zone features a wide variety of edible fish.",
	1,
	1712
);

-- ACTIVITY 3

INSERT INTO custActivity VALUES(
	"Thailand",
	"Half Day tour of the Sanctuary of Truth on Seat In Coach Basis",
	"Visit the one and only all-wood sculpture building in the whole world, and marvel at the intricate sculptures while finding out more about the message it was built to share!",
	1,
	1988
);

-- ACTIVITY 4

INSERT INTO custActivity VALUES(
	"Thailand",
	"Kaan Show Sky Zone Entry Ticket (Shared Transfers)",
	"Experience the infamous Kaan Show and get to learn the Thai literature in one of the most spectacular ways. You will be picked up from your hotel and taken to the Singha DLuck Cinematic Theatre to witness the show. As you reach there, seat yourself in the Sky Zone from where you can get a panoramic view of the entire stage and witness the spectacular show performed by professional artists dressed in extravagant costumes. Enjoy the world class art lighting and audiovisual systems that showcase a story about a young man named KAAN who is lost in his own imaginary adventurous world. The story unfolds dramatically with 4D projections of flying dragons and giant robot like creatures, that will blow your mind with its stunning cinematic experience. As this breathtaking visual treat comes to an end, you will be dropped back at your hotel.",
	1,
	2346
);

-- ACTIVITY 5

INSERT INTO custActivity VALUES(
	"Thailand",
	"Cartoon Network Water Park Pattaya by Shared Transfer",
	"Explore the world's first cartoon network theme park located in south of Pattaya. This massive water park, set in the pristine coastal area of Bang Saray, features 30 state-of-the-art water rides spread out across 10 entertainment zones. Take a tube and drift along the artificial jungle or get your adrenaline rush kicking by facing some of the fastest water roller coasters in the world. Transfers: From and to the hotel, in a shared vehicle, are included. Meals: Not included.",
	8,
	2485
);

-- ACTIVITY 6

INSERT INTO custActivity VALUES(
	"Thailand",
	"Oasis Spa, The - Pattaya, Jomtien",
	"No trip to Pattaya is complete without enjoying a massage treatment from Pattaya’s most celebrated spa – Oasis Spa Pattaya. After a day trip or spending time on the beach, come to relax and enjoy yourself at Pattaya's Oasis Spa. It is the best Thai Lanna Spa to go to for a massage and spa treatment. (Aromatherapy Hot Oil Massage)",
	1,
	3133	
);

-- ACTIVITY 7

INSERT INTO custActivity VALUES(
	"Thailand",
	"Tiffany Show Normal Seat In Coach Basis",
	"Tiffany's Cabaret Show takes place in a grand theatre that, with its huge faux-marble lobby, manages to be almost as spectacular as the dazzling costumes. Performers make their entrances dressed in everything from long sweeping ball-gowns and plumes of feathers, to elaborate headdresses and skimpy polkadot swimwear.

A breathless hour-long riot of sound, colour and light ensues; a show that spans the entire hemisphere through song, dance or skit. Scenes include a Bollywood musical take on the Indian Raj, a traditional Korean fan dance, homage to China's Imperial past and progress, Siam's history told through graceful Thai dance, Broadway show tunes, and slapstick burlesque.",
	1,
	2429
);

-- ACTIVITY 8

INSERT INTO custActivity VALUES(
	"Thailand",
	"Half Day Mini Siam by Private Transfer",
	"Mini Siam is a famous miniature park in Pattaya with replicas of famous monuments and attractions like the Tower Bridge, Eiffel Tower, Statue of Liberty. Trevi Fountain and may more from around the world.There is also a Mini Race Course (Go-karts) for speed-loving visitors. Transfers from and to the hotel, in a private vehicle, are included. Pick-up/Drop: Tentative pick-up time from the hotel would be 9 AM and drop off time would be 3:30 PM.Duration:3 hours",
	2,
	1657
);

-- ACTIVITY 9

INSERT INTO custActivity VALUES(
	"Thailand",
	"Sri Racha Tiger Zoo Entry Ticket With Transfers (Shared Basis)",
	"Visit the Sri Racha Tiger Zoo in Pattaya and get the unique opportunity to witness hundreds of wild cats in their natural compound. You will be picked up from your hotel and taken to the Sri Racha Zoo. As you enter the park, indulge in the fascinating sight of the numerous tigers in the playground. Take amazing pictures with the tigers inside their compound with full safety. After the big tigers, experience to hold a baby tiger in your arms and feed them milk. Watch in awe as the adorable baby tiger drinks the milk. Next, head to see the other animals like well-trained chimpanzees and elephants. Wrap up the day with entertaining animals shows such as the crocodile show, the tiger show, the elephant show and the pig racing show. As the adventure of this animal kingdom comes to an end, you will be dropped back to your place of stay.",
	2,
	1684
);

-- ACTIVITY 10

INSERT INTO custActivity VALUES(
	"Thailand",
	"Experience King Power Mahanakhon",
	"Despite the lack of any major tourist attractions, this lively neighborhood is a favorite of many. Whether it's the (somewhat naughty) nightlife of Soi Patpong, the various handicraft night markets or the plethora of dining options that tickle your fancy, a night out in Silom is a must on every itinerary. It's worth a stop during daytime, too: join office workers on a quest to tasty street food during lunch and shop at Silom Complex for a great mix of Thai and international stores. After a day of strolling around the congested sidewalks, a visit to Silom's Lumphini Park, Bangkok's answer to NYC's Central Park, is a welcome change of scenery.",
	2,
	1135
);

-- +------------+--------------+------+-----+---------+-------+
-- | Field      | Type         | Null | Key | Default | Extra |
-- +------------+--------------+------+-----+---------+-------+
-- | CardHolder | varchar(255) | NO   |     | NULL    |       |
-- | CardNumber | varchar(255) | NO   |     | NULL    |       |
-- | cvv        | int          | NO   |     | NULL    |       |
-- | brand      | varchar(32)  | NO   |     | NULL    |       |
-- | expYear    | int          | NO   |     | NULL    |       |
-- | expMonth   | varchar(32)  | NO   |     | NULL    |       |
-- +------------+--------------+------+-----+---------+-------+

INSERT INTO bankaccounts VALUES(
	"Snehapriya Murugan",
	"4242424242424242",
	432,
	"VISA",
	22,
	8
);

INSERT INTO bankaccounts VALUES(
	"Sideshwar JB",
	"5555555555554444",
	870,
	"Mastercard",
	21,
	12
);

INSERT INTO bankaccounts VALUES(
	"Shalini Suresh",
	"5200828282828210",
	883,
	"Mastercard",
	23,
	1
);