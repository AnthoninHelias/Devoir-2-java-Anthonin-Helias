-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 14 nov. 2022 à 22:53
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `suivimedical`
--

-- --------------------------------------------------------

--
-- Structure de la table `consultation`
--

CREATE TABLE `consultation` (
  `idConsult` int(11) NOT NULL,
  `dateConsult` date NOT NULL,
  `numPatient` int(11) NOT NULL,
  `numMedecin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `consultation`
--

INSERT INTO `consultation` (`idConsult`, `dateConsult`, `numPatient`, `numMedecin`) VALUES
(1, '2022-10-12', 1, 1),
(2, '2022-10-27', 2, 2),
(3, '2022-10-16', 2, 4),
(4, '2022-10-04', 3, 3),
(5, '2022-10-19', 3, 4),
(6, '2022-10-31', 3, 5),
(7, '2022-10-23', 4, 1),
(8, '2022-10-08', 5, 6),
(9, '2022-10-18', 5, 7),
(10, '2022-10-24', 6, 1),
(11, '2022-10-21', 7, 3),
(12, '2022-10-26', 8, 7),
(13, '2022-10-10', 8, 8),
(14, '2022-10-27', 9, 9),
(15, '2022-10-03', 9, 1),
(16, '2022-10-11', 9, 7),
(17, '2022-10-05', 10, 1),
(18, '2022-11-10', 1, 1),
(19, '2022-11-14', 1, 1),
(20, '2022-11-14', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

CREATE TABLE `medecin` (
  `idMedecin` int(11) NOT NULL,
  `nomMedecin` varchar(50) NOT NULL,
  `adresseMedecin` varchar(50) NOT NULL,
  `codePostalMedecin` varchar(50) NOT NULL,
  `villeMedecin` varchar(50) NOT NULL,
  `specialite` varchar(50) NOT NULL,
  `honoraires` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `medecin`
--

INSERT INTO `medecin` (`idMedecin`, `nomMedecin`, `adresseMedecin`, `codePostalMedecin`, `villeMedecin`, `specialite`, `honoraires`) VALUES
(1, 'Mossey', '1 rue de la Cathédrale', '91000', 'Evry', 'Généraliste', 23),
(2, 'Smigal', '25 rue les Châtaigniers', '95300', 'Pontoise', 'Neurologue', 60),
(3, 'Mabille', '108 Bd de France', '91000', 'Evry', 'Cardiologue', 65),
(4, 'Ferrat', '3 impasse du Château', '78000', 'Versailles', 'Généraliste', 30),
(5, 'Charpentier', '21 rue de la Fac', '75006', 'Paris', 'Cardiologue', 70),
(6, 'Dupont', '56 avenue de la Basilique', '93000', 'Saint-Denis', 'Généraliste', 23),
(7, 'Durant', '5 rue de la Pâture', '75005', 'Paris', 'Neurologue', 75),
(8, 'Le Maitre', '87 impasse du Cresson', '75001', 'Paris', 'Neurologue', 80),
(9, 'Martin', '50 rue Saint-Pierre', '75006', 'Paris', 'Cardiologue', 85),
(10, 'Bovagne', '10 Bd Jaurès', '95300', 'Pontoise', 'Généraliste', 23);

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

CREATE TABLE `medicament` (
  `idMedoc` int(11) NOT NULL,
  `nomMedoc` varchar(50) NOT NULL,
  `prixMedoc` double NOT NULL,
  `numVignette` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `medicament`
--

INSERT INTO `medicament` (`idMedoc`, `nomMedoc`, `prixMedoc`, `numVignette`) VALUES
(1, 'Doliprane 1000', 1.95, 1),
(2, 'Parapsyllium', 20.92, 1),
(3, 'Ursolvan', 9.8, 1),
(4, 'Flagyl', 5.08, 2),
(5, 'Ultralevure', 17.17, 2),
(6, 'Cartrex', 5.53, 2),
(7, 'Extranase', 6.46, 2),
(8, 'Bipéridys', 4.68, 3),
(9, 'Polydexa', 2.6, 3),
(10, 'Spasfon', 2.95, 3),
(11, 'Levothyrox', 4.62, 4),
(12, 'Debridat', 4.26, 4),
(13, 'Gardenal', 1.84, 4),
(14, 'Fucidine', 2.06, 4),
(15, 'Corvasal', 12.6, 4);

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

CREATE TABLE `patient` (
  `idPatient` int(11) NOT NULL,
  `nomPatient` varchar(50) NOT NULL,
  `prenomPatient` varchar(50) NOT NULL,
  `adressePatient` varchar(50) NOT NULL,
  `codePostalPatient` varchar(50) NOT NULL,
  `villePatient` varchar(50) NOT NULL,
  `mutuelle` varchar(50) NOT NULL,
  `numMedecinReferent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`idPatient`, `nomPatient`, `prenomPatient`, `adressePatient`, `codePostalPatient`, `villePatient`, `mutuelle`, `numMedecinReferent`) VALUES
(1, 'Dubreuil', 'Jean', '31 allée des Erables', '91000', 'Evry', 'Prévoyance', 1),
(2, 'Matthieu', 'Jacques', '25 rue Vauban', '78000', 'Versailles', '', 3),
(3, 'Dupont', 'Michel', '68 bd de France', '91000', 'Evry', 'Assure-Tout', 1),
(4, 'Martin', 'Charles', '15 avenue de Verdun', '93000', 'Pontoise', 'Portect', 9),
(5, 'Dufour', 'Ségolène', '20 allée des Peupliers', '93200', 'Saint-Denis', 'Protect', 5),
(6, 'Couture', 'Brigitte', '47 bd Jaurès', '91000', 'Evry', '', 1),
(7, 'Ramar', 'Jeanne', '58 impasse des Prés', '78000', 'Versailles', '', 3),
(8, 'Bernard', 'Dominique', '14 rue de Strasbourg', '93200', 'Saint-Denis', 'Prévoyance', 1),
(9, 'Poudor', 'Kevin', '21 route de Blancheface', '91000', 'Evry', 'Protect', 1),
(10, 'Percent', 'Isabelle', '36 rue Point-Carré', '95300', 'Pontoise', 'Assure-Tout', 9);

-- --------------------------------------------------------

--
-- Structure de la table `prescrire`
--

CREATE TABLE `prescrire` (
  `numConsult` int(11) NOT NULL,
  `numMedoc` int(11) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `prescrire`
--

INSERT INTO `prescrire` (`numConsult`, `numMedoc`, `quantite`) VALUES
(1, 1, 3),
(1, 2, 1),
(2, 6, 4),
(2, 15, 1),
(3, 12, 2),
(3, 13, 5),
(4, 10, 3),
(5, 7, 4),
(6, 11, 2),
(6, 12, 3),
(6, 14, 5),
(7, 6, 4),
(7, 7, 1),
(8, 10, 2),
(9, 12, 3),
(9, 13, 2),
(10, 4, 1),
(11, 1, 1),
(11, 3, 5),
(11, 7, 5),
(11, 13, 5),
(12, 6, 2),
(12, 15, 2),
(13, 6, 3),
(14, 8, 2),
(14, 11, 3),
(14, 12, 2),
(15, 10, 4),
(16, 2, 1),
(16, 14, 5),
(17, 1, 5),
(18, 1, 5),
(18, 5, 4),
(18, 11, 3),
(19, 1, 8),
(19, 7, 2),
(20, 1, 2),
(20, 7, 1),
(20, 10, 4);

-- --------------------------------------------------------

--
-- Structure de la table `vignette`
--

CREATE TABLE `vignette` (
  `idVignette` int(11) NOT NULL,
  `nomVignette` varchar(50) NOT NULL,
  `tauxRemb` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `vignette`
--

INSERT INTO `vignette` (`idVignette`, `nomVignette`, `tauxRemb`) VALUES
(1, 'Blanche', 65),
(2, 'Bleue', 30),
(3, 'Orange', 10),
(4, 'Verte', 100);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `consultation`
--
ALTER TABLE `consultation`
  ADD PRIMARY KEY (`idConsult`),
  ADD KEY `numPatient` (`numPatient`),
  ADD KEY `numMedecin` (`numMedecin`);

--
-- Index pour la table `medecin`
--
ALTER TABLE `medecin`
  ADD PRIMARY KEY (`idMedecin`);

--
-- Index pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD PRIMARY KEY (`idMedoc`),
  ADD KEY `numVignette` (`numVignette`);

--
-- Index pour la table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`idPatient`),
  ADD KEY `numMedecinReferent` (`numMedecinReferent`);

--
-- Index pour la table `prescrire`
--
ALTER TABLE `prescrire`
  ADD PRIMARY KEY (`numConsult`,`numMedoc`),
  ADD KEY `numMedoc` (`numMedoc`);

--
-- Index pour la table `vignette`
--
ALTER TABLE `vignette`
  ADD PRIMARY KEY (`idVignette`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `consultation`
--
ALTER TABLE `consultation`
  ADD CONSTRAINT `consultation_ibfk_1` FOREIGN KEY (`numPatient`) REFERENCES `patient` (`idPatient`),
  ADD CONSTRAINT `consultation_ibfk_2` FOREIGN KEY (`numMedecin`) REFERENCES `medecin` (`idMedecin`);

--
-- Contraintes pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD CONSTRAINT `medicament_ibfk_1` FOREIGN KEY (`numVignette`) REFERENCES `vignette` (`idVignette`);

--
-- Contraintes pour la table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`numMedecinReferent`) REFERENCES `medecin` (`idMedecin`);

--
-- Contraintes pour la table `prescrire`
--
ALTER TABLE `prescrire`
  ADD CONSTRAINT `prescrire_ibfk_1` FOREIGN KEY (`numConsult`) REFERENCES `consultation` (`idConsult`),
  ADD CONSTRAINT `prescrire_ibfk_2` FOREIGN KEY (`numMedoc`) REFERENCES `medicament` (`idMedoc`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
