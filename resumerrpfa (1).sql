-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 21 mai 2024 à 17:00
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `resumerrpfa`
--

-- --------------------------------------------------------

--
-- Structure de la table `candidature`
--

CREATE TABLE `candidature` (
  `ID_candidature` int(11) NOT NULL,
  `ID_chercheur` int(11) NOT NULL,
  `ID_offre` int(11) NOT NULL,
  `Statut` varchar(50) DEFAULT NULL,
  `Date_soumission` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `candidature`
--

INSERT INTO `candidature` (`ID_candidature`, `ID_chercheur`, `ID_offre`, `Statut`, `Date_soumission`) VALUES
(1, 1, 1, 'En attente', '2024-05-22'),
(2, 2, 2, 'En attente', '2024-05-22');

-- --------------------------------------------------------

--
-- Structure de la table `chercheuremploi`
--

CREATE TABLE `chercheuremploi` (
  `ID_chercheur` int(11) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Adresse` varchar(100) NOT NULL,
  `Numero_Tel` varchar(15) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `CV` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `chercheuremploi`
--

INSERT INTO `chercheuremploi` (`ID_chercheur`, `Nom`, `Prenom`, `Adresse`, `Numero_Tel`, `Email`, `Password`, `CV`) VALUES
(1, 'El Haddad', 'Ahmed', '123 Rue Hassan II, Casablanca', '0612345678', 'ahmed.elhaddad@example.com', 'hashedpassword1', 'cv_ahmed.pdf'),
(2, 'Alaoui', 'Fatima', '456 Boulevard Mohammed V, Rabat', '0623456789', 'fatima.alaoui@example.com', 'hashedpassword2', 'cv_fatima.pdf'),
(3, 'ZAIDI', 'LINA', 'ADD1', '0554457877', 'linaaa@email.com', '$2y$10$c4NUCBGt7P29RiBmmIw4JezYSZAq1vXqM0M0wH/oP7B', '01'),
(4, 'Lina', 'Z', 'add1', '062545454', 'linaaa@eemail.com', '$2y$10$zIXq.T2vNoVKG.oWpQgqn.3IHPe1F0AWUWd1T8Xt670', 'CV1'),
(5, 'chercheur1', 'ch', 'add1', '0564548978', 'linaaa@email.com', '$2y$10$0dRgDnYslY.l1ZKorLJ8muY8awjV41fxbLGA.LtpNbK', 'cv11');

-- --------------------------------------------------------

--
-- Structure de la table `chercheur_specialité`
--

CREATE TABLE `chercheur_specialité` (
  `ID_chercheur` int(11) NOT NULL,
  `ID_specialité` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cv`
--

CREATE TABLE `cv` (
  `ID_CV` int(11) NOT NULL,
  `ID_chercheur` int(11) NOT NULL,
  `URL` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE `entreprise` (
  `ID_entreprise` int(11) NOT NULL,
  `Nom` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Numero_Tel` varchar(15) DEFAULT NULL,
  `Secteur_activite` varchar(100) DEFAULT NULL,
  `Raison_sociale` varchar(100) DEFAULT NULL,
  `Password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `entreprise`
--

INSERT INTO `entreprise` (`ID_entreprise`, `Nom`, `Email`, `Numero_Tel`, `Secteur_activite`, `Raison_sociale`, `Password`) VALUES
(1, 'Tech Maroc', 'contact@techmaroc.ma', '0522456789', 'Technologie', 'SARL Tech Maroc', 'hashedpassword3'),
(2, 'Finance Plus', 'info@financeplus.ma', '0523345678', 'Finance', 'SA Finance Plus', 'hashedpassword4'),
(3, 'anil', 'anil@email.com', '0554457877', 'informatique', 'sarl', '$2y$10$nHwQUBpbAMQSCA293ZykXOxS9iT/NxWMSiJR34RRoFIi1FVbYmuK2');

-- --------------------------------------------------------

--
-- Structure de la table `offre_emploi`
--

CREATE TABLE `offre_emploi` (
  `ID_offre` int(11) NOT NULL,
  `Titre` varchar(100) NOT NULL,
  `Date_Publication` date DEFAULT NULL,
  `ID_entreprise` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `offre_emploi`
--

INSERT INTO `offre_emploi` (`ID_offre`, `Titre`, `Date_Publication`, `ID_entreprise`) VALUES
(1, 'Développeur Web', '2024-05-20', 1),
(2, 'Analyste Financier', '2024-05-21', 2);

-- --------------------------------------------------------

--
-- Structure de la table `specialité`
--

CREATE TABLE `specialité` (
  `ID_specialité` int(11) NOT NULL,
  `Nom_specialité` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `candidature`
--
ALTER TABLE `candidature`
  ADD PRIMARY KEY (`ID_candidature`),
  ADD KEY `ID_chercheur` (`ID_chercheur`),
  ADD KEY `ID_offre` (`ID_offre`);

--
-- Index pour la table `chercheuremploi`
--
ALTER TABLE `chercheuremploi`
  ADD PRIMARY KEY (`ID_chercheur`);

--
-- Index pour la table `chercheur_specialité`
--
ALTER TABLE `chercheur_specialité`
  ADD PRIMARY KEY (`ID_chercheur`,`ID_specialité`),
  ADD KEY `ID_specialité` (`ID_specialité`);

--
-- Index pour la table `cv`
--
ALTER TABLE `cv`
  ADD PRIMARY KEY (`ID_CV`),
  ADD KEY `ID_chercheur` (`ID_chercheur`);

--
-- Index pour la table `entreprise`
--
ALTER TABLE `entreprise`
  ADD PRIMARY KEY (`ID_entreprise`);

--
-- Index pour la table `offre_emploi`
--
ALTER TABLE `offre_emploi`
  ADD PRIMARY KEY (`ID_offre`),
  ADD KEY `ID_entreprise` (`ID_entreprise`);

--
-- Index pour la table `specialité`
--
ALTER TABLE `specialité`
  ADD PRIMARY KEY (`ID_specialité`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `candidature`
--
ALTER TABLE `candidature`
  MODIFY `ID_candidature` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `chercheuremploi`
--
ALTER TABLE `chercheuremploi`
  MODIFY `ID_chercheur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `cv`
--
ALTER TABLE `cv`
  MODIFY `ID_CV` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `entreprise`
--
ALTER TABLE `entreprise`
  MODIFY `ID_entreprise` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `offre_emploi`
--
ALTER TABLE `offre_emploi`
  MODIFY `ID_offre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `specialité`
--
ALTER TABLE `specialité`
  MODIFY `ID_specialité` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `candidature`
--
ALTER TABLE `candidature`
  ADD CONSTRAINT `candidature_ibfk_1` FOREIGN KEY (`ID_chercheur`) REFERENCES `chercheuremploi` (`ID_chercheur`),
  ADD CONSTRAINT `candidature_ibfk_2` FOREIGN KEY (`ID_offre`) REFERENCES `offre_emploi` (`ID_offre`);

--
-- Contraintes pour la table `chercheur_specialité`
--
ALTER TABLE `chercheur_specialité`
  ADD CONSTRAINT `chercheur_specialité_ibfk_1` FOREIGN KEY (`ID_chercheur`) REFERENCES `chercheuremploi` (`ID_chercheur`),
  ADD CONSTRAINT `chercheur_specialité_ibfk_2` FOREIGN KEY (`ID_specialité`) REFERENCES `specialité` (`ID_specialité`);

--
-- Contraintes pour la table `cv`
--
ALTER TABLE `cv`
  ADD CONSTRAINT `cv_ibfk_1` FOREIGN KEY (`ID_chercheur`) REFERENCES `chercheuremploi` (`ID_chercheur`);

--
-- Contraintes pour la table `offre_emploi`
--
ALTER TABLE `offre_emploi`
  ADD CONSTRAINT `offre_emploi_ibfk_1` FOREIGN KEY (`ID_entreprise`) REFERENCES `entreprise` (`ID_entreprise`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
