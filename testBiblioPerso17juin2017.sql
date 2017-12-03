-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 17, 2017 at 01:00 
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biblos`
--


Create Database `biblos`;

use `biblos`; 
-- --------------------------------------------------------

--
-- Table structure for table `Auteur`
--

CREATE TABLE `Auteur` (
  `Prenom` varchar(60) DEFAULT NULL,
  `Nom` varchar(100) DEFAULT NULL,
  `Date_naissance` date DEFAULT NULL,
  `Date_mort` date DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Auteur`
--

INSERT INTO `Auteur` (`Prenom`, `Nom`, `Date_naissance`, `Date_mort`, `id`) VALUES
('', 'Platon', NULL, NULL, 1),
('Flannery', 'O''Connor', NULL, NULL, 2),
('Nicolas', 'Machiavel', NULL, NULL, 7),
('Immanuel', 'Kant', NULL, NULL, 8),
('Mark', 'Twain', NULL, NULL, 9),
('Marcel', 'Proust', NULL, NULL, 10),
('Neil', 'Gaiman', NULL, NULL, 11),
('Arthur', 'Koestler', NULL, NULL, 12),
('Robert C.', 'Martin', NULL, NULL, 13),
('Ayn', 'Rand', NULL, NULL, 14),
('Joseph M.', 'Siracusa', NULL, NULL, 15),
('Paul', 'Graham', NULL, NULL, 16),
('Henri', 'Laborit', NULL, NULL, 17),
('Willard Orman', 'Quine', NULL, NULL, 18),
('Mark', 'Manson', NULL, NULL, 19),
('Stephen', 'King', NULL, NULL, 20),
('Lawrence', 'Lessig', NULL, NULL, 21);

-- --------------------------------------------------------

--
-- Table structure for table `Concept`
--

CREATE TABLE `Concept` (
  `id` int(11) NOT NULL,
  `nom_concept` varchar(50) NOT NULL,
  `definition` longtext,
  `url` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Concept`
--

INSERT INTO `Concept` (`id`, `nom_concept`, `definition`, `url`) VALUES
(3, 'Idéalisme', 'L''idéalisme est une attitude qui consiste à fonder son action ou sa conduite sur un idéal, c''est-à-dire un but élevé que l''on se propose d''atteindre. Un idéaliste est un adepte de l''idéalisme, quelqu''un qui fixe sa conduite sur un idéal ou qui se représente mal les conditions de la réalité.', 'http://www.toupie.org/Dictionnaire/Idealisme.htm'),
(4, 'Théorie de la connaissance', 'Toute théorie de la connaissance est un effort pour ramener soit l''objet au sujet, soit le sujet à l''objet. Seulement, cette réduction a été tentée de diverses façons; c''est pourquoi il y a plusieurs théories de la connaissance.\r\nEn savoir plus sur http://www.cosmovisions.com/connaissance.htm#SAQLIBCsG5FTRMLp.99', 'http://www.cosmovisions.com/connaissance.htm'),
(5, 'Relativisme', 'Le relativisme est une doctrine ou un mouvement de pensée qui affirme qu''il n''existe pas de vérité absolue. Il se décline dans les différents domaines de la connaissance humaine : philosophie, épistémologie, connaissance, logique, sociologie, culture, morale.', 'http://www.toupie.org/Dictionnaire/Relativisme.htm'),
(6, 'Racisme', 'Idéologie fondée sur la croyance qu''il existe une hiérarchie entre les groupes humains, les « races » ; comportement inspiré par cette idéologie. Attitude d''hostilité systématique à l''égard d''une catégorie déterminée de personnes : Racisme antijeunes.', 'http://www.larousse.fr/dictionnaires/francais/racisme/65932');

-- --------------------------------------------------------

--
-- Table structure for table `concept_lier_auteur`
--

CREATE TABLE `concept_lier_auteur` (
  `id` int(11) NOT NULL,
  `id_Auteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `concept_lier_auteur`
--

INSERT INTO `concept_lier_auteur` (`id`, `id_Auteur`) VALUES
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `concept_lier_oeuvre`
--

CREATE TABLE `concept_lier_oeuvre` (
  `id` int(11) NOT NULL,
  `id_Oeuvre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `concept_lier_oeuvre`
--

INSERT INTO `concept_lier_oeuvre` (`id`, `id_Oeuvre`) VALUES
(4, 2),
(6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `coordonnees`
--

CREATE TABLE `coordonnees` (
  `id` int(11) NOT NULL,
  `email` varchar(75) DEFAULT NULL,
  `facebook_id` varchar(75) DEFAULT NULL,
  `Date_modification` date DEFAULT NULL,
  `id_Usager` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coordonnees`
--

INSERT INTO `coordonnees` (`id`, `email`, `facebook_id`, `Date_modification`, `id_Usager`) VALUES
(1, 'bonin.maxime@gmail.com', NULL, '2017-03-12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ecrire`
--

CREATE TABLE `ecrire` (
  `id` int(11) NOT NULL,
  `id_Auteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ecrire`
--

INSERT INTO `ecrire` (`id`, `id_Auteur`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 7),
(5, 8),
(6, 9),
(7, 10),
(8, 11),
(9, 12),
(10, 13),
(11, 14),
(12, 15),
(13, 12),
(15, 17),
(16, 18),
(17, 19),
(18, 20),
(19, 21);

-- --------------------------------------------------------

--
-- Table structure for table `Note`
--

CREATE TABLE `Note` (
  `id` int(11) NOT NULL,
  `titre` varchar(50) DEFAULT NULL,
  `texte` longtext,
  `souvenir` tinyint(1) DEFAULT NULL,
  `reve` tinyint(1) DEFAULT NULL,
  `fiction` tinyint(1) DEFAULT NULL,
  `academique` tinyint(1) DEFAULT NULL,
  `date_creation` date NOT NULL,
  `date_modification` date NOT NULL,
  `id_Usager` int(11) DEFAULT NULL,
  `niveau_importance` int(2) DEFAULT NULL,
  `citation` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Note`
--

INSERT INTO `Note` (`id`, `titre`, `texte`, `souvenir`, `reve`, `fiction`, `academique`, `date_creation`, `date_modification`, `id_Usager`, `niveau_importance`, `citation`) VALUES
(1, 'Protagoras relativisme', 'L''homme est la mesure de toute chose.', 0, 0, 0, 0, '2017-03-12', '2017-03-12', 1, 0, 1),
(4, 'cogito', 'Je pense, donc je suis', 0, 0, 0, 0, '2017-03-23', '0000-00-00', 1, 3, 1),
(27, 'Le corps malade', 'C''est dans la maladie que nous nous rendons compte que nous ne vivons pas seuls, mais enchaînés à un être d''un règne différent, dont des abîmes nous séparent, qui ne nous connaît pas et duquel il est impossible de nous faire comprendre: notre corps. Quelque brigand que nous rencontrions sur une route, peut-être pourrons-nous arriver à le rendre sensible à son intérêt personnel sinon à notre malheur. Mais demander pitié à notre corps, c''est discourir devant une pieuvre, pour qui nos paroles ne peuvent pas avoir plus de sens que le bruit de l''eau, et avec laquelle nous serions épouvantés d''être condamnés à vivre. (page 288)', 0, 0, 0, 0, '2017-03-24', '0000-00-00', 1, 5, 1),
(30, 'prison enfant 11 ans', 'The prison industry needs to plan its future growth - many cells are they going to need? How many prisoners are there going to be, 15 years from now? And they found they could predict it very easily, using a pretty simple algorithm, based on asking what percentage of 10 and 11-year-olds  couldn''t read.', 0, 0, 0, 0, '2017-03-24', '0000-00-00', 1, 2, 1),
(31, 'nommons un chef', '"Nommons un chef et retournons en Egypte !..." (p.246)', 0, 0, 0, 0, '2017-03-26', '0000-00-00', 1, 0, 1),
(32, 'servir sans vanité', '"L''honneur c''est de servir sans vanité, et jussqu''à l''ultime conséquence" (p.249)', 0, 0, 0, 0, '2017-03-26', '0000-00-00', 1, 2, 1),
(33, 'service au Parti', 'Votre déposition au procès sera la dernier service que vous puissiez rendre au Parti. (p.250)', 0, 0, 0, 0, '2017-03-26', '0000-00-00', 1, 3, 1),
(34, 'le reste vient du Malin', 'Que votre parole soit oui, oui, non, non ; ce qu''on ajoute vient du Malin.', 0, 0, 0, 0, '2017-03-26', '0000-00-00', 1, 2, 1),
(35, 'solution diplomatie', 'Diplomacy and diplomats are today the keys to resolving the greatest challenges of the 21st century, including nuclear proliferation (Iran and North Korea, for openers), international terrorism, and global warming often touching outside the zero-sum game of inter-state competition. (p.10)', 0, 0, 0, 0, '2017-03-28', '0000-00-00', 1, 2, 1),
(36, 'le mystère', 'il est grand le mystère de la foi', 1, 0, 0, 0, '2017-03-28', '0000-00-00', 1, 0, 0),
(37, 'la Bouteille', 'Nous ne savons que trop bien ce que la Bouteille détermine chez les "goy" : des chansons d''abord, de la sentimentalité ensuite, et, pour finier, le pogrom... (p.52)', 0, 0, 0, 0, '2017-04-02', '0000-00-00', 1, 0, 1),
(38, 'vie communautaire', 'La vie communautaire est révolutionnaire parce qu''elle rend l''agriculture possible avec une journée de travail de huit heures et en fait de la sorte une occupation civilisée. À partir de 5 heures du soir, je dispose librement de mon temps. Et, à tout prendre, le but final du socialisme n''est-il pas la conquête du loisir ? (p.101)', 0, 0, 0, 0, '2017-04-02', '0000-00-00', 1, 0, 1),
(39, 'se plaindre', 'Dis à nos invités, dit le Mukhtar d''un ton mesuré, que nous ne sommes pas de ceux qui se plaignent sans cesse de leurs malheurs comme le font certaines gens. Nous n''avons pas de bureaux de propagande dans les capitables d''Europe et nous ne possédons pas d''or pour acheter des journaux et des amis influents. Nous sommes un peuple simple, pauvre et travailleur, et nous demandons simplement que la terre ayant appartenu à nos pères et aux pères de nos pères ne nou ssoit pas enlevée. (p.143)', 0, 0, 0, 0, '2017-04-03', '0000-00-00', 1, 2, 1),
(40, 'instruction des Arabes', 'Depuis quans l''instruction des Arabes vous tient-elle tant à coeur ? fit Mr. Newton en s''efforçant de prendre un ton sarcastique.\r\n\r\nDepuis que j''ai découvert que le seul moyen d''arriver à nous entendre avec eux est de les faire convenablement instruire. On ne peut arriver à un accord avec une horde fanatique d''illetrés. Je voudrais qu''on leur mit un peu de bon sens dans la tête afin que nous ayons en face de nous des adultes avec qui traiter. (p.151)', 0, 0, 0, 0, '2017-04-03', '0000-00-00', 1, 2, 1),
(41, 'récit création arabe', 'Au commencement du monde, il n''y avait rien qu''un fort tourbillon dans le désert: Dieu attrapa une bouffée de ce vent et en fit un Bédouin. Ce Bédouin tira une flèche en l''air ; Dieu s''en saisit et fit le chameau. Puis il se pencha, ramassa un bloc d''argile et en fit l''âne. Après cela, Dieu vit qu''il avait oublié quelque chose : il se pencha de nouveau, ramassa la crotte que l''âne avait laissé tomber et en fit le paysan ', 0, 0, 0, 0, '2017-04-03', '0000-00-00', 1, 2, 1),
(42, 'hébreux pétrification', 'Tirer l''hébreu de sa sainte pétrification pour en refaire une langue vivante a été un tour de force fantastique. (p.167)', 0, 0, 0, 0, '2017-04-03', '0000-00-00', 1, 2, 1),
(43, 'race objective', 'Une race qui reste objective quand sa vie est en jeu est destinée à se perdre. (p.173)', 0, 0, 0, 0, '2017-04-03', '0000-00-00', 1, 3, 1),
(44, 'arabes moyen-age', 'Les Arabes sont des survivants du Moyen Age. Ils n''ont pas de conception de ce qu''est une nation et pas de discipline ; ce sont de bons émeutiers et de mauvais combattants ; s''il n''en était pas ainsi aucune de nos colonies isolées n''aurait pu se maintenir.', 0, 0, 0, 0, '2017-04-03', '0000-00-00', 1, 2, 1),
(45, 'feeling left out', 'Can you imagine feeling left out because your father kept you out of a family suicide ?', 0, 0, 0, 0, '2017-04-04', '0000-00-00', 1, 2, 1),
(46, 'infanticide allemand', 'On rapporte d''une source allemande sûre, dont l''origine ne peut être révélée, que depuis quelque temps, il est procédé, dans les orphelinats d''État, à des expériences sur la liquidation indolore d''enfants incurablement infirmes, déments ou d''une hérédité raciale indésirable. Le méthodes employées sont des injections de phénol dans l''aorte, des injections intraveineuses d''air, qui déterminent un trombus, et l''asphyxie dans les chambres remplies d''anhydride carbonique. (p.203)', 0, 0, 0, 0, '2017-04-05', '0000-00-00', 1, 2, 1),
(47, 'assurance convaincante', 'Son assurance était si convaincante qu''elle sapait la résistance de mon jugement. Son contact agissait toujours sur moi à la manière des vases communicants. Il me vidait de mes facultés critiques et me remplissait de foi.', 0, 0, 0, 0, '2017-04-05', '0000-00-00', 1, 2, 1),
(48, 'ressort horloger', 'Aucun horloger n''est capable de réparer un ressort cassé : on est obligé d''en acheter un autre. (p.298)', 0, 0, 0, 0, '2017-04-07', '0000-00-00', 1, 2, 1),
(49, 'boue mauvais', 'Si l''on ne cesse de jeter de la boue sur les gens ils finissent par sentir mauvais. (p.299)', 0, 0, 0, 0, '2017-04-07', '0000-00-00', 1, 2, 1),
(50, 'race malade', 'Mais les Juifs sont une race malade ; leur maladie est d''être déraciné ; ils ne peuvent être guéris qu''en prenant de  nouveau racine dans leur terre. (p.300)', 0, 0, 0, 0, '2017-04-07', '0000-00-00', 1, 3, 1),
(51, 'Massada', 'Mais je trouve que vous êtes un peuple n evalant pas mieux que les autres, ni en vertu ni en courage ; vous avez peur de mourir, bien que la mort délivre de la plus grande misère. Car les lois de notre pays et celle de Dieu lui-même nous ont appris depuis les temps les plus reculés que c''est la vie qui est une calamité et non la mort ; l''union de ce qui est divin et de ce qui est mortel est désagréable...', 0, 0, 0, 0, '2017-04-07', '0000-00-00', 1, 5, 1),
(52, 'instinct obéissance', 'il y  a en chaque homme un petit cadet qui a envie de claquer des talons (p.328)', 0, 0, 0, 0, '2017-04-08', '0000-00-00', 1, 2, 1),
(53, 'conscience du genre humain ', '(Puis tous se lassèrent et se calmèrent, et la loi de l''universelle indifférence triompha ;) car la conscience du genre humain est une sorte de vapeur diffuse qui se condense rarement assez pour être effectivement utile. (p.343)', 0, 0, 0, 0, '2017-04-08', '0000-00-00', 1, 3, 1),
(54, 'évolution différenciation', 'Toute évolution tend vers une différenciation plus explicite (.370)', 0, 0, 0, 0, '2017-04-08', '0000-00-00', 1, 2, 1),
(55, 'juifs accident biologique', 'les Juifs ne sont pas un accident biologique, mais les représentants de la condition humaine portée à l''extrême, une portion de l''espèce écorchée vive. (p.378)', 0, 0, 0, 0, '2017-04-08', '0000-00-00', 1, 2, 1),
(56, 'fatigue idée préconçue', 'La fatigue est la réalisation organique d''une idée préconçue. (p.296)', 0, 0, 0, 0, '2017-04-09', '0000-00-00', 1, 2, 1),
(57, 'Maker''s schedule', '	\r\n\r\nMaker''s Schedule, Manager''s Schedule \r\n\r\n Want to start a startup? Get funded by Y Combinator. \r\n\r\nJuly 2009\r\n\r\nOne reason programmers dislike meetings so much is that they''re on a different type of schedule from other people. Meetings cost them more.\r\n\r\nThere are two types of schedule, which I''ll call the manager''s schedule and the maker''s schedule. The manager''s schedule is for bosses. It''s embodied in the traditional appointment book, with each day cut into one hour intervals. You can block off several hours for a single task if you need to, but by default you change what you''re doing every hour.\r\n\r\nWhen you use time that way, it''s merely a practical problem to meet with someone. Find an open slot in your schedule, book them, and you''re done.\r\n\r\nMost powerful people are on the manager''s schedule. It''s the schedule of command. But there''s another way of using time that''s common among people who make things, like programmers and writers. They generally prefer to use time in units of half a day at least. You can''t write or program well in units of an hour. That''s barely enough time to get started.\r\n\r\nWhen you''re operating on the maker''s schedule, meetings are a disaster. A single meeting can blow a whole afternoon, by breaking it into two pieces each too small to do anything hard in. Plus you have to remember to go to the meeting. That''s no problem for someone on the manager''s schedule. There''s always something coming on the next hour; the only question is what. But when someone on the maker''s schedule has a meeting, they have to think about it.\r\n\r\nFor someone on the maker''s schedule, having a meeting is like throwing an exception. It doesn''t merely cause you to switch from one task to another; it changes the mode in which you work.\r\n\r\nI find one meeting can sometimes affect a whole day. A meeting commonly blows at least half a day, by breaking up a morning or afternoon. But in addition there''s sometimes a cascading effect. If I know the afternoon is going to be broken up, I''m slightly less likely to start something ambitious in the morning. I know this may sound oversensitive, but if you''re a maker, think of your own case. Don''t your spirits rise at the thought of having an entire day free to work, with no appointments at all? Well, that means your spirits are correspondingly depressed when you don''t. And ambitious projects are by definition close to the limits of your capacity. A small decrease in morale is enough to kill them off.\r\n\r\nEach type of schedule works fine by itself. Problems arise when they meet. Since most powerful people operate on the manager''s schedule, they''re in a position to make everyone resonate at their frequency if they want to. But the smarter ones restrain themselves, if they know that some of the people working for them need long chunks of time to work in.\r\n\r\nOur case is an unusual one. Nearly all investors, including all VCs I know, operate on the manager''s schedule. But Y Combinator runs on the maker''s schedule. Rtm and Trevor and I do because we always have, and Jessica does too, mostly, because she''s gotten into sync with us.\r\n\r\nI wouldn''t be surprised if there start to be more companies like us. I suspect founders may increasingly be able to resist, or at least postpone, turning into managers, just as a few decades ago they started to be able to resist switching from jeans to suits.\r\n\r\nHow do we manage to advise so many startups on the maker''s schedule? By using the classic device for simulating the manager''s schedule within the maker''s: office hours. Several times a week I set aside a chunk of time to meet founders we''ve funded. These chunks of time are at the end of my working day, and I wrote a signup program that ensures all the appointments within a given set of office hours are clustered at the end. Because they come at the end of my day these meetings are never an interruption. (Unless their working day ends at the same time as mine, the meeting presumably interrupts theirs, but since they made the appointment it must be worth it to them.) During busy periods, office hours sometimes get long enough that they compress the day, but they never interrupt it.\r\n\r\nWhen we were working on our own startup, back in the 90s, I evolved another trick for partitioning the day. I used to program from dinner till about 3 am every day, because at night no one could interrupt me. Then I''d sleep till about 11 am, and come in and work until dinner on what I called "business stuff." I never thought of it in these terms, but in effect I had two workdays each day, one on the manager''s schedule and one on the maker''s.\r\n\r\nWhen you''re operating on the manager''s schedule you can do something you''d never want to do on the maker''s: you can have speculative meetings. You can meet someone just to get to know one another. If you have an empty slot in your schedule, why not? Maybe it will turn out you can help one another in some way.\r\n\r\nBusiness people in Silicon Valley (and the whole world, for that matter) have speculative meetings all the time. They''re effectively free if you''re on the manager''s schedule. They''re so common that there''s distinctive language for proposing them: saying that you want to "grab coffee," for example.\r\n\r\nSpeculative meetings are terribly costly if you''re on the maker''s schedule, though. Which puts us in something of a bind. Everyone assumes that, like other investors, we run on the manager''s schedule. So they introduce us to someone they think we ought to meet, or send us an email proposing we grab coffee. At this point we have two options, neither of them good: we can meet with them, and lose half a day''s work; or we can try to avoid meeting them, and probably offend them.\r\n\r\nTill recently we weren''t clear in our own minds about the source of the problem. We just took it for granted that we had to either blow our schedules or offend people. But now that I''ve realized what''s going on, perhaps there''s a third option: to write something explaining the two types of schedule. Maybe eventually, if the conflict between the manager''s schedule and the maker''s schedule starts to be more widely understood, it will become less of a problem.\r\n\r\nThose of us on the maker''s schedule are willing to compromise. We know we have to have some number of meetings. All we ask from those on the manager''s schedule is that they understand the cost.\r\n\r\nhttp://www.paulgraham.com/makersschedule.html', 0, 0, 0, 0, '2017-04-09', '0000-00-00', 1, 3, 1),
(58, 'finalité fondamentale', 'La finalité fondamentale d''un organisme vivant est la recherche du plaisir qui s''obtient par la dominance.', 0, 0, 0, 0, '2017-04-16', '0000-00-00', 1, 5, 1),
(59, 'science sens commun', 'La science n''est que le sens commun devenu conscient (p.28)', 0, 0, 0, 0, '2017-04-29', '0000-00-00', 1, 3, 0),
(60, 'la mort aujourd''hui', 'Nous disons bien que l''heure de la mort est incertaines, mais quand nous disons cela, nous nous représentons cette heure comme située dans un espace vague et lointain, nous ne pensons pas qu''elle ait un rapport quelconque avec la journée déjà commencée et puisse signifier que la mort - ou sa première prise de possession partielle de nous, après laquelle elle ne nous lâchera plus - pourra produire dans cet après-midi même, si peu incertain, cet après-midi où l''emploi de toutes les heures est réglé d''avance.', 0, 0, 0, 0, '2017-05-07', '0000-00-00', 1, 2, 1),
(61, 'sou du franc', 'note de la page 311 : \r\n\r\nle ''sous du franc'' est la remise de cinq centimes par franc d''achat qu''un commerçant consent parfois à un domestique qui se fournit chez lui', 0, 0, 0, 0, '2017-05-07', '0000-00-00', 1, 2, 0),
(62, 'yes man', 'No one trust a yes-man', 0, 0, 0, 0, '2017-05-14', '0000-00-00', 1, 2, 1),
(63, 'cap de bonne espérance', 'Ele dobra o Cabo da Boa Esperança', 0, 0, 0, 0, '2017-05-14', '0000-00-00', 1, 2, 1),
(64, 'do the day', 'Do the day and let the day do you\r\n(Wireman)', 0, 0, 0, 0, '2017-05-21', '0000-00-00', 1, 2, 1),
(65, 'chicago fair', 'A sign above one of the portals at the 1933 Chicago''s World Fair put it ''Science explores: Technology executes: Man conforms'' ', 0, 0, 0, 0, '2017-06-03', '0000-00-00', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `note_concernant_auteur`
--

CREATE TABLE `note_concernant_auteur` (
  `id` int(11) NOT NULL,
  `id_Auteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `note_concernant_auteur`
--

INSERT INTO `note_concernant_auteur` (`id`, `id_Auteur`) VALUES
(27, 10),
(30, 11),
(31, 12),
(32, 12),
(33, 12),
(35, 15),
(37, 12),
(38, 12),
(39, 12),
(40, 12),
(41, 12),
(42, 12),
(43, 12),
(44, 12),
(46, 12),
(47, 12),
(48, 12),
(49, 12),
(50, 12),
(51, 12),
(52, 12),
(53, 12),
(54, 12),
(55, 12),
(56, 10),
(57, 16),
(58, 17),
(59, 18),
(60, 10),
(61, 10),
(62, 19),
(63, 19),
(64, 20),
(65, 21);

-- --------------------------------------------------------

--
-- Table structure for table `note_concernant_oeuvre`
--

CREATE TABLE `note_concernant_oeuvre` (
  `id` int(11) NOT NULL,
  `id_Oeuvre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `note_concernant_oeuvre`
--

INSERT INTO `note_concernant_oeuvre` (`id`, `id_Oeuvre`) VALUES
(27, 7),
(30, 8),
(31, 9),
(32, 9),
(33, 9),
(35, 12),
(37, 13),
(38, 13),
(39, 13),
(40, 13),
(41, 13),
(42, 13),
(43, 13),
(44, 13),
(45, 14),
(46, 13),
(47, 13),
(48, 13),
(49, 13),
(50, 13),
(51, 13),
(52, 13),
(53, 13),
(54, 13),
(55, 13),
(56, 7),
(58, 15),
(59, 16),
(60, 7),
(61, 7),
(62, 17),
(63, 17),
(64, 18),
(65, 19);

-- --------------------------------------------------------

--
-- Table structure for table `note_lier_concept`
--

CREATE TABLE `note_lier_concept` (
  `id` int(11) NOT NULL,
  `id_Concept` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `note_lier_concept`
--

INSERT INTO `note_lier_concept` (`id`, `id_Concept`) VALUES
(1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Oeuvre`
--

CREATE TABLE `Oeuvre` (
  `id` int(11) NOT NULL,
  `titre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Oeuvre`
--

INSERT INTO `Oeuvre` (`id`, `titre`) VALUES
(1, 'La république'),
(2, 'Théétète'),
(3, 'Every thing that rises must converge'),
(4, 'Le Prince'),
(5, 'Critique de la raison pure'),
(6, 'Adventures of Huckleberry Finn'),
(7, 'Le Côté de Guermantes'),
(8, 'Neil Gaiman: Why our future depends on libraries, reading and daydreaming'),
(9, 'Le zéro et l''infini'),
(10, 'Clean code'),
(11, 'Atlas shrugged'),
(12, 'Diplomacy: A very Short introduction'),
(13, 'La tour d''Ezra'),
(14, 'The Discovery'),
(15, 'La nouvelle grille'),
(16, 'Le mot et la chose'),
(17, 'The Subtle Art of Not Giving a Fuck'),
(18, 'Duma Key'),
(19, 'Code and other laws of cyberspace');

-- --------------------------------------------------------

--
-- Table structure for table `Usager`
--

CREATE TABLE `Usager` (
  `id` int(11) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(12) DEFAULT NULL,
  `auth_string` varchar(100) DEFAULT NULL,
  `date_creation` date NOT NULL,
  `id_coordonnees` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Usager`
--

INSERT INTO `Usager` (`id`, `Prenom`, `Nom`, `username`, `password`, `auth_string`, `date_creation`, `id_coordonnees`) VALUES
(1, 'Maxime', 'Bonin', 'maxbo', 'soleil1', NULL, '2017-03-12', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Auteur`
--
ALTER TABLE `Auteur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Concept`
--
ALTER TABLE `Concept`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `concept_lier_auteur`
--
ALTER TABLE `concept_lier_auteur`
  ADD PRIMARY KEY (`id`,`id_Auteur`),
  ADD KEY `FK_lier_auteur_id_Auteur` (`id_Auteur`);

--
-- Indexes for table `concept_lier_oeuvre`
--
ALTER TABLE `concept_lier_oeuvre`
  ADD PRIMARY KEY (`id`,`id_Oeuvre`),
  ADD KEY `FK_lier_oeuvre_id_Oeuvre` (`id_Oeuvre`);

--
-- Indexes for table `coordonnees`
--
ALTER TABLE `coordonnees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_coordonnees_id_Usager` (`id_Usager`);

--
-- Indexes for table `ecrire`
--
ALTER TABLE `ecrire`
  ADD PRIMARY KEY (`id`,`id_Auteur`),
  ADD KEY `FK_ecrire_id_Auteur` (`id_Auteur`);

--
-- Indexes for table `Note`
--
ALTER TABLE `Note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Note_id_Usager` (`id_Usager`);

--
-- Indexes for table `note_concernant_auteur`
--
ALTER TABLE `note_concernant_auteur`
  ADD PRIMARY KEY (`id`,`id_Auteur`),
  ADD KEY `FK_concerner_auteur_id_Auteur` (`id_Auteur`);

--
-- Indexes for table `note_concernant_oeuvre`
--
ALTER TABLE `note_concernant_oeuvre`
  ADD PRIMARY KEY (`id`,`id_Oeuvre`),
  ADD KEY `FK_concerner_oeuvre_id_Oeuvre` (`id_Oeuvre`);

--
-- Indexes for table `note_lier_concept`
--
ALTER TABLE `note_lier_concept`
  ADD PRIMARY KEY (`id`,`id_Concept`),
  ADD KEY `FK_note_lier_concept_id_Concept` (`id_Concept`);

--
-- Indexes for table `Oeuvre`
--
ALTER TABLE `Oeuvre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Usager`
--
ALTER TABLE `Usager`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Usager_id_coordonnees` (`id_coordonnees`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Auteur`
--
ALTER TABLE `Auteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `Concept`
--
ALTER TABLE `Concept`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `coordonnees`
--
ALTER TABLE `coordonnees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Note`
--
ALTER TABLE `Note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT for table `Oeuvre`
--
ALTER TABLE `Oeuvre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `Usager`
--
ALTER TABLE `Usager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `concept_lier_auteur`
--
ALTER TABLE `concept_lier_auteur`
  ADD CONSTRAINT `FK_lier_auteur_id` FOREIGN KEY (`id`) REFERENCES `Concept` (`id`),
  ADD CONSTRAINT `FK_lier_auteur_id_Auteur` FOREIGN KEY (`id_Auteur`) REFERENCES `Auteur` (`id`);

--
-- Constraints for table `concept_lier_oeuvre`
--
ALTER TABLE `concept_lier_oeuvre`
  ADD CONSTRAINT `FK_lier_oeuvre_id` FOREIGN KEY (`id`) REFERENCES `Concept` (`id`),
  ADD CONSTRAINT `FK_lier_oeuvre_id_Oeuvre` FOREIGN KEY (`id_Oeuvre`) REFERENCES `Oeuvre` (`id`);

--
-- Constraints for table `coordonnees`
--
ALTER TABLE `coordonnees`
  ADD CONSTRAINT `FK_coordonnees_id_Usager` FOREIGN KEY (`id_Usager`) REFERENCES `Usager` (`id`);

--
-- Constraints for table `ecrire`
--
ALTER TABLE `ecrire`
  ADD CONSTRAINT `FK_ecrire_id` FOREIGN KEY (`id`) REFERENCES `Oeuvre` (`id`),
  ADD CONSTRAINT `FK_ecrire_id_Auteur` FOREIGN KEY (`id_Auteur`) REFERENCES `Auteur` (`id`);

--
-- Constraints for table `Note`
--
ALTER TABLE `Note`
  ADD CONSTRAINT `FK_Note_id_Usager` FOREIGN KEY (`id_Usager`) REFERENCES `Usager` (`id`);

--
-- Constraints for table `note_concernant_auteur`
--
ALTER TABLE `note_concernant_auteur`
  ADD CONSTRAINT `FK_concerner_auteur_id` FOREIGN KEY (`id`) REFERENCES `Note` (`id`),
  ADD CONSTRAINT `FK_concerner_auteur_id_Auteur` FOREIGN KEY (`id_Auteur`) REFERENCES `Auteur` (`id`);

--
-- Constraints for table `note_concernant_oeuvre`
--
ALTER TABLE `note_concernant_oeuvre`
  ADD CONSTRAINT `FK_concerner_oeuvre_id` FOREIGN KEY (`id`) REFERENCES `Note` (`id`),
  ADD CONSTRAINT `FK_concerner_oeuvre_id_Oeuvre` FOREIGN KEY (`id_Oeuvre`) REFERENCES `Oeuvre` (`id`);

--
-- Constraints for table `note_lier_concept`
--
ALTER TABLE `note_lier_concept`
  ADD CONSTRAINT `FK_note_lier_concept_id` FOREIGN KEY (`id`) REFERENCES `Note` (`id`),
  ADD CONSTRAINT `FK_note_lier_concept_id_Concept` FOREIGN KEY (`id_Concept`) REFERENCES `Concept` (`id`);

--
-- Constraints for table `Usager`
--
ALTER TABLE `Usager`
  ADD CONSTRAINT `FK_Usager_id_coordonnees` FOREIGN KEY (`id_coordonnees`) REFERENCES `coordonnees` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
