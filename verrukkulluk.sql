-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Gegenereerd op: 20 jan 2025 om 09:18
-- Serverversie: 8.0.35
-- PHP-versie: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `verrukkulluk`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `article`
--

CREATE TABLE `article` (
  `id` int NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` int NOT NULL,
  `kcal` int NOT NULL,
  `packaging` int NOT NULL,
  `unit` varchar(50) NOT NULL,
  `picture` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `article`
--

INSERT INTO `article` (`id`, `title`, `description`, `price`, `kcal`, `packaging`, `unit`, `picture`) VALUES
(1, 'AH Panko broodkruim', 'AH Panko broodkruim is Japans paneermeel perfect voor sushi, garnalen en groenten​', 299, 726, 200, 'gram', 'https://static.ah.nl/dam/product/AHI_43545239393338343433?revLabel=1&rendition=800x800_JPG_Q90&fileType=binary'),
(2, 'AH Tarwebloem', 'Zorgvuldig geselecteerde tarwe van hoge kwaliteit.', 85, 3490, 1000, 'gram', 'https://static.ah.nl/dam/product/AHI_43545239363630333030?revLabel=1&rendition=800x800_JPG_Q90&fileType=binary'),
(3, 'AH Truffelmayonaise', 'Heerlijke romige mayonaise met echte stukjes zwarte truffel. Smaakt heerlijk bij diverse vlees- of visgerechten, bij gepofte aardappelen, maar is ook lekker als dip bij diverse hapjes of in de bereiding van tapas.', 219, 641, 100, 'gram', 'https://static.ah.nl/dam/product/AHI_4354523130313238363739?revLabel=1&rendition=400x400_JPG_Q85&fileType=binary'),
(4, 'AH Witte vrije uitloopeieren M', 'Verpakking met 6 vrije uitloop eieren wit klasse M.', 179, 456, 6, 'stuks', 'https://static.ah.nl/dam/product/AHI_43545239363430323834?revLabel=1&rendition=400x400_JPG_Q85&fileType=binary'),
(5, 'AH Iets kruimige aardappelen', 'De aardappelen zijn na het koken stevig in de kern en aan de buitenkant kruimelig en los van structuur. Een veelzijdige aardappel. Ook in de schil te bereiden.', 165, 880, 1000, 'gram', 'https://static.ah.nl/dam/product/AHI_4354523130313135373735?revLabel=1&rendition=400x400_JPG_Q85&fileType=binary'),
(6, 'AH Parmigiano reggiano', 'Deze typisch Italiaanse kaas, ook wel bekend onder de naam Parmezaanse kaas, wordt geroemd om haar karaktervolle smaak en korrelige structuur. Een harde kaas van koemelk met een kruidige en pikante smaak door het zouten en de minimale rijping van maar liefst 22 maanden. De finishing touch van je pastamaaltijd en vele andere gerechten.', 544, 679, 169, 'gram', 'https://static.ah.nl/dam/product/AHI_434d50323331313638?revLabel=3&rendition=400x400_JPG_Q85&fileType=binary'),
(7, 'AH Paneermeel naturel beschuit', 'Voor een krokant laagje op gerechten.', 59, 548, 150, 'gram', 'https://static.ah.nl/dam/product/AHI_43545239363730323330?revLabel=1&rendition=400x400_JPG_Q85&fileType=binary'),
(8, 'De Zaanse Hoeve Mild 30+ geraspt', 'Milde geraspte kaas.', 239, 616, 200, 'gram', 'https://static.ah.nl/dam/product/AHI_43545239353833313432?revLabel=2&rendition=400x400_JPG_Q85&fileType=binary'),
(9, 'AH Witte scharreleieren', 'Verpakking met 10 scharreleieren wit klasse M/L. \r\nBeter Leven keurmerk 1 ster.\r\nKwaliteitsklasse A, Gewichtsklasse M/L.', 229, 694, 10, 'stuks', 'https://static.ah.nl/dam/product/AHI_43545239393131303636?revLabel=1&rendition=400x400_JPG_Q85&fileType=binary'),
(10, 'AH Hamreepjes', 'Hamreepjes zijn een smaakvolle toevoeging aan diverse gerechten. Gemakkelijk te bereiden en snel klaar.', 349, 298, 200, 'gram', 'https://static.ah.nl/dam/product/AHI_4354523130303934373336?revLabel=1&rendition=400x400_JPG_Q85&fileType=binary'),
(11, 'AH Knoflook', 'Knoflook is een echte smaakmaker die een gerecht extra smaak en geur geeft.', 125, 158, 2, 'stuks', 'https://static.ah.nl/dam/product/AHI_43545239393536393638?revLabel=1&rendition=400x400_JPG_Q85&fileType=binary'),
(12, 'AH Gele uien', 'Uien behoren tot de familie van de uiachtigen, evenals prei en knoflook.', 125, 380, 1000, 'gram', 'https://static.ah.nl/dam/product/AHI_43545239393239393133?revLabel=1&rendition=400x400_JPG_Q85&fileType=binary'),
(13, 'AH Excellent Glitterspray goud', 'Geef gebakjes een oogverblindende finishing touch met deze glinsterende goudspray. Elke fles heeft meer dan 900 sprays.', 399, 0, 4, 'gram', 'https://static.ah.nl/dam/product/AHI_4354523130313236323330?revLabel=1&rendition=400x400_JPG_Q85&fileType=binary'),
(14, 'Nielsen-Massey Vanille extract', 'Nielsen-massey vanille extract is jouw geheime ingredient in de keuken! Met de fijne en pure smaak van bourbon vanille geef je jouw gerechten een echte vanillesmaak.', 899, 0, 60, 'ml', 'https://static.ah.nl/dam/product/AHI_43545239363536333636?revLabel=1&rendition=400x400_JPG_Q85&fileType=binary'),
(15, 'Van Gilse Fijne kristalsuiker', 'Van Gilse Fijne kristalsuiker is een speciaal geslecteerde fijne korrel. Door de fijne structuur lost het sneller op en is hierdoor ideaal voor het bakken.', 185, 3000, 750, 'gram', 'https://static.ah.nl/dam/product/AHI_43545239353639323031?revLabel=3&rendition=400x400_JPG_Q85&fileType=binary'),
(16, 'AH Slagroom', 'Vol & romig van smaak. Makkelijk luchtig op te kloppen.', 99, 421, 125, 'ml', 'https://static.ah.nl/dam/product/AHI_43545239393332383630?revLabel=1&rendition=400x400_JPG_Q85&fileType=binary'),
(17, 'AH Mandarijnen', 'Smaak: mandarijnen hebben een frisse en zoete smaak\r\nGezondheid: Van nature rijk aan vitamine C.\r\n', 202, 450, 1000, 'gram', 'https://static.ah.nl/dam/product/AHI_43545239393438313538?revLabel=1&rendition=400x400_JPG_Q85&fileType=binary'),
(18, 'AH Biologisch Kokos rasp', 'Deze biologische kokosrasp is licht knapperig en maakt veel gerechten net even specialer. Voeg toe aan warme en koude gerechten of gebruik als garnering. Strooi over de american pancakes, voeg toe aan de granola of aan pittige indonesische gerechten.', 219, 1712, 250, 'gram', 'https://static.ah.nl/dam/product/AHI_43545239363338343030?revLabel=1&rendition=400x400_JPG_Q85&fileType=binary'),
(19, 'AH Verse scharreleieren M', 'Verpakking met 10 scharreleieren klasse M\r\n', 349, 760, 10, 'stuks', 'https://static.ah.nl/dam/product/AHI_4354523130303630313337?revLabel=1&rendition=400x400_JPG_Q85&fileType=binary');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `dish`
--

CREATE TABLE `dish` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `photo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description_short` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description_long` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `kitchen_id` int NOT NULL,
  `type_id` int NOT NULL,
  `date_added` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `dish`
--

INSERT INTO `dish` (`id`, `user_id`, `title`, `photo`, `description_short`, `description_long`, `kitchen_id`, `type_id`, `date_added`) VALUES
(1, 1, 'Parmezaan-truffel aardappelkroketjes van leftover aardappelen', 'https://static.ah.nl/static/recepten/img_RAM_PRD130166_1024x748_JPG.jpg', 'Aardappel over? Tover ze om tot aardappelkroketjes.', 'Deze Parmezaan-truffel aardappelkroketjes zijn een heerlijke, luxe traktatie. De zachte aardappelpuree, gemengd met Parmezaanse kaas, truffelmayo en een snufje peper en zout, vormt de basis voor deze krokante lekkernij. Na een uur in de koelkast om stevig te worden, worden de kroketjes door bloem, eimengsel en panko gerold, wat zorgt voor een goudbruine, knapperige korst bij het frituren. Het resultaat is een perfect uitgebalanceerd gerecht met een romige, aardse binnenkant en een verrassend krokante buitenkant. De subtiele truffelsmaak en het zoute van de Parmezaan maken elk hapje een smaaksensatie. Serveer de kroketjes met een extra lepel truffelmayo voor een verfijnde finishing touch. Dit gerecht is ideaal als luxe bijgerecht of feestelijke snack!', 1, 2, '2024-12-27'),
(2, 2, 'Macaronimuffins', 'https://static.ah.nl/static/recepten/img_RAM_PRD130116_1024x748_JPG.jpg', 'Overgebleven macaroni maakt een comeback als krokante muffin. En dat al in een half uur!', 'Deze Macaronimuffins zijn een heerlijke manier om restjes macaroni om te toveren tot een smakelijke traktatie. Gekookte macaroni wordt gemengd met ham, ui, en knoflook, gebonden met ei en gesmolten kaas, en aangevuld met paneermeel voor een krokante buitenkant. Het mengsel wordt in muffinvormpjes geplaatst en goudbruin gebakken. De buitenkant wordt krokant, terwijl de binnenkant zacht en smaakvol blijft. De combinatie van pasta, ham en kaas maakt de muffins zowel vullend als vol van smaak. ', 1, 3, '2024-12-27'),
(3, 2, 'Mandarijnen-crème brûlée', 'https://static.ah.nl/static/recepten/img_RAM_PRD197275_1024x748_JPG.jpg', 'Het klassieke toetje, maar dan met de frisse smaak van mandarijn. En natuurlijk een krokant laagje om kapot te tikken.', 'De Mandarijnen-crème brûlée is een verfijnde variant van het klassieke Franse dessert. De romige custard, verrijkt met een frisse citrusachtige mandarijnsmaak, wordt afgemaakt met een krokante, gekarameliseerde suikerlaag. Het contrast tussen de romigheid en de crunch maakt dit dessert een verfijnde traktatie met een verrassende fruitige twist.', 4, 2, '2024-12-27'),
(4, 1, 'Puslice (kokoskoekjes)', 'https://static.ah.nl/static/recepten/img_RAM_PRD197195_1024x748_JPG.jpg', 'Kokos puslice zijn een soort Kroatische kokosmakronen en een recept dat al generaties lang wordt doorgegeven binnen de familie van Emma. Handig tijdens de kerstdrukte: de bereidingstijd is maar 10 min. en de rest doet de oven! ', 'Puslice zijn luchtige kokoskoekjes gemaakt van eiwit, suiker en kokosrasp. De ingrediënten worden opgeklopt tot een luchtige massa, vervolgens in kleine hoopjes gevormd en langzaam gebakken. Het resultaat is een krokante buitenkant met een zachte, luchtige binnenkant—een heerlijke en simpele Kroatische lekkernij met een rijke kokossmaak.\r\n', 5, 2, '2024-12-27');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `dish_info`
--

CREATE TABLE `dish_info` (
  `id` int NOT NULL,
  `record_type` char(1) NOT NULL,
  `dish_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `number_field` int DEFAULT NULL,
  `text_field` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `dish_info`
--

INSERT INTO `dish_info` (`id`, `record_type`, `dish_id`, `user_id`, `date`, `number_field`, `text_field`) VALUES
(1, 'B', 1, NULL, NULL, 1, 'Rasp de Parmezaanse kaas. Stamp de leftover aardappelen met een pureestamper tot puree. Meng de aardappelen met de helft van de eieren, 2/5 van de truffelmayonaise en ⅔ van de kaas. Bestrooi met peper en zout. Vorm 12 kroketjes van 7 bij 2,5 cm van het pureemengsel. Zet min. 1 uur in de koelkast om op te stijven.'),
(2, 'B', 1, NULL, NULL, 2, 'Verhit de olie in een (frituur)pan tot 180°C.'),
(3, 'B', 1, NULL, NULL, 3, 'Zet 3 diepe borden naast elkaar. Verdeel de bloem, peper en eventueel zout over bord 1, klop het andere ei los in bord 2 en meng de rest van de kaas met de panko in bord 3. Rol de kroketjes achtereenvolgens door de bloem, het eimengsel en het pankomengsel. Zorg dat alles goed bedekt is.'),
(4, 'B', 1, NULL, NULL, 4, 'Frituur de aardappelkroketjes (in delen) in 5 min. goudbruin en gaar. Serveer met de rest van de truffelmayo.'),
(5, 'O', 1, 1, NULL, NULL, 'This is no mere appetizer. It is a conquest of the senses—an embodiment of power, elegance, and mastery. Serve it well, and it will prove to be... a worthy indulgence.\"'),
(6, 'O', 2, 2, NULL, NULL, 'Mm... delicious, this dish is. A new take on macaroni, it is. Crunchy outside, soft inside, the ham and cheese, powerful flavors they bring.'),
(7, 'B', 2, NULL, NULL, 1, 'Verwarm de oven voor op 220 °C. Kook de macaroni volgens de aanwijzingen op de verpakking. Laat afkoelen. Snipper de ui en snijd de knoflook fijn. Verhit de olie in een hapjespan en fruit de ui en knoflook 2 min. Snijd de ham in reepjes. Voeg de 150g gekookte macaroni (per 4 porties) die je over hebt aan restjes en de ham toe, meng goed en haal van het vuur.'),
(8, 'B', 2, NULL, NULL, 2, 'Klop het ei los in een kom. Voeg het macaronimengsel en de kaas toe. Meng het paneermeel erdoor. Knip 4 vierkantjes van het bakpapier en leg ze in 4 holtes van de muffinvorm (per 4 personen). Verdeel het macaronimengsel over de holtes. Bak de macaronimuffins ca. 15 min. in het midden van de oven goudbruin en krokant.'),
(9, 'B', 3, NULL, NULL, 1, 'Verwarm de oven voor op 135 °C. Boen de mandarijnen schoon, rasp de oranje schil van ⅓ van de mandarijnen en snijd in plakjes. Pers de rest van de mandarijnen uit. Breng de slagroom met het mandarijnenrasp aan de kook. Zet het vuur laag en laat 5 min. trekken.'),
(10, 'B', 3, NULL, NULL, 2, 'Splits ondertussen de eieren, de eiwitten worden niet gebruikt. Klop de eidooiers met een garde in een kom met de helft van de suiker, 2 el mandarijnensap (per 4 personen), het vanille-extract en eventueel zout. '),
(11, 'B', 3, NULL, NULL, 3, 'Breng de room op middelhoog vuur weer tegen de kook aan. Schenk de hete room geleidelijk door het eimengsel en roer goed tot je een wat dunne custard hebt. Giet de warme custard door een zeef in een maatbeker.'),
(12, 'B', 3, NULL, NULL, 4, 'Zet de ovenschaaltjes in de ovenschaal of braadslede en schenk de custard voorzichtig in de schaaltjes. Vul de braadslee tot halverwege de rand van de ovenschaaltjes voorzichtig met heet water en laat de custard in de oven in 45-50 min. gaar worden. De custard is gaar als de bovenkant gestold is, maar in het midden nog een beetje wiebelig is. Hij mag zeker niet vloeibaar zijn. Verleng eventueel de baktijd tot de juiste gaarheid bereikt is. '),
(13, 'B', 3, NULL, NULL, 5, 'Haal de ovenschaaltjes uit het waterbad en laat op een rooster 30 min. afkoelen. Dek de schaaltjes af met vershoudfolie en zet minimaal 2 uur in de koelkast. Verdeel vlak voor het serveren de rest van de suiker erover en karamelliseer gelijkmatig met de crème-brûléebrander. Verdeel de plakjes mandarijn over de crème brûlée en spray de glitterspray erover. '),
(14, 'O', 3, 2, NULL, NULL, '\"Hmm... Mandarijnen-crème brûlée, a delight it is. Rich and creamy, the custard is, with a fresh twist of citrus it brings. Mandarijn, balance to the sweetness, it adds.'),
(15, 'B', 4, NULL, NULL, 1, 'Verwarm de oven voor op 110°C. Splits de eieren, het eigeel gebruik je niet.'),
(16, 'B', 4, NULL, NULL, 2, 'Schep het eiwit, de suiker en de kokosrasp om. Schep 28 hoopjes (per 28 stuks) van ca. 4 cm op een met bakpapier beklede bakplaat en bak 3 uur in de oven. Haal eruit en laat 1 uur afkoelen op de bakplaat. '),
(17, 'O', 4, 1, NULL, NULL, 'Hmm... The power of the Puslice is strong. Light, they are, with a coconut flavor that penetrates the senses.'),
(42, 'W', 1, NULL, NULL, 4, NULL),
(61, 'F', 1, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `grocery_list`
--

CREATE TABLE `grocery_list` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `article_id` int NOT NULL,
  `amount` int NOT NULL,
  `packaging` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `grocery_list`
--

INSERT INTO `grocery_list` (`id`, `user_id`, `article_id`, `amount`, `packaging`) VALUES
(75, 2, 1, 50, 1),
(76, 2, 2, 30, 1),
(77, 2, 3, 75, 1),
(78, 2, 4, 10, 2),
(79, 2, 5, 500, 1),
(80, 2, 6, 125, 1),
(81, 2, 13, 2, 1),
(82, 2, 14, 10, 1),
(83, 2, 15, 200, 1),
(84, 2, 16, 800, 7),
(85, 2, 17, 480, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int NOT NULL,
  `dish_id` int NOT NULL,
  `article_id` int NOT NULL,
  `amount` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `ingredient`
--

INSERT INTO `ingredient` (`id`, `dish_id`, `article_id`, `amount`) VALUES
(1, 1, 1, 50),
(2, 1, 2, 30),
(3, 1, 3, 75),
(4, 1, 4, 2),
(5, 1, 5, 500),
(6, 1, 6, 125),
(7, 2, 7, 15),
(8, 2, 8, 50),
(9, 2, 9, 1),
(10, 2, 10, 50),
(11, 2, 11, 1),
(12, 2, 12, 200),
(13, 3, 13, 1),
(14, 3, 14, 5),
(15, 3, 15, 100),
(16, 3, 16, 400),
(17, 3, 17, 240),
(18, 3, 4, 4),
(19, 4, 18, 250),
(20, 4, 15, 180),
(21, 4, 19, 6);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `kitchentype`
--

CREATE TABLE `kitchentype` (
  `id` int NOT NULL,
  `description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `record_type` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `kitchentype`
--

INSERT INTO `kitchentype` (`id`, `description`, `record_type`) VALUES
(1, 'Italiaans', 'K'),
(2, 'Vegatarisch', 'T'),
(3, 'Carnivoor', 'T'),
(4, 'Frans', 'K'),
(5, 'Kroatisch', 'K');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `e-mail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `photo` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Gegevens worden geëxporteerd voor tabel `user`
--

INSERT INTO `user` (`id`, `name`, `e-mail`, `password`, `photo`) VALUES
(1, 'Darth Vader', 'darthvader@hotmail.com', 'Jointhedarkside123', 'https://lumiere-a.akamaihd.net/v1/images/607598d0230e6a00018e21b2-image_354b1b56.jpeg?region=192%2C0%2C1152%2C864'),
(2, 'Yoda', 'Yoda@hotmail.com', 'Mypasswordthisisnot', 'https://static.wikia.nocookie.net/starwars/images/d/d6/Yoda_SWSB.png/revision/latest?cb=20150206140125');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `dish`
--
ALTER TABLE `dish`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `kitchen_id` (`kitchen_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexen voor tabel `dish_info`
--
ALTER TABLE `dish_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dish_info_ibfk_1` (`dish_id`);

--
-- Indexen voor tabel `grocery_list`
--
ALTER TABLE `grocery_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Indexen voor tabel `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_id` (`article_id`),
  ADD KEY `dish_id` (`dish_id`);

--
-- Indexen voor tabel `kitchentype`
--
ALTER TABLE `kitchentype`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `article`
--
ALTER TABLE `article`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT voor een tabel `dish`
--
ALTER TABLE `dish`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `dish_info`
--
ALTER TABLE `dish_info`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT voor een tabel `grocery_list`
--
ALTER TABLE `grocery_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT voor een tabel `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT voor een tabel `kitchentype`
--
ALTER TABLE `kitchentype`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT voor een tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `dish`
--
ALTER TABLE `dish`
  ADD CONSTRAINT `dish_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `dish_ibfk_2` FOREIGN KEY (`kitchen_id`) REFERENCES `kitchentype` (`id`),
  ADD CONSTRAINT `dish_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `kitchentype` (`id`);

--
-- Beperkingen voor tabel `dish_info`
--
ALTER TABLE `dish_info`
  ADD CONSTRAINT `dish_info_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`id`);

--
-- Beperkingen voor tabel `grocery_list`
--
ALTER TABLE `grocery_list`
  ADD CONSTRAINT `grocery_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `grocery_list_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`);

--
-- Beperkingen voor tabel `ingredient`
--
ALTER TABLE `ingredient`
  ADD CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `ingredient_ibfk_2` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
