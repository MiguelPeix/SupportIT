-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 09 avr. 2026 à 17:38
-- Version du serveur : 8.4.7
-- Version de PHP : 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tickets_support`
--

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

DROP TABLE IF EXISTS `commentaires`;
CREATE TABLE IF NOT EXISTS `commentaires` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int NOT NULL,
  `user_id` int NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commentaires`
--

INSERT INTO `commentaires` (`id`, `ticket_id`, `user_id`, `message`, `created_at`) VALUES
(1, 1, 2, 'Bonjour Miguel, nous avons bien reçu votre ticket. Pouvez-vous nous indiquer si des voyants LED s\'allument sur le côté du laptop ? Cela nous aidera à diagnostiquer si c\'est la batterie ou la carte mère.', '2026-04-01 09:30:00'),
(2, 1, 1, 'Bonjour, oui il y a un voyant orange qui clignote 3 fois puis s\'arrête. La batterie était à 20% hier soir.', '2026-04-01 10:05:00'),
(3, 1, 2, 'Ce comportement indique une erreur mémoire (code 3 bips = RAM). Nous allons passer sur votre poste cet après-midi pour tester avec de nouveaux barrettes RAM.', '2026-04-01 10:30:00'),
(4, 3, 2, 'Bonjour Miguel, veuillez ouvrir le Gestionnaire des tâches et terminer le processus \"OfficeClickToRun.exe\", puis relancez la mise à jour.', '2026-03-25 15:00:00'),
(5, 3, 1, 'Ça a fonctionné, merci ! La mise à jour s\'est bien terminée.', '2026-03-27 10:55:00'),
(6, 3, 2, 'Parfait, je ferme le ticket. N\'hésitez pas à nous recontacter.', '2026-03-27 11:00:00'),
(7, 5, 2, 'Bonjour Sophie, il s\'agit probablement d\'un fichier de config corrompu suite à une mise à jour. Pouvez-vous naviguer vers C:/ProgramData/Sage/Config et nous envoyer le fichier \"sage.ini\" ?', '2026-04-07 10:15:00'),
(8, 5, 3, 'Voilà, j\'ai trouvé le fichier. Je vous le transmets par email.', '2026-04-07 10:45:00'),
(9, 5, 2, 'Reçu, nous analysons ça. En attendant, essayez de lancer Sage en tant qu\'administrateur (clic droit > Exécuter en tant qu\'administrateur).', '2026-04-07 11:00:00'),
(10, 6, 2, 'Bonjour Sophie, essayez de supprimer et réinstaller l\'imprimante depuis Périphériques et imprimantes.', '2026-03-20 17:00:00'),
(11, 6, 3, 'Ça a résolu le problème, l\'imprimante est de nouveau en ligne. Merci !', '2026-03-21 08:55:00'),
(12, 7, 2, 'Bonjour Lucas, nous prenons ce ticket en priorité. Ne téléchargez plus rien et ne branchez aucun périphérique USB. Nous allons faire un scan complet avec Malwarebytes à distance.', '2026-04-06 13:00:00'),
(13, 7, 4, 'D\'accord, mon poste est isolé. J\'attends votre intervention.', '2026-04-06 13:15:00'),
(14, 8, 2, 'Bonjour Lucas, votre clavier est effectivement en fin de vie. Nous allons vous en livrer un nouveau ce vendredi.', '2026-03-28 15:30:00'),
(15, 8, 4, 'Reçu, merci pour la rapidité !', '2026-03-29 10:25:00'),
(16, 8, 2, 'Clavier remplacé, ticket fermé.', '2026-03-29 10:30:00'),
(17, 11, 2, 'Bonjour Camille, ce comportement peut venir du driver. Essayez de désinstaller le driver Logitech Options depuis les programmes, redémarrez, puis réinstallez la dernière version depuis le site Logitech.', '2026-04-05 09:00:00'),
(18, 11, 5, 'J\'ai réinstallé le driver mais le problème continue toujours au bout d\'un moment.', '2026-04-05 14:30:00'),
(19, 11, 2, 'Dans ce cas, ça pourrait être une interférence Bluetooth. Essayez de passer en mode filaire (USB) pour confirmer. Si le problème disparaît, on changera le dongle sans fil.', '2026-04-06 08:45:00'),
(20, 12, 2, 'Bonjour Camille, installation effectuée sur votre poste. VS Code est disponible dans le menu Démarrer. Les extensions Python et GitLens ont également été installées.', '2026-03-15 15:25:00'),
(21, 12, 5, 'Parfait, tout fonctionne. Merci beaucoup !', '2026-03-15 15:30:00');

-- --------------------------------------------------------

--
-- Structure de la table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `titre` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut` enum('ouvert','en_cours','fermé') COLLATE utf8mb4_unicode_ci DEFAULT 'ouvert',
  `priorite` enum('basse','normale','haute','urgente') COLLATE utf8mb4_unicode_ci DEFAULT 'normale',
  `categorie` enum('matériel','logiciel','réseau','autre') COLLATE utf8mb4_unicode_ci DEFAULT 'autre',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tickets`
--

INSERT INTO `tickets` (`id`, `user_id`, `titre`, `description`, `statut`, `priorite`, `categorie`, `created_at`, `updated_at`) VALUES
(1, 1, 'PC portable qui ne démarre plus', 'Mon PC portable HP EliteBook ne s\'allume plus depuis ce matin. Quand j\'appuie sur le bouton power, le voyant clignote une fois puis plus rien. J\'ai essayé de le brancher sur secteur mais rien ne change.', 'en_cours', 'urgente', 'matériel', '2026-04-01 08:15:00', '2026-04-01 09:30:00'),
(2, 1, 'Impossible d\'accéder au réseau partagé', 'Depuis la mise à jour de Windows, je n\'arrive plus à accéder au lecteur réseau Z:. Le message d\'erreur est \"Le chemin réseau est introuvable\". Les autres collègues n\'ont pas ce problème.', 'ouvert', 'haute', 'réseau', '2026-04-03 10:42:00', '2026-04-03 10:42:00'),
(3, 1, 'Mise à jour Office bloquée', 'La mise à jour de Microsoft Office 365 est bloquée à 64% depuis hier après-midi. J\'ai essayé de l\'annuler et de relancer mais ça reste bloqué au même endroit.', 'fermé', 'normale', 'logiciel', '2026-03-25 14:20:00', '2026-03-27 11:00:00'),
(4, 3, 'Écran externe non détecté', 'Mon écran externe Dell 27\" n\'est plus détecté après le remplacement de mon poste. J\'ai essayé les deux ports HDMI et DisplayPort, rien n\'apparaît dans les paramètres d\'affichage.', 'ouvert', 'normale', 'matériel', '2026-04-02 09:05:00', '2026-04-02 09:05:00'),
(5, 3, 'Logiciel de comptabilité Sage plante au démarrage', 'Sage 100 se ferme brutalement dès l\'ouverture depuis ce matin. Un message d\'erreur apparaît brièvement : \"Erreur d\'accès au fichier de configuration\". J\'ai besoin de ce logiciel pour clôturer le mois.', 'en_cours', 'urgente', 'logiciel', '2026-04-07 08:50:00', '2026-04-07 10:15:00'),
(6, 3, 'Imprimante réseau hors ligne', 'L\'imprimante HP LaserJet du couloir (IP 192.168.1.45) apparaît hors ligne sur mon poste. J\'ai redémarré le spooler d\'impression mais le problème persiste. Les autres utilisateurs impriment sans problème.', 'fermé', 'basse', 'réseau', '2026-03-20 16:30:00', '2026-03-21 09:00:00'),
(7, 4, 'Virus détecté sur le poste', 'L\'antivirus Windows Defender a détecté une menace \"Trojan:Win32/Wacatac\" sur mon poste ce matin. J\'ai mis en quarantaine mais je ne sais pas si c\'est suffisant. Le fichier venait d\'une pièce jointe email.', 'en_cours', 'urgente', 'logiciel', '2026-04-06 11:20:00', '2026-04-06 13:00:00'),
(8, 4, 'Clavier avec touches qui collent', 'Plusieurs touches de mon clavier (E, R, T) répondent de manière aléatoire. Parfois elles s\'activent deux fois, parfois pas du tout. Le clavier a environ 3 ans.', 'fermé', 'basse', 'matériel', '2026-03-28 14:00:00', '2026-03-29 10:30:00'),
(9, 4, 'VPN ne se connecte plus depuis le télétravail', 'Depuis vendredi dernier, le VPN Cisco AnyConnect refuse de se connecter depuis chez moi. Le message est \"Authentication failed\". Mon mot de passe n\'a pas changé et mes collègues n\'ont pas ce souci.', 'ouvert', 'haute', 'réseau', '2026-04-07 17:05:00', '2026-04-07 17:05:00'),
(10, 5, 'Boîte mail saturée impossible d\'envoyer', 'Je ne peux plus envoyer d\'emails depuis ce matin. Outlook affiche \"Votre boîte aux lettres est saturée\". J\'ai supprimé des anciens mails mais le problème persiste. Ma boîte fait 50 Go et est pleine.', 'ouvert', 'haute', 'logiciel', '2026-04-08 07:45:00', '2026-04-08 07:45:00'),
(11, 5, 'Souris qui saute sur l\'écran', 'Le curseur de ma souris fait des sauts brusques de façon aléatoire, environ toutes les 30 secondes. J\'ai nettoyé le capteur et changé de surface, sans succès. Souris Logitech MX Master 3.', 'en_cours', 'normale', 'matériel', '2026-04-04 13:15:00', '2026-04-05 09:00:00'),
(12, 5, 'Demande installation Visual Studio Code', 'Bonjour, pourriez-vous installer Visual Studio Code sur mon poste ? Je l\'utilise pour mes scripts Python dans le cadre du projet d\'automatisation. Merci.', 'fermé', 'basse', 'logiciel', '2026-03-15 10:00:00', '2026-03-15 15:30:00');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mot_de_passe` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('user','admin') COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `nom`, `email`, `mot_de_passe`, `role`, `created_at`) VALUES
(1, 'Miguel Peixoto', 'mipeixoto@mail.fr', '$2y$10$C/HaM1Y3EdTzmlw4MnImbOq6K9uy1DmMfFsqb7md4tOHOSHc/L5.y', 'user', '2026-04-09 19:32:42'),
(2, 'Admin', 'admin@mail.fr', '$2y$10$rrI36I6yJLtKs8Cjd54fBur6BSTs3OgyiMczy1A/4cUyRq58fSjVa', 'admin', '2026-04-09 19:33:19'),
(3, 'Sophie Marchand', 'smarchand@mail.fr', '$2y$10$WbrniYUSv37GKUqkm5Wu9.2yzxTQBCyRTtNTDI6usciJ62neACZBu', 'user', '2026-04-09 19:33:32'),
(4, 'Lucas Benoît', 'lbenoit@mail.fr', '$2y$10$WbrniYUSv37GKUqkm5Wu9.2yzxTQBCyRTtNTDI6usciJ62neACZBu', 'user', '2026-04-09 19:33:32'),
(5, 'Camille Durand', 'cdurand@mail.fr', '$2y$10$WbrniYUSv37GKUqkm5Wu9.2yzxTQBCyRTtNTDI6usciJ62neACZBu', 'user', '2026-04-09 19:33:32');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD CONSTRAINT `commentaires_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `commentaires_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
