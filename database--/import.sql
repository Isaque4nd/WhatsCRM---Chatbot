-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 15, 2025 at 02:54 PM
-- Server version: 10.6.22-MariaDB
-- PHP Version: 8.3.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `whatscrm`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(999) DEFAULT NULL,
  `password` varchar(999) DEFAULT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `role` varchar(999) NOT NULL DEFAULT 'admin',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `uid`, `role`, `createdAt`) VALUES
(1, 'admin@admin.com', '$2b$10$OUmfMxfNYQOw4yGtYWzQV./vpMHKYDXzkn6q2FK58hO8uzYuqdFcq', 'XhbfYkIAC1bYGhUodfJppmRCEUyGQJCZ', 'admin', '2024-01-31 13:54:21');

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` int(11) NOT NULL,
  `owner_uid` varchar(999) DEFAULT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `role` varchar(999) DEFAULT 'agent',
  `email` varchar(999) DEFAULT NULL,
  `password` varchar(999) DEFAULT NULL,
  `name` varchar(999) DEFAULT NULL,
  `mobile` varchar(999) DEFAULT NULL,
  `comments` longtext DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `logs` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `owner_uid`, `uid`, `role`, `email`, `password`, `name`, `mobile`, `comments`, `is_active`, `createdAt`, `logs`) VALUES
(3, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'n9xrxIvwIajEo2JO2poQ0b3UyUnhUF3g', 'agent', 'john@agent.com', '$2b$10$JGNSEHq.tErhcQKmvuh6PuWCVXWzxWIZ.WrnkuDNp8izuDgsWkZi.', 'john', '7778888000', 'some comments', 1, '2024-04-06 06:45:15', '{\"dateTracking\":{\"2025-06-03\":{\"logins\":3,\"logouts\":3,\"lastLogin\":\"2025-06-03T12:44:57.454Z\",\"lastLogout\":\"2025-06-03T12:45:18.979Z\"},\"2025-06-07\":{\"logins\":2,\"logouts\":0,\"lastLogin\":\"2025-06-07T05:31:42.255Z\",\"lastLogout\":null}},\"spendTime\":{\"2025-06-03\":55,\"2025-06-04\":260,\"2025-06-07\":70,\"2025-06-10\":415}}');

-- --------------------------------------------------------

--
-- Table structure for table `agent_chats`
--

CREATE TABLE `agent_chats` (
  `id` int(11) NOT NULL,
  `owner_uid` varchar(999) DEFAULT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `chat_id` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agent_chats`
--

INSERT INTO `agent_chats` (`id`, `owner_uid`, `uid`, `chat_id`, `createdAt`) VALUES
(17, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'n9xrxIvwIajEo2JO2poQ0b3UyUnhUF3g', 'jjjSjiuijujS', '2025-02-04 16:10:26'),
(19, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'n9xrxIvwIajEo2JO2poQ0b3UyUnhUF3g', 'jjBIuiiBBuii', '2025-02-08 15:25:12'),
(20, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'n9xrxIvwIajEo2JO2poQ0b3UyUnhUF3g', '918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8_dQ18NwdM', '2025-03-14 10:21:40'),
(21, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'n9xrxIvwIajEo2JO2poQ0b3UyUnhUF3g', '918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8_l3uI0PJB', '2025-03-20 10:02:06'),
(24, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'n9xrxIvwIajEo2JO2poQ0b3UyUnhUF3g', '918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8_NBaGj1t6', '2025-04-05 09:54:50'),
(25, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'n9xrxIvwIajEo2JO2poQ0b3UyUnhUF3g', '918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8_BCCT5dGr', '2025-05-10 07:52:41');

-- --------------------------------------------------------

--
-- Table structure for table `agent_task`
--

CREATE TABLE `agent_task` (
  `id` int(11) NOT NULL,
  `owner_uid` varchar(999) DEFAULT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `title` varchar(999) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `agent_comments` longtext DEFAULT NULL,
  `status` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agent_task`
--

INSERT INTO `agent_task` (`id`, `owner_uid`, `uid`, `title`, `description`, `agent_comments`, `status`, `createdAt`) VALUES
(2, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'n9xrxIvwIajEo2JO2poQ0b3UyUnhUF3g', 'holiday ', 'tell all customer that its holiday', 'this was done', 'COMPLETED', '2024-04-09 06:51:55');

-- --------------------------------------------------------

--
-- Table structure for table `auth`
--

CREATE TABLE `auth` (
  `session` varchar(50) NOT NULL,
  `id` varchar(80) NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`value`))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `beta_campaign`
--

CREATE TABLE `beta_campaign` (
  `id` int(11) NOT NULL,
  `campaign_id` varchar(999) NOT NULL,
  `uid` varchar(999) NOT NULL,
  `title` varchar(999) NOT NULL,
  `template_name` varchar(999) NOT NULL,
  `template_language` varchar(999) NOT NULL,
  `phonebook_id` varchar(999) NOT NULL,
  `phonebook_name` varchar(999) NOT NULL,
  `status` varchar(999) NOT NULL DEFAULT 'PENDING',
  `total_contacts` int(11) NOT NULL DEFAULT 0,
  `sent_count` int(11) NOT NULL DEFAULT 0,
  `delivered_count` int(11) NOT NULL DEFAULT 0,
  `read_count` int(11) NOT NULL DEFAULT 0,
  `failed_count` int(11) NOT NULL DEFAULT 0,
  `body_variables` longtext DEFAULT NULL,
  `header_variable` longtext DEFAULT NULL,
  `button_variables` longtext DEFAULT NULL,
  `schedule` datetime DEFAULT NULL,
  `timezone` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `beta_campaign`
--

INSERT INTO `beta_campaign` (`id`, `campaign_id`, `uid`, `title`, `template_name`, `template_language`, `phonebook_id`, `phonebook_name`, `status`, `total_contacts`, `sent_count`, `delivered_count`, `read_count`, `failed_count`, `body_variables`, `header_variable`, `button_variables`, `schedule`, `timezone`, `createdAt`) VALUES
(1, 'iEZchaDNxG', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'send campaign', '5_june_image', 'en', '14', 'own', 'COMPLETED', 8, 8, 8, 0, 0, '[\"jonny\",\"some\"]', '{\"type\":\"image\",\"url\":\"https://fastly.picsum.photos/id/939/536/354.jpg?hmac=MzhzEGKdBTlJFJLcMXFA6wjfiRh0DH9jtEsaP22Uxuc\",\"filename\":\"media\"}', '[]', NULL, NULL, '2025-06-06 15:59:54'),
(3, 'TdFgVFccVj', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'testing with image', '5_june_image', 'en', '37', 'Codeyon', 'COMPLETED', 4, 4, 4, 0, 0, '[\"{{{name}}}\",\"STOP\"]', '{\"type\":\"image\",\"url\":\"https://fastly.picsum.photos/id/836/536/354.jpg?hmac=6DJI0i2qXgGNI-umMm2GYjiwrE9iL_mEUyPB_Gim2Ec\",\"filename\":\"media\"}', '[]', NULL, NULL, '2025-06-10 10:18:55');

-- --------------------------------------------------------

--
-- Table structure for table `beta_campaign_logs`
--

CREATE TABLE `beta_campaign_logs` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) NOT NULL,
  `campaign_id` varchar(999) NOT NULL,
  `contact_name` varchar(999) NOT NULL,
  `contact_mobile` varchar(999) NOT NULL,
  `meta_msg_id` varchar(999) DEFAULT NULL,
  `status` varchar(999) NOT NULL DEFAULT 'PENDING',
  `delivery_status` varchar(999) DEFAULT NULL,
  `delivery_time` varchar(999) DEFAULT NULL,
  `error_message` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `beta_campaign_logs`
--

INSERT INTO `beta_campaign_logs` (`id`, `uid`, `campaign_id`, `contact_name`, `contact_mobile`, `meta_msg_id`, `status`, `delivery_status`, `delivery_time`, `error_message`, `createdAt`) VALUES
(1, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'iEZchaDNxG', 'Codeyon 2', '919690309316', 'wamid.HBgMOTE5NjkwMzA5MzE2FQIAERgSNUM5RTg4ODIwODNFOEJFRUM1AA==', 'SENT', 'delivered', '2025-06-06T16:00:05.224Z', NULL, '2025-06-06 15:59:55'),
(2, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'iEZchaDNxG', 'codeyon', '918430088300', 'wamid.HBgMOTE4NDMwMDg4MzAwFQIAERgSREUyRjgwNTFFREJCOTQ4NENCAA==', 'SENT', 'delivered', '2025-06-06T16:00:06.418Z', NULL, '2025-06-06 15:59:55'),
(3, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'iEZchaDNxG', 'Codeyon 2', '919690309316', 'wamid.HBgMOTE5NjkwMzA5MzE2FQIAERgSOTQyRjZFNzZBMzEzRDEyMUU4AA==', 'SENT', 'delivered', '2025-06-06T16:00:07.919Z', NULL, '2025-06-06 15:59:55'),
(4, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'iEZchaDNxG', 'codeyon', '918430088300', 'wamid.HBgMOTE4NDMwMDg4MzAwFQIAERgSQjlDQzgwODQ0NUM3QzA3QkE1AA==', 'SENT', 'delivered', '2025-06-06T16:00:09.686Z', NULL, '2025-06-06 15:59:55'),
(5, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'iEZchaDNxG', 'Codeyon 2', '919690309316', 'wamid.HBgMOTE5NjkwMzA5MzE2FQIAERgSNkMwRDRENzNFMDY3MkQ2NjU3AA==', 'SENT', 'delivered', '2025-06-06T16:00:11.282Z', NULL, '2025-06-06 15:59:55'),
(6, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'iEZchaDNxG', 'codeyon', '918430088300', 'wamid.HBgMOTE4NDMwMDg4MzAwFQIAERgSRkZGMERGNkMxNkM0QkIzQzkwAA==', 'SENT', 'delivered', '2025-06-06T16:00:13.229Z', NULL, '2025-06-06 15:59:55'),
(7, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'iEZchaDNxG', 'Codeyon 2', '919690309316', 'wamid.HBgMOTE5NjkwMzA5MzE2FQIAERgSNkFCRDNGNEQzQUY4N0IwNjU1AA==', 'SENT', 'delivered', '2025-06-06T16:00:14.831Z', NULL, '2025-06-06 15:59:55'),
(8, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'iEZchaDNxG', 'codeyon', '918430088300', 'wamid.HBgMOTE4NDMwMDg4MzAwFQIAERgSMUMyQTFCQjYyM0VBQTgwMUM2AA==', 'SENT', 'delivered', '2025-06-06T16:00:16.643Z', NULL, '2025-06-06 15:59:55'),
(13, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'TdFgVFccVj', 'Codeyon Number', '918430088300', 'wamid.HBgMOTE4NDMwMDg4MzAwFQIAERgSNzJBRjFBOTY3QzlBNTAyQzc4AA==', 'SENT', 'delivered', '2025-06-10T10:19:15.519Z', NULL, '2025-06-10 10:18:55'),
(14, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'TdFgVFccVj', 'codeyon', '918430088300', 'wamid.HBgMOTE4NDMwMDg4MzAwFQIAERgSMEExM0U5MUM0REU1NzI2MDMwAA==', 'SENT', 'delivered', '2025-06-10T10:19:15.828Z', NULL, '2025-06-10 10:18:55'),
(15, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'TdFgVFccVj', 'codeyon', '918430088300', 'wamid.HBgMOTE4NDMwMDg4MzAwFQIAERgSQjlFNTFBNUE4NzhFQkMwQzdBAA==', 'SENT', 'delivered', '2025-06-10T10:19:19.718Z', NULL, '2025-06-10 10:18:55'),
(16, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'TdFgVFccVj', 'codeyon', '918430088300', 'wamid.HBgMOTE4NDMwMDg4MzAwFQIAERgSMTc1QkI2RDhDMDg0RUEyNEMzAA==', 'SENT', 'delivered', '2025-06-10T10:19:20.030Z', NULL, '2025-06-10 10:18:55');

-- --------------------------------------------------------

--
-- Table structure for table `beta_chatbot`
--

CREATE TABLE `beta_chatbot` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `source` varchar(999) DEFAULT 'wa_chatbot',
  `title` varchar(999) DEFAULT NULL,
  `flow_id` varchar(999) DEFAULT NULL,
  `active` int(11) DEFAULT 1,
  `origin` longtext DEFAULT NULL,
  `origin_id` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `beta_chats`
--

CREATE TABLE `beta_chats` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `old_chat_id` varchar(999) DEFAULT NULL,
  `profile` longtext DEFAULT NULL,
  `origin_instance_id` varchar(999) DEFAULT NULL,
  `chat_id` varchar(999) DEFAULT NULL,
  `last_message` longtext DEFAULT NULL,
  `chat_label` longtext DEFAULT NULL,
  `chat_note` longtext DEFAULT NULL,
  `sender_name` varchar(999) DEFAULT NULL,
  `sender_mobile` varchar(999) DEFAULT NULL,
  `unread_count` bigint(20) DEFAULT 0,
  `origin` varchar(999) DEFAULT NULL,
  `assigned_agent` longtext DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `beta_chats`
--

INSERT INTO `beta_chats` (`id`, `uid`, `old_chat_id`, `profile`, `origin_instance_id`, `chat_id`, `last_message`, `chat_label`, `chat_note`, `sender_name`, `sender_mobile`, `unread_count`, `origin`, `assigned_agent`, `createdAt`) VALUES
(2, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '{\"profileImage\":\"https://pps.whatsapp.net/v/t61.24694-24/299565350_1011060832895306_6503983270112962656_n.jpg?ccb=11-4&oh=01_Q5Aa1wHUg-U0S4IXcFmUfgFqcOaNpl1rx6J3IZCP5bAaXy0zBw&oe=685500E4&_nc_sid=5e03e0&_nc_cat=103\"}', '{\"id\":\"17575062336:9@s.whatsapp.net\",\"name\":\"codeyon temporary\",\"lid\":\"30190013001766:9@lid\"}', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', '{\"type\":\"text\",\"metaChatId\":\"3EB0E21C82A8BEB7289D29\",\"msgContext\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"hey\"}},\"reaction\":\"\",\"timestamp\":1749642241,\"senderName\":\"codeyon.com\",\"senderMobile\":\"918430088300\",\"star\":0,\"route\":\"OUTGOING\",\"context\":null,\"origin\":\"meta\"}', '[{\"id\":1,\"uid\":\"lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8\",\"hex\":\"#d86a6a\",\"title\":\"Important\",\"createdAt\":\"2025-02-04T08:09:27.000Z\"}]', '[{\"email\":\"user@user.com\",\"name\":\"John Doe\",\"note\":\"chat not added by the user\",\"rating\":10,\"craetedAt\":1749544574,\"id\":\"awKji\"}]', 'codeyon.com', '918430088300', 0, 'qr', '{\"id\":3,\"owner_uid\":\"lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8\",\"uid\":\"n9xrxIvwIajEo2JO2poQ0b3UyUnhUF3g\",\"role\":\"agent\",\"email\":\"john@agent.com\",\"password\":\"$2b$10$JGNSEHq.tErhcQKmvuh6PuWCVXWzxWIZ.WrnkuDNp8izuDgsWkZi.\",\"name\":\"john\",\"mobile\":\"7778888000\",\"comments\":\"some comments\",\"is_active\":1,\"createdAt\":\"2024-04-06T06:45:15.000Z\",\"logs\":\"{\\\"dateTracking\\\":{\\\"2025-06-03\\\":{\\\"logins\\\":3,\\\"logouts\\\":3,\\\"lastLogin\\\":\\\"2025-06-03T12:44:57.454Z\\\",\\\"lastLogout\\\":\\\"2025-06-03T12:45:18.979Z\\\"},\\\"2025-06-07\\\":{\\\"logins\\\":2,\\\"logouts\\\":0,\\\"lastLogin\\\":\\\"2025-06-07T05:31:42.255Z\\\",\\\"lastLogout\\\":null}},\\\"spendTime\\\":{\\\"2025-06-03\\\":55,\\\"2025-06-04\\\":260,\\\"2025-06-07\\\":70,\\\"2025-06-10\\\":115}}\"}', '2025-06-10 08:33:26'),
(3, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, NULL, '{\"id\":\"917037300870\"}', 'meta_918430088300', '{\"type\":\"button\",\"metaChatId\":\"wamid.HBgMOTE4NDMwMDg4MzAwFQIAERgSOTk3NURFNEIzNDVEMjQ2N0U5AA==\",\"msgContext\":{\"type\":\"interactive\",\"interactive\":{\"type\":\"button\",\"body\":{\"text\":\"this is a button message\"},\"action\":{\"buttons\":[{\"type\":\"reply\",\"reply\":{\"id\":\"b5d09932-429a-4529-839d-1c11c86685d2\",\"title\":\"button one\"}},{\"type\":\"reply\",\"reply\":{\"id\":\"f08af9c6-cf36-4a6a-a3f1-d061200526ff\",\"title\":\"button two\"}}]}}},\"reaction\":\"\",\"timestamp\":1749550375,\"senderName\":\"codeyon.com\",\"senderMobile\":\"918430088300\",\"star\":0,\"route\":\"OUTGOING\",\"context\":null,\"origin\":\"meta\"}', NULL, NULL, 'codeyon.com', '918430088300', 0, 'meta', NULL, '2025-06-10 10:12:11');

-- --------------------------------------------------------

--
-- Table structure for table `beta_conversation`
--

CREATE TABLE `beta_conversation` (
  `id` int(11) NOT NULL,
  `type` varchar(999) DEFAULT NULL,
  `chat_id` varchar(999) DEFAULT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `status` varchar(999) DEFAULT NULL,
  `metaChatId` varchar(999) DEFAULT NULL,
  `msgContext` longtext DEFAULT NULL,
  `reaction` varchar(999) DEFAULT NULL,
  `timestamp` varchar(999) DEFAULT NULL,
  `senderName` varchar(999) DEFAULT NULL,
  `senderMobile` varchar(999) DEFAULT NULL,
  `star` varchar(999) DEFAULT NULL,
  `route` varchar(999) DEFAULT NULL,
  `context` longtext DEFAULT NULL,
  `origin` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `beta_conversation`
--

INSERT INTO `beta_conversation` (`id`, `type`, `chat_id`, `uid`, `status`, `metaChatId`, `msgContext`, `reaction`, `timestamp`, `senderName`, `senderMobile`, `star`, `route`, `context`, `origin`, `createdAt`) VALUES
(3, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0C6542735B846C54A06', '{\"type\":\"text\",\"text\":{\"body\":\"hello there\",\"preview_url\":true}}', '', '1749544407', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:33:26'),
(4, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0B61E7EA1C793E3D4FE', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"hello there how are you doing?\"}}', '', '1749544448', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'meta', '2025-06-10 08:34:08'),
(5, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0B0F71F82460E277623', '{\"type\":\"text\",\"text\":{\"body\":\"I am very good\",\"preview_url\":true}}', '', '1749544457', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:34:16'),
(6, 'image', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB039A5633E5ED205D45A', '{\"type\":\"image\",\"image\":{\"link\":\"http://localhost:3000/meta-media/JV6VY9_qr.jpeg\",\"caption\":\"this is an image\"}}', '', '1749544469', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:34:28'),
(7, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0F928DC9230F92C2755', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"😙\"}}', '', '1749544484', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'meta', '2025-06-10 08:34:44'),
(8, 'video', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0E29D371C8510CBC1C4', '{\"type\":\"video\",\"video\":{\"link\":\"http://localhost:3000/media/4DFmb8goIhLAISz0Btfnybw4HdNyJjax.mp4\",\"caption\":\"this is a video \"}}', '', '1749544505', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'meta', '2025-06-10 08:35:06'),
(9, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB013EBA09C0812F9E2A2', '{\"type\":\"text\",\"text\":{\"body\":\"hey\",\"preview_url\":true}}', '', '1749544561', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:36:00'),
(10, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0C26DCDA1A1ED71380B', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Olá, como você está?\"}}', '', '1749544682', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'meta', '2025-06-10 08:38:01'),
(11, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0871F3ED27F9DDD149F', '{\"type\":\"text\",\"text\":{\"body\":\"Olá, como você está?\",\"preview_url\":true}}', '', '1749544691', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:38:11'),
(12, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB02E80FA19A78763BA59', '{\"type\":\"text\",\"text\":{\"body\":\"how many days in a week ?\",\"preview_url\":true}}', '', '1749544711', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:38:30'),
(13, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0DB86BE1E55D181D4DD', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Há sete dias em uma semana.\"}}', '', '1749544728', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'meta', '2025-06-10 08:38:47'),
(14, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB06CD9826F5DB59B35D1', '{\"type\":\"text\",\"text\":{\"body\":\"hello there\",\"preview_url\":true}}', '', '1749545000', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:43:20'),
(15, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0BE10F694D2B3B17731', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello welcome to the Codeyon IT Services. How can i help you ? I can help you in the support or sales\"}}', '', '1749545002', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:43:20'),
(16, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0F2F2A50E17CA1FB771', '{\"type\":\"text\",\"text\":{\"body\":\"I want to buy skibidi toilet\",\"preview_url\":true}}', '', '1749545023', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:43:42'),
(17, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0E6035F387BD64A2630', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Sorry i dont understand. I can only help you i the sales or support\"}}', '', '1749545025', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:43:43'),
(18, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0BACB40AE10B88F836D', '{\"type\":\"text\",\"text\":{\"body\":\"hello there\",\"preview_url\":true}}', '', '1749545031', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:43:50'),
(19, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0448A59A64CBEB9AA95', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Sorry i dont understand. I can only help you i the sales or support\"}}', '', '1749545033', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:43:51'),
(20, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0061C80BCB7CF7BB7CD', '{\"type\":\"text\",\"text\":{\"body\":\"hello there\",\"preview_url\":true}}', '', '1749545114', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:45:14'),
(21, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB09FFABE1536E7F3EAFE', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Sorry i dont understand. I can only help you i the sales or support\"}}', '', '1749545116', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:45:15'),
(22, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0E991CF98A8992D7975', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello welcome to the Codeyon IT Services. How can i help you ? I can help you in the support or sales\"}}', '', '1749545117', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:45:16'),
(23, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB045E59703EBA4A82B3F', '{\"type\":\"text\",\"text\":{\"body\":\"hello there\",\"preview_url\":true}}', '', '1749545151', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:45:51'),
(24, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0EFA688B5FB7FA4003B', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello welcome to the Codeyon IT Services. How can i help you ? I can help you in the support or sales\"}}', '', '1749545152', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:45:51'),
(25, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB05974A441A49C9E35D4', '{\"type\":\"text\",\"text\":{\"body\":\"I want to buy skibidi toilet\",\"preview_url\":true}}', '', '1749545164', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:46:03'),
(26, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0C408181576E5F1B6B1', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Sorry i dont understand. I can only help you i the sales or support\"}}', '', '1749545166', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:46:04'),
(27, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB02509393976F816185B', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello welcome to the Codeyon IT Services. How can i help you ? I can help you in the support or sales\"}}', '', '1749545167', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:46:05'),
(28, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB03B298F7BF440730C0E', '{\"type\":\"text\",\"text\":{\"body\":\"I want you to help me in the sales\",\"preview_url\":true}}', '', '1749545179', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:46:18'),
(29, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB09860F2597A5D9539A3', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Oh okay you are asking for the sales\"}}', '', '1749545181', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:46:19'),
(30, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB02BBDA9176C2B029421', '{\"type\":\"text\",\"text\":{\"body\":\"hello there\",\"preview_url\":true}}', '', '1749545518', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:51:58'),
(31, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB00DF067A15C4E5E7697', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello welcome to Codeyon. Please reply yes to make a request\"}}', '', '1749545520', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:51:58'),
(32, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB07D6E81DBB98FA70020', '{\"type\":\"text\",\"text\":{\"body\":\"yes\",\"preview_url\":true}}', '', '1749545525', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:52:04'),
(33, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB047FEF6C746E5B8EB6B', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"We are fetching your request. Please hold on!\"}}', '', '1749545527', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:52:05'),
(34, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0280DA1431F68A292FF', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"We have fetched your request.\\nEmail: {{{reqemail}}}\\nFirst name: {{{firstname}}}\"}}', '', '1749545529', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:52:08'),
(35, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0FE3068D876A3BFCC11', '{\"type\":\"text\",\"text\":{\"body\":\"hello\",\"preview_url\":true}}', '', '1749545740', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:55:39'),
(36, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB04702C7DA93F2238076', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello welcome to Codeyon. Please reply yes to make a request\"}}', '', '1749545741', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:55:39'),
(37, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0AD62DE610ADFBF6745', '{\"type\":\"text\",\"text\":{\"body\":\"yes\",\"preview_url\":true}}', '', '1749545743', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:55:42'),
(38, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB09AF8F1A2A6B30BF2E7', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"We are fetching your request. Please hold on!\"}}', '', '1749545745', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:55:43'),
(39, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB05C59357452073C6B57', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"We have fetched your request.\\nEmail: {{{reqemail}}}\\nFirst name: {{{firstname}}}\"}}', '', '1749545748', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:55:46'),
(40, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0028471BCB908EAAAF2', '{\"type\":\"text\",\"text\":{\"body\":\"hello\",\"preview_url\":true}}', '', '1749545778', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:56:18'),
(41, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB088E2957AAB30B79DCA', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello welcome to Codeyon. Please reply yes to make a request\"}}', '', '1749545779', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:56:18'),
(42, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0AB247DA5C16F3CBC8E', '{\"type\":\"text\",\"text\":{\"body\":\"yes\",\"preview_url\":true}}', '', '1749545782', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:56:21'),
(43, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0D4E6A0EFBB97277F0E', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"We are fetching your request. Please hold on!\"}}', '', '1749545784', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:56:22'),
(44, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB05FB70C7859E57AED48', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"We have fetched your request.\\nEmail: {{{reqemail}}}\\nFirst name: {{{firstname}}}\"}}', '', '1749545786', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:56:24'),
(45, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB02F449B371813234072', '{\"type\":\"text\",\"text\":{\"body\":\"hello\",\"preview_url\":true}}', '', '1749545823', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:57:03'),
(46, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0C09D923CBB8DCE4DA9', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello welcome to Codeyon. Please reply yes to make a request\"}}', '', '1749545825', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:57:03'),
(47, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB005ADF1FA9655E3DFB8', '{\"type\":\"text\",\"text\":{\"body\":\"yes\",\"preview_url\":true}}', '', '1749545826', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:57:05'),
(48, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0E3A1554E8BF50C2640', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"We are fetching your request. Please hold on!\"}}', '', '1749545828', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:57:06'),
(49, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB07B2335930313F9FDFA', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"We have fetched your request.\\nEmail: {{{reqemail}}}\\nFirst name: {{{firstname}}}\"}}', '', '1749545830', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:57:09'),
(50, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB032FF7D4ABCB0E1B029', '{\"type\":\"text\",\"text\":{\"body\":\"hello\",\"preview_url\":true}}', '', '1749545854', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:57:33'),
(51, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0541804324EDC418E30', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello welcome to Codeyon. Please reply yes to make a request\"}}', '', '1749545855', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:57:34'),
(52, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0DAA216047179A580E4', '{\"type\":\"text\",\"text\":{\"body\":\"yes\",\"preview_url\":true}}', '', '1749545857', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:57:36'),
(53, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0945308060F3BFBC17B', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"We are fetching your request. Please hold on!\"}}', '', '1749545859', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:57:37'),
(54, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB09A52ABF68C1232AAAE', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"We have fetched your request.\\nEmail: {{{reqemail}}}\\nFirst name: {{{firstname}}}\"}}', '', '1749545861', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:57:39'),
(55, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB017D5D7181BBA199486', '{\"type\":\"text\",\"text\":{\"body\":\"hello\",\"preview_url\":true}}', '', '1749545908', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:58:27'),
(56, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB01ACECC6FFD702620C9', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello welcome to Codeyon. Please reply yes to make a request\"}}', '', '1749545909', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:58:28'),
(57, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0702B63A2A46E646F0B', '{\"type\":\"text\",\"text\":{\"body\":\"yes\",\"preview_url\":true}}', '', '1749545911', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:58:31'),
(58, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB07C46ECBC29E3DECACA', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"We are fetching your request. Please hold on!\"}}', '', '1749545913', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:58:32'),
(59, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB02DCEE1A212D38B9798', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"We have fetched your request.\\nEmail: {{{reqemail}}}\\nFirst name: {{{firstname}}}\"}}', '', '1749545916', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:58:34'),
(60, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0E24EAD3DAD50400875', '{\"type\":\"text\",\"text\":{\"body\":\"hello\",\"preview_url\":true}}', '', '1749545956', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:59:15'),
(61, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB094275AC23BCBC705B5', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello welcome to Codeyon. Please reply yes to make a request\"}}', '', '1749545957', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:59:15'),
(62, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB07907A946E9CCE37625', '{\"type\":\"text\",\"text\":{\"body\":\"yes\",\"preview_url\":true}}', '', '1749545959', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 08:59:19'),
(63, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0D4EF607BCC054B00CA', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"We are fetching your request. Please hold on!\"}}', '', '1749545961', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:59:20'),
(64, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB027AEFAF6CCDC4B1E68', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"We have fetched your request.\\nEmail: janet.weaver@reqres.in\\nFirst name: Janet\"}}', '', '1749545963', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 08:59:22'),
(65, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0DF3C35901D9431BA19', '{\"type\":\"text\",\"text\":{\"body\":\"hello\",\"preview_url\":true}}', '', '1749546068', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:01:08'),
(66, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB06F45DBAB3BEE3A18C5', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello welcome to Codeyon. Please reply yes to make a request\"}}', '', '1749546069', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:01:08'),
(67, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0EF2496CA39B52D1214', '{\"type\":\"text\",\"text\":{\"body\":\"yes\",\"preview_url\":true}}', '', '1749546074', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:01:13'),
(68, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0E1C980DF1B1AD138F2', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"We are fetching your request. Please hold on!\"}}', '', '1749546076', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:01:15'),
(69, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0E27B054DC7FC7B2527', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"We have fetched your request.\\nEmail: janet.weaver@reqres.in\\nFirst name: Janet\"}}', '', '1749546080', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:01:18'),
(70, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB061A2B9161D84E53EF8', '{\"type\":\"text\",\"text\":{\"body\":\"hello there\",\"preview_url\":true}}', '', '1749546326', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:05:26'),
(71, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0D67FEAEA6C089081EF', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello welcome to Codeyon. May i know your name?\"}}', '', '1749546327', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:05:26'),
(72, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0AF4D3E9833295E985E', '{\"type\":\"text\",\"text\":{\"body\":\"Paul\",\"preview_url\":true}}', '', '1749546333', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:05:32'),
(73, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB07EE7788595208CF29B', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Thank you for telling me your name. May i know your requirements ? \"}}', '', '1749546335', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:05:33'),
(74, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB026740392759EEFB299', '{\"type\":\"text\",\"text\":{\"body\":\"I want to build a custom web app\",\"preview_url\":true}}', '', '1749546347', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:05:47'),
(75, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB05513791203E11306D3', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Thank you we have received your requirements for the purchase, Which are below.\\n\\nYour name: Paul\\nNumber of req: I want to build a custom web app\\n\\nWe will contact you back soon!  Auto reply will be disabled for 1 hour 30 mins\\n\\nHave a great day!\"}}', '', '1749546350', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:05:48'),
(76, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0406F46498053E0E528', '{\"type\":\"text\",\"text\":{\"body\":\"okay\",\"preview_url\":true}}', '', '1749546356', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:05:56'),
(77, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB001DF6A7175C67B2750', '{\"type\":\"text\",\"text\":{\"body\":\"hello\",\"preview_url\":true}}', '', '1749546366', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:06:05'),
(78, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB08FC5FCEE9143A7D741', '{\"type\":\"text\",\"text\":{\"body\":\"hello\",\"preview_url\":true}}', '', '1749546369', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:06:08'),
(79, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0357DF4CC4C00050BBE', '{\"type\":\"text\",\"text\":{\"body\":\"hello\",\"preview_url\":true}}', '', '1749546449', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:07:28'),
(80, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0322B2431C2F74B681D', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello there next message will arrive in 5  Seconds\"}}', '', '1749546450', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:07:28'),
(81, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB09B4E199DF719F1F710', '{\"type\":\"text\",\"text\":{\"body\":\"hello\",\"preview_url\":true}}', '', '1749546502', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:08:21'),
(82, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0629121D006157F0A99', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello there next message will arrive in 5  Seconds\"}}', '', '1749546503', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:08:21'),
(83, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0F6ADFE576BB67867DE', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"This message has come!\"}}', '', '1749546510', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:08:28'),
(84, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0FC22D6CC914A44666B', '{\"type\":\"text\",\"text\":{\"body\":\"hello there\",\"preview_url\":true}}', '', '1749546813', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:13:32'),
(85, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB05E6CFAB9751E3F5311', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello welcome to codeyon. Your next message will be saved in the google sheet!\"}}', '', '1749546814', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:13:33'),
(86, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB09B2092FD071F607F70', '{\"type\":\"text\",\"text\":{\"body\":\"this is the message!!!\",\"preview_url\":true}}', '', '1749546820', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:13:39'),
(87, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB01D885980601341C034', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Your message was saved in google sheet.\"}}', '', '1749546825', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:13:43'),
(88, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0C2E4894FA8ADFA7DA4', '{\"type\":\"text\",\"text\":{\"body\":\"hello there\",\"preview_url\":true}}', '', '1749547098', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:18:17'),
(89, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB03F3D1F6A39485841CF', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello! Welcome to codeyon IT service. Please reply to transfer your chat to the AI agent!\"}}', '', '1749547099', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:18:17'),
(90, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0C71910CD574A07D764', '{\"type\":\"text\",\"text\":{\"body\":\"okay\",\"preview_url\":true}}', '', '1749547102', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:18:22'),
(91, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0999D3B2CA2F7B495FA', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello! How can I assist you today?\"}}', '', '1749547104', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:18:23'),
(92, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0C36FA857E3E9A1D30F', '{\"type\":\"text\",\"text\":{\"body\":\"hello my name is paul\",\"preview_url\":true}}', '', '1749547109', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:18:29'),
(93, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0459C9234B88CA6DB45', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello Paul! How can I assist you today?\"}}', '', '1749547112', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:18:30'),
(94, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0F1A01C336CF7C27773', '{\"type\":\"text\",\"text\":{\"body\":\"do you know skibidi toilet ?\",\"preview_url\":true}}', '', '1749547120', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:18:40'),
(95, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB05DA2EABD779E7E0DA6', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello Paul! I\'m not familiar with \\\"Skibidi Toilet.\\\" It sounds like it could be a humorous or slang term, or perhaps something from a specific subculture or media. Could you provide more details or clarify what it is? I\'m here to help with any information or questions you have!\"}}', '', '1749547125', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:18:44'),
(96, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0FB778B9DDD8305FFDB', '{\"type\":\"text\",\"text\":{\"body\":\"can you transfer my chat to real human ?\",\"preview_url\":true}}', '', '1749547140', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:19:00'),
(97, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0B800D28020E76A7260', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"An available agent will be with you soon!\"}}', '', '1749547146', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:19:04'),
(98, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB02784E5732E250BD6A5', '{\"type\":\"text\",\"text\":{\"body\":\"oka\",\"preview_url\":true}}', '', '1749547150', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:19:09'),
(99, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0AEAF479FA8E99406A8', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"An available agent will be with you soon!\"}}', '', '1749547151', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:19:09'),
(100, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB03613287415144FFD97', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"*john*:\\nhey this is agent how can i help\"}}', '', '1749547163', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'meta', '2025-06-10 09:19:23'),
(101, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB02AB7EFB1E27552F702', '{\"type\":\"text\",\"text\":{\"body\":\"hey\",\"preview_url\":true}}', '', '1749547169', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:19:29'),
(102, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB09B003D1826AD948C88', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"An available agent will be with you soon!\"}}', '', '1749547170', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:19:29'),
(103, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB09AD2212F31BCEDCE44', '{\"type\":\"text\",\"text\":{\"body\":\"hello there\",\"preview_url\":true}}', '', '1749548662', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:44:22'),
(104, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0436124B4D26517614F', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello! Welcome to codeyon it services. I can help you in the sales or support\"}}', '', '1749548663', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:44:22'),
(105, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0F1EEF1D9829ECFBF9B', '{\"type\":\"text\",\"text\":{\"body\":\"I want a skibidi toilet\",\"preview_url\":true}}', '', '1749548670', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:44:29'),
(106, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0D6A894EC1D59531373', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Okay you are asking for the support\"}}', '', '1749548672', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:44:30'),
(107, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0F86701C77DE5F4ED6F', '{\"type\":\"text\",\"text\":{\"body\":\"hello\",\"preview_url\":true}}', '', '1749548730', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:45:29'),
(108, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0AB737A091488C60A2D', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello! Welcome to codeyon it services. I can help you in the sales or support\"}}', '', '1749548731', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:45:29'),
(109, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB01EBCBC7E4E15605B36', '{\"type\":\"text\",\"text\":{\"body\":\"do you know skibidi toilet ?\",\"preview_url\":true}}', '', '1749548738', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:45:38'),
(110, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0FC7587FC529606EFED', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Sorry i dont understand!\"}}', '', '1749548740', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:45:39'),
(111, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0AABA7144793559B192', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello! Welcome to codeyon it services. I can help you in the sales or support\"}}', '', '1749548741', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:45:40'),
(112, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB05DD1B3DCA5633F4E9E', '{\"type\":\"text\",\"text\":{\"body\":\"I want to help in sales\",\"preview_url\":true}}', '', '1749548747', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:45:47'),
(113, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB090611C07C1406E8991', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Okay you are asking for the sales\"}}', '', '1749548749', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:45:48'),
(114, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0E38C8B97B669A6E82D', '{\"type\":\"text\",\"text\":{\"body\":\"hello there\",\"preview_url\":true}}', '', '1749548910', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:48:29'),
(115, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB01911EDB2DB3AADF5B5', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello there may i know you name please?\"}}', '', '1749548911', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:48:29'),
(116, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0AC01C2F07E2596E41C', '{\"type\":\"text\",\"text\":{\"body\":\"john\",\"preview_url\":true}}', '', '1749548913', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:48:32'),
(117, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0D1EB18E917A100EB0A', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello *john*,\\nMay i know your requirement?\"}}', '', '1749548915', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:48:33'),
(118, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0D9725CCE6FC3F063A1', '{\"type\":\"text\",\"text\":{\"body\":\"I want to hire you for custom work\",\"preview_url\":true}}', '', '1749548922', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:48:42'),
(119, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB06E6B914DCB7EC61684', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Thank you we have taken your message!\\n\\nYour name: john\\nYour req: I want to hire you for custom work\\n\\n\\nWe will get back you!\"}}', '', '1749548924', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:48:43'),
(120, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB09E9E789F67E397AD63', '{\"type\":\"text\",\"text\":{\"body\":\"hello there\",\"preview_url\":true}}', '', '1749549115', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:51:55'),
(121, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0631C66CBC95DD54832', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello! welcome to codeyon it services. \\nPlease reply to fetch your details\"}}', '', '1749549117', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:51:55'),
(122, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB03A6A4B4C341A6C2B68', '{\"type\":\"text\",\"text\":{\"body\":\"okay\",\"preview_url\":true}}', '', '1749549119', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:51:58'),
(123, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0E4959F869C6B5F9AA7', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Please hold on we are fetching your details!\"}}', '', '1749549121', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:52:00'),
(124, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0638C53F9C6E54ADB1F', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"The fetched details are:\\n\\nFirst name: *Janet\\nEmail: *janet.weaver@reqres.in*\"}}', '', '1749549123', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:52:01'),
(125, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB01FC45A287B817D4539', '{\"type\":\"text\",\"text\":{\"body\":\"hello there\",\"preview_url\":true}}', '', '1749549213', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:53:33'),
(126, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB034E0A49C40CA884320', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello there next message will be after 5 seconds\"}}', '', '1749549214', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:53:33'),
(127, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB05E1052C8694D593389', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"this message was arrive after 5 sec\"}}', '', '1749549221', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:53:40'),
(128, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0B75A4A68983152A1F0', '{\"type\":\"text\",\"text\":{\"body\":\"hello there\",\"preview_url\":true}}', '', '1749549433', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:57:13'),
(129, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB00A5BD756B257659AB0', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello there, Would you like to transfer your chat to the AI agent?\"}}', '', '1749549434', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:57:13'),
(130, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0A2B05710ABE9957933', '{\"type\":\"text\",\"text\":{\"body\":\"sure\",\"preview_url\":true}}', '', '1749549438', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:57:17'),
(131, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB05D18EA80E145989D53', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello! How can I assist you today?\"}}', '', '1749549441', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:57:19'),
(132, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0649F6FA3CFB2EE3C8A', '{\"type\":\"text\",\"text\":{\"body\":\"hey my name is John doe\",\"preview_url\":true}}', '', '1749549446', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:57:26'),
(133, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0CCDF20BAD8704114BC', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello, John Doe! How can I assist you today?\"}}', '', '1749549449', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:57:28'),
(134, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB064F7A914C6EA45A3C5', '{\"type\":\"text\",\"text\":{\"body\":\"what is 1+2 only wrong answer\",\"preview_url\":true}}', '', '1749549459', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:57:39'),
(135, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0881461C9AC4349D55D', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"5\"}}', '', '1749549462', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:57:40'),
(136, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0F736CD6EF45A47CE79', '{\"type\":\"text\",\"text\":{\"body\":\"can you transfer my chat to real human ?\",\"preview_url\":true}}', '', '1749549473', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:57:52'),
(137, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB09550D24A326751E7DB', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"An available agent will be with you shortly!\\nAuto reply will be disabled for 1 hour 30 minutes\"}}', '', '1749549478', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 09:57:56'),
(138, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB09765302DE84EC65D92', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"*john*:\\nhello there my name is agent john\"}}', '', '1749549499', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'meta', '2025-06-10 09:58:18'),
(139, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB09C016CF3A3FC367BAB', '{\"type\":\"text\",\"text\":{\"body\":\"hey agent John how are you\",\"preview_url\":true}}', '', '1749549506', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:58:26'),
(140, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB07C8220AAEED067AE8C', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"*john*:\\nokay\"}}', '', '1749549520', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'meta', '2025-06-10 09:58:40'),
(141, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB09361247CC076C4FFF1', '{\"type\":\"text\",\"text\":{\"body\":\"can you speak in Chinese ?\",\"preview_url\":true}}', '', '1749549535', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 09:58:54'),
(142, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB0A47DDEE736AF539F5D', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"*john*:\\n是的，我也会说中文，有什么可以帮助您的吗？\"}}', '', '1749549562', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'meta', '2025-06-10 09:59:22');
INSERT INTO `beta_conversation` (`id`, `type`, `chat_id`, `uid`, `status`, `metaChatId`, `msgContext`, `reaction`, `timestamp`, `senderName`, `senderMobile`, `star`, `route`, `context`, `origin`, `createdAt`) VALUES
(143, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB031982DF4F00C57D791', '{\"type\":\"text\",\"text\":{\"body\":\"hello thee\",\"preview_url\":true}}', '', '1749549816', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 10:03:35'),
(144, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB03654AE84E012BA9BA6', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello there, Your next message will be saved in google sheet\"}}', '', '1749549817', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 10:03:36'),
(145, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB009769BE40CE3EFB89A', '{\"type\":\"text\",\"text\":{\"body\":\"this is the message\",\"preview_url\":true}}', '', '1749549821', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'qr', '2025-06-10 10:03:41'),
(146, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', '3EB061C146E3A2B882AAA4', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Your message was saved to google sheet\"}}', '', '1749549825', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'qr', '2025-06-10 10:03:44'),
(147, 'text', 'meta_918430088300', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', '', 'wamid.HBgMOTE4NDMwMDg4MzAwFQIAEhgWM0VCMEZEMzcyNzExQTEwODA5MDU2OAA=', '{\"type\":\"text\",\"text\":{\"body\":\"hey there\",\"preview_url\":true}}', '', '1749550332', 'codeyon.com', '918430088300', '0', 'INCOMING', NULL, 'meta', '2025-06-10 10:12:11'),
(148, 'text', 'meta_918430088300', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', 'wamid.HBgMOTE4NDMwMDg4MzAwFQIAERgSM0UyQkMxQjJCQ0ZCNzBFRERDAA==', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"hello from the meta\"}}', '', '1749550359', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'meta', '2025-06-10 10:12:40'),
(149, 'button', 'meta_918430088300', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'delivered', 'wamid.HBgMOTE4NDMwMDg4MzAwFQIAERgSOTk3NURFNEIzNDVEMjQ2N0U5AA==', '{\"type\":\"interactive\",\"interactive\":{\"type\":\"button\",\"body\":{\"text\":\"this is a button message\"},\"action\":{\"buttons\":[{\"type\":\"reply\",\"reply\":{\"id\":\"b5d09932-429a-4529-839d-1c11c86685d2\",\"title\":\"button one\"}},{\"type\":\"reply\",\"reply\":{\"id\":\"f08af9c6-cf36-4a6a-a3f1-d061200526ff\",\"title\":\"button two\"}}]}}}', '', '1749550375', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'meta', '2025-06-10 10:12:55'),
(150, 'text', '17575062336_918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', NULL, '3EB0E21C82A8BEB7289D29', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"hey\"}}', '', '1749642241', 'codeyon.com', '918430088300', '0', 'OUTGOING', NULL, 'meta', '2025-06-11 11:44:03');

-- --------------------------------------------------------

--
-- Table structure for table `beta_flows`
--

CREATE TABLE `beta_flows` (
  `id` int(11) NOT NULL,
  `is_active` int(11) DEFAULT 1,
  `uid` varchar(999) DEFAULT NULL,
  `flow_id` varchar(999) DEFAULT NULL,
  `source` varchar(999) DEFAULT NULL,
  `name` varchar(999) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `beta_flows`
--

INSERT INTO `beta_flows` (`id`, `is_active`, `uid`, `flow_id`, `source`, `name`, `data`, `createdAt`) VALUES
(24, 1, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'n7xsOOqxE4dQww9QKj30mO5W9GNp0w8T', 'wa_chatbot', 'condition', '{\"nodes\":[{\"id\":\"initialNode\",\"position\":{\"x\":100,\"y\":300},\"data\":{},\"type\":\"INITIAL\",\"width\":268,\"height\":153},{\"id\":\"1749548541604\",\"position\":{\"x\":401,\"y\":257},\"data\":{\"moveToNextNode\":false,\"type\":{\"type\":\"text\",\"title\":\"Simple text\"},\"content\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello! Welcome to codeyon it services. I can help you in the sales or support\"}}},\"type\":\"SEND_MESSAGE\",\"width\":318,\"height\":242,\"selected\":false,\"positionAbsolute\":{\"x\":401,\"y\":257},\"dragging\":false},{\"id\":\"1749548562798\",\"position\":{\"x\":803,\"y\":133.2847110518145},\"data\":{\"moveToNextNode\":true,\"conditions\":[{\"type\":\"text_contains\",\"value\":\"sales\",\"targetNodeId\":\"fvoxX8Lz7SR1a7xnVAH2ibWHprTJ0csU\",\"name\":\"Condition 1\",\"caseSensitive\":false},{\"type\":\"text_contains\",\"value\":\"support\",\"targetNodeId\":\"KwOZiUVMuz9U2NimYsTzfZeAiJcFS8Ob\",\"name\":\"Condition 2\"}],\"variable\":{\"message\":\"\",\"active\":false}},\"type\":\"CONDITION\",\"width\":350,\"height\":835,\"selected\":false,\"positionAbsolute\":{\"x\":803,\"y\":133.2847110518145},\"dragging\":false},{\"id\":\"1749548593825\",\"position\":{\"x\":1254,\"y\":343},\"data\":{\"moveToNextNode\":false,\"type\":{\"type\":\"text\",\"title\":\"Simple text\"},\"content\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Okay you are asking for the sales\"}}},\"type\":\"SEND_MESSAGE\",\"width\":318,\"height\":242,\"selected\":false,\"positionAbsolute\":{\"x\":1254,\"y\":343},\"dragging\":false},{\"id\":\"1749548614817\",\"position\":{\"x\":1245.9640003101229,\"y\":615.0984663927247},\"data\":{\"moveToNextNode\":false,\"type\":{\"type\":\"text\",\"title\":\"Simple text\"},\"content\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Okay you are asking for the support\"}}},\"type\":\"SEND_MESSAGE\",\"width\":318,\"height\":242,\"selected\":false,\"positionAbsolute\":{\"x\":1245.9640003101229,\"y\":615.0984663927247},\"dragging\":false},{\"id\":\"1749548624676\",\"position\":{\"x\":1240.4949672843284,\"y\":897.4647994417787},\"data\":{\"moveToNextNode\":true,\"type\":{\"type\":\"text\",\"title\":\"Simple text\"},\"content\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Sorry i dont understand!\"}}},\"type\":\"SEND_MESSAGE\",\"width\":318,\"height\":242,\"selected\":false,\"positionAbsolute\":{\"x\":1240.4949672843284,\"y\":897.4647994417787},\"dragging\":false}],\"edges\":[{\"source\":\"initialNode\",\"sourceHandle\":\"9cNT4DIJqf8TICbpzbgOm91VC06WJqG1\",\"target\":\"1749548541604\",\"targetHandle\":\"1749548541604-target\",\"id\":\"reactflow__edge-initialNode9cNT4DIJqf8TICbpzbgOm91VC06WJqG1-17495485416041749548541604-target\"},{\"source\":\"1749548541604\",\"sourceHandle\":\"1749548541604-source\",\"target\":\"1749548562798\",\"targetHandle\":null,\"id\":\"reactflow__edge-17495485416041749548541604-source-1749548562798\"},{\"source\":\"1749548562798\",\"sourceHandle\":\"fvoxX8Lz7SR1a7xnVAH2ibWHprTJ0csU\",\"target\":\"1749548593825\",\"targetHandle\":\"1749548593825-target\",\"id\":\"reactflow__edge-1749548562798fvoxX8Lz7SR1a7xnVAH2ibWHprTJ0csU-17495485938251749548593825-target\"},{\"source\":\"1749548562798\",\"sourceHandle\":\"KwOZiUVMuz9U2NimYsTzfZeAiJcFS8Ob\",\"target\":\"1749548614817\",\"targetHandle\":\"1749548614817-target\",\"id\":\"reactflow__edge-1749548562798KwOZiUVMuz9U2NimYsTzfZeAiJcFS8Ob-17495486148171749548614817-target\"},{\"source\":\"1749548562798\",\"sourceHandle\":\"default\",\"target\":\"1749548624676\",\"targetHandle\":\"1749548624676-target\",\"id\":\"reactflow__edge-1749548562798default-17495486246761749548624676-target\"},{\"source\":\"1749548624676\",\"sourceHandle\":\"1749548624676-source\",\"target\":\"1749548541604\",\"targetHandle\":\"1749548541604-target\",\"id\":\"reactflow__edge-17495486246761749548624676-source-17495485416041749548541604-target\"}]}', '2025-06-10 09:44:08'),
(25, 1, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', '9CFyB7IAEW5kxFyTEIJ8A6hKuOSMf3ma', 'wa_chatbot', 'response saver', '{\"nodes\":[{\"id\":\"initialNode\",\"position\":{\"x\":100,\"y\":300},\"data\":{},\"type\":\"INITIAL\"},{\"id\":\"1749548764652\",\"position\":{\"x\":420,\"y\":274},\"data\":{\"moveToNextNode\":false,\"type\":{\"type\":\"text\",\"title\":\"Simple text\"},\"content\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello there may i know you name please?\"}}},\"type\":\"SEND_MESSAGE\",\"width\":318,\"height\":242,\"selected\":false,\"positionAbsolute\":{\"x\":420,\"y\":274},\"dragging\":false},{\"id\":\"1749548779224\",\"position\":{\"x\":864,\"y\":118},\"data\":{\"moveToNextNode\":true,\"variables\":[{\"varName\":\"hitname\",\"responsePath\":\"message.msgContext.text.body\"}]},\"type\":\"RESPONSE_SAVER\",\"width\":368,\"height\":878,\"selected\":false,\"positionAbsolute\":{\"x\":864,\"y\":118},\"dragging\":false},{\"id\":\"1749548806761\",\"position\":{\"x\":1335,\"y\":258},\"data\":{\"moveToNextNode\":false,\"type\":{\"type\":\"text\",\"title\":\"Simple text\"},\"content\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello *{{{hitname}}}*,\\nMay i know your requirement?\"}}},\"type\":\"SEND_MESSAGE\",\"width\":318,\"height\":242,\"selected\":false,\"positionAbsolute\":{\"x\":1335,\"y\":258},\"dragging\":false},{\"id\":\"1749548849690\",\"position\":{\"x\":1747,\"y\":137},\"data\":{\"moveToNextNode\":true,\"variables\":[{\"varName\":\"hisreq\",\"responsePath\":\"message.msgContext.text.body\"}]},\"type\":\"RESPONSE_SAVER\",\"width\":368,\"height\":878,\"selected\":false,\"positionAbsolute\":{\"x\":1747,\"y\":137},\"dragging\":false},{\"id\":\"1749548865851\",\"position\":{\"x\":2171,\"y\":278},\"data\":{\"moveToNextNode\":false,\"type\":{\"type\":\"text\",\"title\":\"Simple text\"},\"content\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Thank you we have taken your message!\\n\\nYour name: {{{hitname}}}\\nYour req: {{{hisreq}}}\\n\\n\\nWe will get back you!\"}}},\"type\":\"SEND_MESSAGE\",\"width\":320,\"height\":244,\"selected\":true,\"positionAbsolute\":{\"x\":2171,\"y\":278},\"dragging\":false}],\"edges\":[{\"source\":\"initialNode\",\"sourceHandle\":\"R6GOhH2bqVrXsKHQaGGIs7xVQc2JM0Ox\",\"target\":\"1749548764652\",\"targetHandle\":\"1749548764652-target\",\"id\":\"reactflow__edge-initialNodeR6GOhH2bqVrXsKHQaGGIs7xVQc2JM0Ox-17495487646521749548764652-target\"},{\"source\":\"1749548764652\",\"sourceHandle\":\"1749548764652-source\",\"target\":\"1749548779224\",\"targetHandle\":\"1749548779224-target\",\"id\":\"reactflow__edge-17495487646521749548764652-source-17495487792241749548779224-target\"},{\"source\":\"1749548779224\",\"sourceHandle\":\"1749548779224-source\",\"target\":\"1749548806761\",\"targetHandle\":\"1749548806761-target\",\"id\":\"reactflow__edge-17495487792241749548779224-source-17495488067611749548806761-target\"},{\"source\":\"1749548806761\",\"sourceHandle\":\"1749548806761-source\",\"target\":\"1749548849690\",\"targetHandle\":\"1749548849690-target\",\"id\":\"reactflow__edge-17495488067611749548806761-source-17495488496901749548849690-target\"},{\"source\":\"1749548849690\",\"sourceHandle\":\"1749548849690-source\",\"target\":\"1749548865851\",\"targetHandle\":\"1749548865851-target\",\"id\":\"reactflow__edge-17495488496901749548849690-source-17495488658511749548865851-target\"}]}', '2025-06-10 09:48:19'),
(26, 1, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'WGrC42Ndm3FcsTLxhXTxmiPc9U4rqiVz', 'wa_chatbot', 'make req', '{\"nodes\":[{\"id\":\"initialNode\",\"position\":{\"x\":100,\"y\":300},\"data\":{},\"type\":\"INITIAL\",\"width\":268,\"height\":153},{\"id\":\"1749548943985\",\"position\":{\"x\":961,\"y\":162},\"data\":{\"moveToNextNode\":true,\"method\":\"GET\",\"url\":\"https://reqres.in/api/users/2\",\"headers\":[{\"key\":\"Content-Type\",\"value\":\"application/json\",\"id\":1749548929774}],\"variables\":[{\"key\":\"respemail\",\"value\":\"body.data.email\",\"id\":1749548967530},{\"key\":\"respfirstname\",\"value\":\"body.data.first_name\",\"id\":1749549032998}],\"body\":\"\",\"bodyData\":{\"json\":[],\"formData\":[],\"urlEncoded\":[],\"raw\":\"\"},\"contentType\":\"application/json\"},\"type\":\"MAKE_REQUEST\",\"width\":368,\"height\":762,\"selected\":false,\"positionAbsolute\":{\"x\":961,\"y\":162},\"dragging\":false},{\"id\":\"1749548982162\",\"position\":{\"x\":527,\"y\":305},\"data\":{\"moveToNextNode\":false,\"type\":{\"type\":\"text\",\"title\":\"Simple text\"},\"content\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello! welcome to codeyon it services. \\nPlease reply to fetch your details\"}}},\"type\":\"SEND_MESSAGE\",\"width\":318,\"height\":242,\"selected\":false,\"positionAbsolute\":{\"x\":527,\"y\":305},\"dragging\":false},{\"id\":\"1749549054522\",\"position\":{\"x\":1380,\"y\":346},\"data\":{\"moveToNextNode\":true,\"type\":{\"type\":\"text\",\"title\":\"Simple text\"},\"content\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Please hold on we are fetching your details!\"}}},\"type\":\"SEND_MESSAGE\",\"width\":318,\"height\":242,\"selected\":false,\"positionAbsolute\":{\"x\":1380,\"y\":346},\"dragging\":false},{\"id\":\"1749549070024\",\"position\":{\"x\":1769,\"y\":346},\"data\":{\"moveToNextNode\":false,\"type\":{\"type\":\"text\",\"title\":\"Simple text\"},\"content\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"The fetched details are:\\n\\nFirst name: *{{{respfirstname}}}*\\nEmail: *{{{respemail}}}*\"}}},\"type\":\"SEND_MESSAGE\",\"width\":320,\"height\":244,\"selected\":true,\"positionAbsolute\":{\"x\":1769,\"y\":346},\"dragging\":false}],\"edges\":[{\"source\":\"initialNode\",\"sourceHandle\":\"leKsBdfjPK1RvsYNXH3fgcIxtoMI1NFe\",\"target\":\"1749548982162\",\"targetHandle\":\"1749548982162-target\",\"id\":\"reactflow__edge-initialNodeleKsBdfjPK1RvsYNXH3fgcIxtoMI1NFe-17495489821621749548982162-target\"},{\"source\":\"1749548982162\",\"sourceHandle\":\"1749548982162-source\",\"target\":\"1749548943985\",\"targetHandle\":\"1749548943985-target\",\"id\":\"reactflow__edge-17495489821621749548982162-source-17495489439851749548943985-target\"},{\"source\":\"1749548943985\",\"sourceHandle\":\"1749548943985-source\",\"target\":\"1749549054522\",\"targetHandle\":\"1749549054522-target\",\"id\":\"reactflow__edge-17495489439851749548943985-source-17495490545221749549054522-target\"},{\"source\":\"1749549054522\",\"sourceHandle\":\"1749549054522-source\",\"target\":\"1749549070024\",\"targetHandle\":\"1749549070024-target\",\"id\":\"reactflow__edge-17495490545221749549054522-source-17495490700241749549070024-target\"}]}', '2025-06-10 09:51:40'),
(27, 1, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lhNGulLzOl078BMj34RVXRYsHnbhRW3r', 'wa_chatbot', 'delay', '{\"nodes\":[{\"id\":\"initialNode\",\"position\":{\"x\":100,\"y\":300},\"data\":{},\"type\":\"INITIAL\"},{\"id\":\"1749549155108\",\"position\":{\"x\":464.49101334255397,\"y\":283.37574888812054},\"data\":{\"moveToNextNode\":true,\"type\":{\"type\":\"text\",\"title\":\"Simple text\"},\"content\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello there next message will be after 5 seconds\"}}},\"type\":\"SEND_MESSAGE\",\"width\":318,\"height\":242,\"selected\":false,\"positionAbsolute\":{\"x\":464.49101334255397,\"y\":283.37574888812054},\"dragging\":false},{\"id\":\"1749549171000\",\"position\":{\"x\":924.5703311672032,\"y\":278.1272466643615},\"data\":{\"moveToNextNode\":true,\"seconds\":\"5\",\"duration\":1,\"timeUnit\":\"hours\",\"message\":\"Our auto-reply is currently disabled. We\'ll get back to you soon.\"},\"type\":\"DELAY\",\"width\":333,\"height\":178,\"selected\":false,\"positionAbsolute\":{\"x\":924.5703311672032,\"y\":278.1272466643615},\"dragging\":false},{\"id\":\"1749549183033\",\"position\":{\"x\":1330.5863265568298,\"y\":295.79657922929925},\"data\":{\"moveToNextNode\":false,\"type\":{\"type\":\"text\",\"title\":\"Simple text\"},\"content\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"this message was arrive after 5 sec\"}}},\"type\":\"SEND_MESSAGE\",\"width\":320,\"height\":244,\"selected\":true,\"positionAbsolute\":{\"x\":1330.5863265568298,\"y\":295.79657922929925},\"dragging\":false}],\"edges\":[{\"source\":\"initialNode\",\"sourceHandle\":\"SLQCwAljNrRXVIDhv9ABGlbRCBNojCRO\",\"target\":\"1749549155108\",\"targetHandle\":\"1749549155108-target\",\"id\":\"reactflow__edge-initialNodeSLQCwAljNrRXVIDhv9ABGlbRCBNojCRO-17495491551081749549155108-target\"},{\"source\":\"1749549155108\",\"sourceHandle\":\"1749549155108-source\",\"target\":\"1749549171000\",\"targetHandle\":\"1749549171000-target\",\"id\":\"reactflow__edge-17495491551081749549155108-source-17495491710001749549171000-target\"},{\"source\":\"1749549171000\",\"sourceHandle\":\"1749549171000-source\",\"target\":\"1749549183033\",\"targetHandle\":\"1749549183033-target\",\"id\":\"reactflow__edge-17495491710001749549171000-source-17495491830331749549183033-target\"}]}', '2025-06-10 09:53:23'),
(28, 1, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'Sg7ay9uK557cw893vbFE2nygQEW9Fma8', 'wa_chatbot', 'agent transfer', '{\"nodes\":[{\"id\":\"initialNode\",\"position\":{\"x\":100,\"y\":300},\"data\":{},\"type\":\"INITIAL\",\"width\":268,\"height\":153},{\"id\":\"1749549277067\",\"position\":{\"x\":470,\"y\":273},\"data\":{\"moveToNextNode\":false,\"type\":{\"type\":\"text\",\"title\":\"Simple text\"},\"content\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello there, Would you like to transfer your chat to the AI agent?\"}}},\"type\":\"SEND_MESSAGE\",\"width\":318,\"height\":242,\"selected\":false,\"dragging\":false,\"positionAbsolute\":{\"x\":470,\"y\":273}},{\"id\":\"1749549301661\",\"position\":{\"x\":885,\"y\":192},\"data\":{\"provider\":{\"id\":\"openai\",\"name\":\"OpenAI\",\"models\":[{\"id\":\"gpt-4-turbo\",\"name\":\"GPT-4 Turbo\"},{\"id\":\"gpt-4\",\"name\":\"GPT-4\"},{\"id\":\"gpt-3.5-turbo\",\"name\":\"GPT-3.5 Turbo\"},{\"id\":\"gpt-4o\",\"name\":\"GPT-4o\"},{\"id\":\"gpt-4\",\"name\":\"GPT-4\"},{\"id\":\"gpt-4-mini\",\"name\":\"GPT-4 Mini\"},{\"id\":\"gpt-4.1\",\"name\":\"GPT-4.1\"},{\"id\":\"gpt-4.1-mini\",\"name\":\"GPT-4.1 Mini\"},{\"id\":\"gpt-4.1-nano\",\"name\":\"GPT-4.1 Nano\"},{\"id\":\"gpt-3.5\",\"name\":\"GPT-3.5\"},{\"id\":\"gpt-3.5-turbo\",\"name\":\"GPT-3.5 Turbo\"},{\"id\":\"whisper\",\"name\":\"Whisper\"},{\"id\":\"o1\",\"name\":\"o1\"},{\"id\":\"o1-mini\",\"name\":\"o1 Mini\"},{\"id\":\"o1-pro\",\"name\":\"o1 Pro\"},{\"id\":\"o3\",\"name\":\"o3\"},{\"id\":\"o3-mini\",\"name\":\"o3 Mini\"},{\"id\":\"o3-mini-high\",\"name\":\"o3 Mini High\"},{\"id\":\"o4-mini\",\"name\":\"o4 Mini\"},{\"id\":\"o4-mini-high\",\"name\":\"o4 Mini High\"}],\"apiKeyUrl\":\"https://platform.openai.com/\",\"svg\":\"/assets/openai-svgrepo-com.svg\"},\"model\":{\"id\":\"gpt-4-turbo\",\"name\":\"GPT-4 Turbo\"},\"apiKey\":\"wrongkey\",\"temperature\":0.7,\"maxTokens\":1000,\"systemPrompt\":\"You are a helpful AI assistant of codeyon it services\",\"messageReferenceCount\":3,\"aiTask\":{\"active\":true,\"functions\":[{\"name\":\"when ask to transfer chat to real human person\",\"id\":\"c3ePJM4kVM2rpFwGEpZEkWXUyLI7iGrp\"}]},\"assignedToAi\":true},\"type\":\"AI_TRANSFER\",\"width\":370,\"height\":803,\"selected\":true,\"positionAbsolute\":{\"x\":885,\"y\":192},\"dragging\":false},{\"id\":\"1749549357676\",\"position\":{\"x\":1350,\"y\":796},\"data\":{\"moveToNextNode\":true,\"agentData\":{\"id\":3,\"owner_uid\":\"lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8\",\"uid\":\"n9xrxIvwIajEo2JO2poQ0b3UyUnhUF3g\",\"role\":\"agent\",\"email\":\"john@agent.com\",\"password\":\"$2b$10$JGNSEHq.tErhcQKmvuh6PuWCVXWzxWIZ.WrnkuDNp8izuDgsWkZi.\",\"name\":\"john\",\"mobile\":\"7778888000\",\"comments\":\"some comments\",\"is_active\":1,\"createdAt\":\"2024-04-06T06:45:15.000Z\",\"logs\":\"{\\\"dateTracking\\\":{\\\"2025-06-03\\\":{\\\"logins\\\":3,\\\"logouts\\\":3,\\\"lastLogin\\\":\\\"2025-06-03T12:44:57.454Z\\\",\\\"lastLogout\\\":\\\"2025-06-03T12:45:18.979Z\\\"},\\\"2025-06-07\\\":{\\\"logins\\\":2,\\\"logouts\\\":0,\\\"lastLogin\\\":\\\"2025-06-07T05:31:42.255Z\\\",\\\"lastLogout\\\":null}},\\\"spendTime\\\":{\\\"2025-06-03\\\":55,\\\"2025-06-04\\\":260,\\\"2025-06-07\\\":70,\\\"2025-06-10\\\":115}}\",\"label\":\"john@agent.com | john\"},\"autoAgentSelect\":false,\"duration\":1,\"timeUnit\":\"hours\",\"message\":\"Our auto-reply is currently disabled. We\'ll get back to you soon.\"},\"type\":\"AGENT_TRANSFER\",\"width\":318,\"height\":231,\"selected\":false,\"positionAbsolute\":{\"x\":1350,\"y\":796},\"dragging\":false},{\"id\":\"1749549373059\",\"position\":{\"x\":1733,\"y\":796},\"data\":{\"moveToNextNode\":true,\"type\":{\"type\":\"text\",\"title\":\"Simple text\"},\"content\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"An available agent will be with you shortly!\\nAuto reply will be disabled for 1 hour 30 minutes\"}}},\"type\":\"SEND_MESSAGE\",\"width\":318,\"height\":242,\"selected\":false,\"dragging\":false,\"positionAbsolute\":{\"x\":1733,\"y\":796}},{\"id\":\"1749549394084\",\"position\":{\"x\":2174,\"y\":854},\"data\":{\"hours\":1,\"minutes\":30,\"duration\":1,\"timeUnit\":\"hours\",\"message\":\"Our auto-reply is currently disabled. We\'ll get back to you soon.\"},\"type\":\"DISABLE_AUTOREPLY\",\"width\":368,\"height\":190,\"selected\":false,\"positionAbsolute\":{\"x\":2174,\"y\":854},\"dragging\":false}],\"edges\":[{\"source\":\"initialNode\",\"sourceHandle\":\"IN6qvkGCq9ghPDXSvka7Pctxi2CJi64n\",\"target\":\"1749549277067\",\"targetHandle\":\"1749549277067-target\",\"id\":\"reactflow__edge-initialNodeIN6qvkGCq9ghPDXSvka7Pctxi2CJi64n-17495492770671749549277067-target\"},{\"source\":\"1749549277067\",\"sourceHandle\":\"1749549277067-source\",\"target\":\"1749549301661\",\"targetHandle\":\"1749549301661-target\",\"id\":\"reactflow__edge-17495492770671749549277067-source-17495493016611749549301661-target\"},{\"source\":\"1749549301661\",\"sourceHandle\":\"c3ePJM4kVM2rpFwGEpZEkWXUyLI7iGrp\",\"target\":\"1749549357676\",\"targetHandle\":\"1749549357676-target\",\"id\":\"reactflow__edge-1749549301661c3ePJM4kVM2rpFwGEpZEkWXUyLI7iGrp-17495493576761749549357676-target\"},{\"source\":\"1749549357676\",\"sourceHandle\":\"1749549357676-source\",\"target\":\"1749549373059\",\"targetHandle\":\"1749549373059-target\",\"id\":\"reactflow__edge-17495493576761749549357676-source-17495493730591749549373059-target\"},{\"source\":\"1749549373059\",\"sourceHandle\":\"1749549373059-source\",\"target\":\"1749549394084\",\"targetHandle\":\"1749549394084-target\",\"id\":\"reactflow__edge-17495493730591749549373059-source-17495493940841749549394084-target\"}]}', '2025-06-10 09:57:01'),
(29, 1, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'pxdjlvZg3I5jg4pnrdyUoyumNtH2cY3J', 'wa_chatbot', 'google sheet', '{\"nodes\":[{\"id\":\"initialNode\",\"position\":{\"x\":100,\"y\":300},\"data\":{},\"type\":\"INITIAL\",\"width\":268,\"height\":153},{\"id\":\"1749549584524\",\"position\":{\"x\":453,\"y\":295},\"data\":{\"moveToNextNode\":false,\"type\":{\"type\":\"text\",\"title\":\"Simple text\"},\"content\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello there, Your next message will be saved in google sheet\"}}},\"type\":\"SEND_MESSAGE\",\"width\":318,\"height\":242,\"selected\":false,\"dragging\":false,\"positionAbsolute\":{\"x\":453,\"y\":295}},{\"id\":\"1749549599748\",\"position\":{\"x\":843,\"y\":148},\"data\":{\"moveToNextNode\":true,\"authChip\":\"SELECT\",\"authUrl\":\"http://localhost:3000/media/po33oppqqvONBMOdjIfcRGyLUGhBsjxG.json\",\"authLabel\":\"10 june gsheet\",\"jsonData\":{\"name\":\"{{{senderName}}}\",\"mobile\":\"{{{senderMobile}}}\",\"message\":\"{{{senderMessage}}}\"},\"sheetName\":\"wacrm\",\"sheetId\":\"your_sheet_id\",\"duration\":1,\"timeUnit\":\"hours\",\"message\":\"Our auto-reply is currently disabled. We\'ll get back to you soon.\"},\"type\":\"SPREADSHEET\",\"width\":370,\"height\":516,\"selected\":true,\"positionAbsolute\":{\"x\":843,\"y\":148},\"dragging\":false},{\"id\":\"1749549781256\",\"position\":{\"x\":1304.3358601482555,\"y\":251.0756884280522},\"data\":{\"moveToNextNode\":false,\"type\":{\"type\":\"text\",\"title\":\"Simple text\"},\"content\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Your message was saved to google sheet\"}}},\"type\":\"SEND_MESSAGE\",\"width\":318,\"height\":242,\"selected\":false,\"positionAbsolute\":{\"x\":1304.3358601482555,\"y\":251.0756884280522},\"dragging\":false}],\"edges\":[{\"source\":\"initialNode\",\"sourceHandle\":\"moK0pFS4yxIGIHjwhKQO1DsWn2cnBcI3\",\"target\":\"1749549584524\",\"targetHandle\":\"1749549584524-target\",\"id\":\"reactflow__edge-initialNodemoK0pFS4yxIGIHjwhKQO1DsWn2cnBcI3-17495495845241749549584524-target\"},{\"source\":\"1749549584524\",\"sourceHandle\":\"1749549584524-source\",\"target\":\"1749549599748\",\"targetHandle\":\"1749549599748-target\",\"id\":\"reactflow__edge-17495495845241749549584524-source-17495495997481749549599748-target\"},{\"source\":\"1749549599748\",\"sourceHandle\":\"1749549599748-source\",\"target\":\"1749549781256\",\"targetHandle\":\"1749549781256-target\",\"id\":\"reactflow__edge-17495495997481749549599748-source-17495497812561749549781256-target\"}]}', '2025-06-10 10:03:19');

-- --------------------------------------------------------

--
-- Table structure for table `broadcast`
--

CREATE TABLE `broadcast` (
  `id` int(11) NOT NULL,
  `broadcast_id` varchar(999) DEFAULT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `title` varchar(999) DEFAULT NULL,
  `templet` longtext DEFAULT NULL,
  `phonebook` longtext DEFAULT NULL,
  `status` varchar(999) DEFAULT NULL,
  `schedule` datetime DEFAULT NULL,
  `timezone` varchar(999) DEFAULT 'Asia/Kolkata',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `broadcast_log`
--

CREATE TABLE `broadcast_log` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `broadcast_id` varchar(999) DEFAULT NULL,
  `templet_name` varchar(999) DEFAULT NULL,
  `is_read` int(1) DEFAULT 0,
  `meta_msg_id` varchar(999) DEFAULT NULL,
  `sender_mobile` varchar(999) DEFAULT NULL,
  `send_to` varchar(999) DEFAULT NULL,
  `delivery_status` varchar(999) DEFAULT 'PENDING',
  `delivery_time` varchar(999) DEFAULT NULL,
  `err` longtext DEFAULT NULL,
  `example` longtext DEFAULT NULL,
  `contact` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chatbot`
--

CREATE TABLE `chatbot` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `title` varchar(999) DEFAULT NULL,
  `for_all` int(1) DEFAULT 0,
  `chats` longtext DEFAULT NULL,
  `flow` longtext DEFAULT NULL,
  `flow_id` varchar(999) DEFAULT NULL,
  `active` int(1) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `origin` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(11) NOT NULL,
  `chat_id` varchar(999) DEFAULT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `last_message_came` varchar(999) DEFAULT NULL,
  `chat_note` longtext DEFAULT NULL,
  `chat_tags` longtext DEFAULT NULL,
  `sender_name` varchar(999) DEFAULT NULL,
  `sender_mobile` varchar(999) DEFAULT NULL,
  `chat_status` varchar(999) DEFAULT 'open',
  `is_opened` int(1) DEFAULT 0,
  `last_message` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `origin` varchar(999) DEFAULT 'meta',
  `profile` longtext DEFAULT NULL,
  `other` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_tags`
--

CREATE TABLE `chat_tags` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `hex` varchar(999) DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_tags`
--

INSERT INTO `chat_tags` (`id`, `uid`, `hex`, `title`, `createdAt`) VALUES
(1, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', '#d86a6a', 'Important', '2025-02-04 08:09:27'),
(9, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', '#72edde', 'Not Int', '2025-02-04 08:19:07'),
(10, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', '#6366F1', 'new tag', '2025-06-07 05:15:50');

-- --------------------------------------------------------

--
-- Table structure for table `chat_widget`
--

CREATE TABLE `chat_widget` (
  `id` int(11) NOT NULL,
  `unique_id` varchar(999) DEFAULT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `title` varchar(999) DEFAULT NULL,
  `whatsapp_number` varchar(999) DEFAULT NULL,
  `logo` varchar(999) DEFAULT NULL,
  `place` varchar(999) DEFAULT NULL,
  `size` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_widget`
--

INSERT INTO `chat_widget` (`id`, `unique_id`, `uid`, `title`, `whatsapp_number`, `logo`, `place`, `size`, `createdAt`) VALUES
(5, 'ydHVJqmfnL', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'test', '918430088300', 'whatsapp-color-icon.png', 'BOTTOM_RIGHT', '65', '2024-04-10 14:09:49');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `phonebook_id` varchar(999) DEFAULT NULL,
  `phonebook_name` varchar(999) DEFAULT NULL,
  `name` varchar(999) DEFAULT NULL,
  `mobile` varchar(999) DEFAULT NULL,
  `var1` varchar(999) DEFAULT NULL,
  `var2` varchar(999) DEFAULT NULL,
  `var3` varchar(999) DEFAULT NULL,
  `var4` varchar(999) DEFAULT NULL,
  `var5` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `uid`, `phonebook_id`, `phonebook_name`, `name`, `mobile`, `var1`, `var2`, `var3`, `var4`, `var5`, `createdAt`) VALUES
(42, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', '37', 'Codeyon', 'Codeyon Number', '918430088300', '', '', '', '', '', '2025-06-10 08:36:37'),
(43, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', '37', 'Codeyon', 'codeyon', '918430088300', NULL, NULL, NULL, NULL, NULL, '2025-06-10 10:13:27'),
(44, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', '37', 'Codeyon', 'codeyon', '918430088300', NULL, NULL, NULL, NULL, NULL, '2025-06-10 10:13:33'),
(45, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', '37', 'Codeyon', 'codeyon', '918430088300', NULL, NULL, NULL, NULL, NULL, '2025-06-10 10:13:36');

-- --------------------------------------------------------

--
-- Table structure for table `contact_form`
--

CREATE TABLE `contact_form` (
  `id` int(11) NOT NULL,
  `email` varchar(999) DEFAULT NULL,
  `name` varchar(999) DEFAULT NULL,
  `mobile` varchar(999) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_form`
--

INSERT INTO `contact_form` (`id`, `email`, `name`, `mobile`, `content`, `createdAt`) VALUES
(1, 'email@gmail.com', 'John do', '+91999999999', 'hello, what are the charges', '2024-02-28 07:57:12');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `question` longtext DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `question`, `answer`, `createdAt`) VALUES
(4, 'Can I use my existing WhatsApp number?', 'Yes, you can use an existing WhatsApp number. However, before onboarding, you must first delete the WhatsApp account linked to that number. If you wish to back up your WhatsApp text messages so that you can restore to WhatsCRM, you can use our Chat backup plugin', '2024-02-27 11:20:45'),
(5, 'Can I use my existing WhatsApp number?', 'Yes, you can use an existing WhatsApp number. However, before onboarding, you must first delete the WhatsApp account linked to that number. If you wish to back up your WhatsApp text messages so that you can restore to WhatsCRM, you can use our Chat backup plugin', '2024-02-27 11:20:52'),
(6, 'Can I use my existing WhatsApp number?', 'Yes, you can use an existing WhatsApp number. However, before onboarding, you must first delete the WhatsApp account linked to that number. If you wish to back up your WhatsApp text messages so that you can restore to WhatsCRM, you can use our Chat backup plugin', '2024-02-27 11:20:57'),
(7, 'Can I use my existing WhatsApp number?', 'Yes, you can use an existing WhatsApp number. However, before onboarding, you must first delete the WhatsApp account linked to that number. If you wish to back up your WhatsApp text messages so that you can restore to WhatsCRM, you can use our Chat backup plugin', '2024-02-27 11:21:05');

-- --------------------------------------------------------

--
-- Table structure for table `flow`
--

CREATE TABLE `flow` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `flow_id` varchar(999) DEFAULT NULL,
  `title` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `prevent_list` longtext DEFAULT NULL,
  `ai_list` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flow_data`
--

CREATE TABLE `flow_data` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `uniqueId` varchar(999) DEFAULT NULL,
  `inputs` longtext DEFAULT NULL,
  `other` longtext DEFAULT NULL,
  `meta_data` longtext DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flow_data`
--

INSERT INTO `flow_data` (`id`, `uid`, `uniqueId`, `inputs`, `other`, `meta_data`, `createdAt`) VALUES
(10, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8-919690309316-jjjSjiuijujS', '{\"heightVar\":\"15cm\",\"hisGender\":\"female\"}', NULL, NULL, '2025-04-11 05:40:03'),
(11, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8-918430088300-jjBIuiiBBuii', '{\"testing\":\"test2\"}', NULL, NULL, '2025-04-14 10:29:51'),
(12, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8-918430088300-918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8_MwU44R0m', '{\"hisJob\":\"CEP\",\"hisName\":\"tony\"}', NULL, NULL, '2025-04-16 16:18:59'),
(13, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8-919711780353-919711780353_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8_MwU44R0m', NULL, '{\"id\":\"1745049418487\",\"position\":{\"x\":640,\"y\":300},\"nodeType\":\"TAKE_INPUT\",\"data\":{\"msgContent\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"tell me name\"}},\"variableName\":\"hisName\",\"regex\":\"\",\"useRegEx\":false,\"keyword\":[]},\"type\":\"TAKE_INPUT\",\"width\":318,\"height\":295,\"selected\":false,\"positionAbsolute\":{\"x\":640,\"y\":300},\"dragging\":false}', NULL, '2025-04-19 07:58:59'),
(14, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8-918430088300-918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8_zCB5YplH', '{\"numero\":\"918430088300\"}', NULL, NULL, '2025-04-22 07:48:36'),
(15, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8-918430088300-918430088300_lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8_BCCT5dGr', '{\"hisName\":\"John\",\"hisAge\":\"69\",\"messsage\":\"NA\"}', '{\"id\":\"1746863459729\",\"position\":{\"x\":693,\"y\":283},\"nodeType\":\"TAKE_INPUT\",\"data\":{\"msgContent\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hello whats your name?\"}},\"variableName\":\"hisName\",\"regex\":\"\",\"useRegEx\":false,\"keyword\":[]},\"type\":\"TAKE_INPUT\",\"width\":318,\"height\":295,\"selected\":false,\"positionAbsolute\":{\"x\":693,\"y\":283},\"dragging\":false}', NULL, '2025-05-10 07:52:33');

-- --------------------------------------------------------

--
-- Table structure for table `flow_session`
--

CREATE TABLE `flow_session` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `origin` varchar(999) DEFAULT NULL,
  `origin_id` varchar(999) DEFAULT NULL,
  `flow_id` varchar(999) DEFAULT NULL,
  `sender_mobile` varchar(999) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flow_session`
--

INSERT INTO `flow_session` (`id`, `uid`, `origin`, `origin_id`, `flow_id`, `sender_mobile`, `data`, `createdAt`) VALUES
(63, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'qr', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8_nR4iMHBN', 'Wqu1qfOTSCLEAsd9JFuMCcI8fI44b1Zn', '918430088300', '{\"variables\":{\"senderMobile\":\"918430088300\",\"senderName\":\"codeyon.com\",\"senderMessage\":\"wacrm5\",\"useremail\":\"user@user.com\",\"dbname\":\"wacrm5\",\"password\":\"$2b$10$gf6jkuByoJUOF23GAl.WuesT6DUGiCA1LT8nnYWvQcXzfePGu4rrG\"},\"node\":{\"id\":\"1748934228593\",\"position\":{\"x\":402,\"y\":186},\"data\":{\"moveToNextNode\":false,\"type\":{\"type\":\"text\",\"title\":\"Simple text\"},\"content\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Hey what is your email id?\"}}},\"type\":\"SEND_MESSAGE\",\"width\":318,\"height\":242,\"selected\":false,\"positionAbsolute\":{\"x\":402,\"y\":186},\"dragging\":false}}', '2025-06-03 07:41:05'),
(74, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'qr', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8_9fQLGeMm', 'iKb7EIFWQAfTr9bPEtuZZECIqVuQ684r', '918430088300', '{\"variables\":{\"senderMobile\":\"918430088300\",\"senderName\":\"codeyon.com\",\"senderMessage\":\"hello\",\"hisname\":\"Paul\",\"hisreq\":\"I want to build a custom web app\"},\"node\":{\"id\":\"1749546265967\",\"position\":{\"x\":2546.548229711401,\"y\":632.6418495922408},\"data\":{\"hours\":1,\"minutes\":30,\"duration\":1,\"timeUnit\":\"hours\",\"message\":\"Our auto-reply is currently disabled. We\'ll get back to you soon.\"},\"type\":\"DISABLE_AUTOREPLY\",\"width\":368,\"height\":190,\"selected\":false,\"positionAbsolute\":{\"x\":2546.548229711401,\"y\":632.6418495922408},\"dragging\":false}}', '2025-06-10 09:05:26'),
(76, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'qr', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8_9fQLGeMm', 'kzJG3vWk8832lUPCDwd3LsgsnJgEsDCf', '918430088300', '{\"variables\":{\"senderMobile\":\"918430088300\",\"senderName\":\"codeyon.com\",\"senderMessage\":\"hello\"},\"node\":{\"id\":\"1749546426338\",\"position\":{\"x\":1284,\"y\":228},\"data\":{\"moveToNextNode\":false,\"type\":{\"type\":\"text\",\"title\":\"Simple text\"},\"content\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"This message has come!\"}}},\"type\":\"SEND_MESSAGE\",\"width\":318,\"height\":242,\"selected\":false,\"positionAbsolute\":{\"x\":1284,\"y\":228},\"dragging\":false}}', '2025-06-10 09:08:21'),
(77, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'qr', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8_9fQLGeMm', 'Nf97b3Yi3K57KCAfg29qK3prS1SWlTjJ', '918430088300', '{\"variables\":{\"senderMobile\":\"918430088300\",\"senderName\":\"codeyon.com\",\"senderMessage\":\"this is the message!!!\"},\"node\":{\"id\":\"1749546780414\",\"position\":{\"x\":1296,\"y\":278},\"data\":{\"moveToNextNode\":false,\"type\":{\"type\":\"text\",\"title\":\"Simple text\"},\"content\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Your message was saved in google sheet.\"}}},\"type\":\"SEND_MESSAGE\",\"width\":318,\"height\":242,\"selected\":false,\"positionAbsolute\":{\"x\":1296,\"y\":278},\"dragging\":false}}', '2025-06-10 09:13:32'),
(81, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'qr', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8_9fQLGeMm', '9CFyB7IAEW5kxFyTEIJ8A6hKuOSMf3ma', '918430088300', '{\"variables\":{\"senderMobile\":\"918430088300\",\"senderName\":\"codeyon.com\",\"senderMessage\":\"I want to hire you for custom work\",\"hitname\":\"john\",\"hisreq\":\"I want to hire you for custom work\"},\"node\":{\"id\":\"1749548865851\",\"position\":{\"x\":2171,\"y\":278},\"data\":{\"moveToNextNode\":false,\"type\":{\"type\":\"text\",\"title\":\"Simple text\"},\"content\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Thank you we have taken your message!\\n\\nYour name: {{{hitname}}}\\nYour req: {{{hisreq}}}\\n\\n\\nWe will get back you!\"}}},\"type\":\"SEND_MESSAGE\",\"width\":320,\"height\":244,\"selected\":true,\"positionAbsolute\":{\"x\":2171,\"y\":278},\"dragging\":false}}', '2025-06-10 09:48:29'),
(82, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'qr', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8_9fQLGeMm', 'WGrC42Ndm3FcsTLxhXTxmiPc9U4rqiVz', '918430088300', '{\"variables\":{\"respemail\":\"janet.weaver@reqres.in\",\"respfirstname\":\"Janet\",\"senderMobile\":\"918430088300\",\"senderName\":\"codeyon.com\",\"senderMessage\":\"okay\"},\"node\":{\"id\":\"1749549070024\",\"position\":{\"x\":1769,\"y\":346},\"data\":{\"moveToNextNode\":false,\"type\":{\"type\":\"text\",\"title\":\"Simple text\"},\"content\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"The fetched details are:\\n\\nFirst name: *{{{respfirstname}}}\\nEmail: *{{{respemail}}}*\"}}},\"type\":\"SEND_MESSAGE\",\"width\":318,\"height\":242,\"selected\":false,\"positionAbsolute\":{\"x\":1769,\"y\":346},\"dragging\":false}}', '2025-06-10 09:51:55'),
(83, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'qr', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8_9fQLGeMm', 'lhNGulLzOl078BMj34RVXRYsHnbhRW3r', '918430088300', '{\"variables\":{\"senderMobile\":\"918430088300\",\"senderName\":\"codeyon.com\",\"senderMessage\":\"hello there\"},\"node\":{\"id\":\"1749549183033\",\"position\":{\"x\":1330.5863265568298,\"y\":295.79657922929925},\"data\":{\"moveToNextNode\":false,\"type\":{\"type\":\"text\",\"title\":\"Simple text\"},\"content\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"this message was arrive after 5 sec\"}}},\"type\":\"SEND_MESSAGE\",\"width\":320,\"height\":244,\"selected\":true,\"positionAbsolute\":{\"x\":1330.5863265568298,\"y\":295.79657922929925},\"dragging\":false}}', '2025-06-10 09:53:33'),
(84, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'qr', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8_9fQLGeMm', 'Sg7ay9uK557cw893vbFE2nygQEW9Fma8', '918430088300', '{\"variables\":{\"senderMobile\":\"918430088300\",\"senderName\":\"codeyon.com\",\"senderMessage\":\"can you speak in Chinese ?\"},\"node\":{\"id\":\"1749549394084\",\"position\":{\"x\":2174,\"y\":854},\"data\":{\"hours\":1,\"minutes\":30,\"duration\":1,\"timeUnit\":\"hours\",\"message\":\"Our auto-reply is currently disabled. We\'ll get back to you soon.\"},\"type\":\"DISABLE_AUTOREPLY\",\"width\":368,\"height\":190,\"selected\":false,\"positionAbsolute\":{\"x\":2174,\"y\":854},\"dragging\":false},\"aiTransfer\":{\"active\":false,\"node\":null},\"disableChat\":{\"node\":{\"id\":\"1749549394084\",\"position\":{\"x\":2174,\"y\":854},\"data\":{\"hours\":1,\"minutes\":30,\"duration\":1,\"timeUnit\":\"hours\",\"message\":\"Our auto-reply is currently disabled. We\'ll get back to you soon.\"},\"type\":\"DISABLE_AUTOREPLY\",\"width\":368,\"height\":190,\"selected\":false,\"positionAbsolute\":{\"x\":2174,\"y\":854},\"dragging\":false},\"timestamp\":1749554934911}}', '2025-06-10 09:57:13'),
(85, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'qr', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8_9fQLGeMm', 'pxdjlvZg3I5jg4pnrdyUoyumNtH2cY3J', '918430088300', '{\"variables\":{\"senderMobile\":\"918430088300\",\"senderName\":\"codeyon.com\",\"senderMessage\":\"this is the message\"},\"node\":{\"id\":\"1749549781256\",\"position\":{\"x\":1304.3358601482555,\"y\":251.0756884280522},\"data\":{\"moveToNextNode\":false,\"type\":{\"type\":\"text\",\"title\":\"Simple text\"},\"content\":{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"Your message was saved to google sheet\"}}},\"type\":\"SEND_MESSAGE\",\"width\":318,\"height\":242,\"selected\":false,\"positionAbsolute\":{\"x\":1304.3358601482555,\"y\":251.0756884280522},\"dragging\":false}}', '2025-06-10 10:03:36'),
(86, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'qr', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8_9fQLGeMm', 'pxdjlvZg3I5jg4pnrdyUoyumNtH2cY3J', '919690309316', '{\"variables\":{\"senderMobile\":\"919690309316\",\"senderName\":\"hamidsaifi.com\",\"senderMessage\":\"Nice\"},\"node\":{\"id\":\"1749549599748\",\"position\":{\"x\":843,\"y\":148},\"data\":{\"moveToNextNode\":true,\"authChip\":\"SELECT\",\"authUrl\":\"http://localhost:3000/media/po33oppqqvONBMOdjIfcRGyLUGhBsjxG.json\",\"authLabel\":\"10 june gsheet\",\"jsonData\":{\"name\":\"{{{senderName}}}\",\"mobile\":\"{{{senderMobile}}}\",\"message\":\"{{{senderMessage}}}\"},\"sheetName\":\"wacrm\",\"sheetId\":\"17JkIrYZ8UNREmFo5RdN2IYvW9UeTLO_VLBhpslfqoGc\",\"duration\":1,\"timeUnit\":\"hours\",\"message\":\"Our auto-reply is currently disabled. We\'ll get back to you soon.\"},\"type\":\"SPREADSHEET\",\"width\":368,\"height\":514,\"selected\":false,\"positionAbsolute\":{\"x\":843,\"y\":148},\"dragging\":false}}', '2025-06-11 11:45:01');

-- --------------------------------------------------------

--
-- Table structure for table `gen_links`
--

CREATE TABLE `gen_links` (
  `id` int(11) NOT NULL,
  `wa_mobile` varchar(999) DEFAULT NULL,
  `email` varchar(999) DEFAULT NULL,
  `msg` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gen_links`
--

INSERT INTO `gen_links` (`id`, `wa_mobile`, `email`, `msg`, `createdAt`) VALUES
(2, '918430088300', 'email@gmail.com', 'hey there i am using whatsapp', '2024-08-25 09:41:12'),
(3, '918430088300', 'email@gmail.com', 'hey i am living in my dreams.', '2024-08-25 10:02:05');

-- --------------------------------------------------------

--
-- Table structure for table `g_auth`
--

CREATE TABLE `g_auth` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `label` varchar(999) DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `g_auth`
--

INSERT INTO `g_auth` (`id`, `uid`, `label`, `url`, `createdAt`) VALUES
(1, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'Sheet Auth 1', 'http://localhost:3000/media/9Lbkzx1FrY4KgSwhGDXk3w1cekGw42Qv.json', '2025-04-16 12:04:43'),
(2, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'my google creds', 'http://localhost:3000/media/VdTAcsgYB2ihJdH5EtZbuRD4mTlFqcaX.json', '2025-06-10 09:12:06'),
(3, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', '10 june gsheet', 'http://localhost:3000/media/po33oppqqvONBMOdjIfcRGyLUGhBsjxG.json', '2025-06-10 10:02:01');

-- --------------------------------------------------------

--
-- Table structure for table `instance`
--

CREATE TABLE `instance` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `title` varchar(999) DEFAULT NULL,
  `number` varchar(999) DEFAULT NULL,
  `uniqueId` varchar(999) DEFAULT NULL,
  `qr` longtext DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `other` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instance`
--

INSERT INTO `instance` (`id`, `uid`, `title`, `number`, `uniqueId`, `qr`, `data`, `other`, `status`, `createdAt`) VALUES
(56, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'wacrm', '17575062336', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8_9fQLGeMm', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAARQAAAEUCAYAAADqcMl5AAAAAklEQVR4AewaftIAABJQSURBVO3BQY7YypLAQFLo+1+Z42WuChBU7fH7yAj7g7XWuuBhrbUueVhrrUse1lrrkoe11rrkYa21LnlYa61LHtZa65KHtda65GGttS55WGutSx7WWuuSh7XWuuRhrbUueVhrrUse1lrrkh8+UvmbKiaVqeImlS8qTlSmiknlpooTlaniROWNijdUpoo3VE4qTlTeqDhROamYVP6mii8e1lrrkoe11rrkYa21LvnhsoqbVN5QuaniDZVJZaqYKk4qTlROKk5UTlT+P1WcqEwVb6j8l1TcpHLTw1prXfKw1lqXPKy11iU//DKVNyp+U8UXKl+oTBWTyt9UcaIyVXyhMlVMKm9UnFScqEwVk8pJxaTyN6m8UfGbHtZa65KHtda65GGttS754T+uYlKZKiaVf4nKScUbKpPKVHGiMlWcqJxUnKicVEwqk8pUcaJyojJVnKi8UTGp/C95WGutSx7WWuuSh7XWuuSH/ziVqWJSmSomlTcqJpWp4kTlN1VMKicqJyo3VUwqJypfqEwVJypvVEwqJypTxf+Sh7XWuuRhrbUueVhrrUt++GUVv6niDZU3Kt5QmSqmiknlC5WpYqp4o+INld9UcaIyqfxNKlPFpDJV3FTxL3lYa61LHtZa65KHtda65IfLVP4mlanipGJSmSomlanipGJSmSpOKiaVqeINlaniDZWp4qRiUpkqTiomlanipGJSOVGZKiaVqeImlaniROVf9rDWWpc8rLXWJQ9rrXWJ/cH/EJWp4kTlpopJZaq4SeWk4kRlqnhDZaqYVE4qJpWpYlKZKiaVk4ovVKaKSeWNiv8lD2utdcnDWmtd8rDWWpfYH3ygMlWcqPymiptUbqqYVKaKSeWNihOV/5KKE5Wp4kRlqvhC5Y2KE5Wp4kRlqphU3qj44mGttS55WGutSx7WWusS+4MPVKaKSWWqmFROKiaVqWJSmSomlaliUnmjYlKZKiaVqWJS+aJiUpkq3lA5qThRmSomlS8qJpXfVHGi8psqvlCZKm56WGutSx7WWuuSh7XWuuSHX1YxqZxUTCpTxaQyVbyhclIxqbyhMlW8UXGiMqm8oXJScaIyVZyonFScqJxUTCpTxYnKVDGp/KaKSeU3qUwVXzystdYlD2utdcnDWmtd8sNHFScqX1R8oTJVTCpfqEwVJyonFScqX6icVEwqU8UXFZPKicpUMam8ofKGyhsVk8pU8YXKFxWTyk0Pa611ycNaa13ysNZal/xwmcpJxRsqU8UbFZPKScWkMlV8UTGpnKicVEwqb1RMKlPFpPJGxb+kYlKZKt5QeUNlqphUTiomlZOKSeU3Pay11iUPa611ycNaa11if/CLVKaKSeWk4kTli4o3VKaKSWWqmFSmihOVk4rfpPJFxaQyVZyonFScqEwVJypTxYnKFxUnKicVX6hMFV88rLXWJQ9rrXXJw1prXWJ/cJHKVHGi8kbFpPJGxU0qU8WkMlVMKlPFicoXFScqU8VvUpkq3lCZKr5QmSq+UJkqTlSmiknlpOJE5aTii4e11rrkYa21LnlYa61LfvhIZao4UZkqJpWpYlI5qZhU/iaVNypOVKaKm1SmiknljYo3Kk5Upoqp4g2VN1T+poo3KiaVk4pJ5aaHtda65GGttS55WGutS374yypOKiaVk4pJ5Q2VqWJSmSpOKk5UTiqmikllqjhR+aJiUrlJ5Q2VqeJE5YuKE5WTihOVk4qpYlJ5Q2WquOlhrbUueVhrrUse1lrrkh9+mcpUMalMFVPFpHJSMam8oTJVnFR8UTGpTBUnKm9UnKhMFW+onFRMFZPKVDGpTCq/SeUmlZOKSeWNikllqvhND2utdcnDWmtd8rDWWpf88JepvKFyojJVnKicVLyh8oXKVPEvUZkqJpWTiknlpGJS+aJiUjmp+EJlUpkqJpWTihOVSWWqmFROKr54WGutSx7WWuuSh7XWuuSHjyreqDhRmSq+qPhCZao4qZhUpooTlanipOJEZVKZKqaKSeWk4o2KE5WTihOVSWWqeEPli4pJZaqYVE4q/mUPa611ycNaa13ysNZal9gf/CKVqeINlZOKSWWqmFSmikllqphUpopJ5Y2KL1ROKt5QmSreUJkqJpWTikllqphUpopJ5aTiROWNii9Upoo3VN6ouOlhrbUueVhrrUse1lrrEvuDD1TeqLhJZao4UZkqTlROKiaVmyreUDmpmFROKiaVqWJS+S+pmFROKiaVNyomld9UMamcVHzxsNZalzystdYlD2utdckPH1VMKicqU8WJylTxRcWJylTxRcWkclIxqZxUTBWTyknFpHJSMam8UfGFyknFGypfVJyoTCpTxaQyVUwqJxWTylQxqdz0sNZalzystdYlD2utdckPH6m8UfFGxRcqU8VJxd9UMamcVNykMlWcqEwVk8pU8YbKVDFVTCpfVJyonKhMFVPFTRUnKicqv+lhrbUueVhrrUse1lrrkh8+qnhD5aRiUpkqpopJ5SaVqWJSeaNiUvlC5SaVk4pJZaqYVKaKSWWqmFSmihOVqeJEZar4L1GZKv4/Pay11iUPa611ycNaa13ywy9TmSomlZOKLyomlZOKm1Smiqnipoo3Kk5UJpU3Kn5TxaQyqZxUTCpTxaQyVZyoTBVvqEwVU8Wk8kXFFw9rrXXJw1prXfKw1lqX/PCRylQxVbyh8kbFicpJxaRyovJGxYnKv0TlpGJSmVROKqaKSeUNlaniRGVS+UJlqnhDZap4Q2WqmFT+poe11rrkYa21LnlYa61L7A/+ISpTxYnKGxWTylQxqZxUnKjcVDGpTBVvqLxR8YbKScUbKlPFFypTxRsqX1ScqJxUnKicVNz0sNZalzystdYlD2utdckPH6lMFScqb6i8UTGp3FQxqbxR8YbKpDJVTCq/SeWLikllqphUpooTlaliUjlRmSreqDhRmVS+UHmj4jc9rLXWJQ9rrXXJw1prXfLDRxWTylQxVUwqU8UbKjepTBVfVEwqU8VJxYnKVHGiclLxhsoXFZPKVHGicqIyVZyoTCpTxVQxqUwVb1S8oXJSMamcVHzxsNZalzystdYlD2utdckPH6lMFScqb6hMFScqU8WkMlW8oTJVTCq/SeUNlS9UpoqTikllUnlD5aTiC5Wp4g2VqWJSmSomlROVqeKk4qRiUrnpYa21LnlYa61LHtZa6xL7g4tUTiomlaniDZWTii9UpoqbVE4q3lD5ouINlaliUpkqJpWpYlL5ouINlaliUvmiYlKZKt5QOan4mx7WWuuSh7XWuuRhrbUusT/4i1R+U8Wk8kXFicpJxaTyRcWkclJxovKbKiaVk4oTlTcqvlD5omJS+U0VJyonFV88rLXWJQ9rrXXJw1prXWJ/8IHKScWkMlVMKlPFGypfVHyhclJxojJVTCpvVEwqU8UbKlPFpHJSMal8UTGpvFExqZxUnKicVLyh8psqbnpYa61LHtZa65KHtda6xP7gL1KZKiaVk4qbVN6omFSmikllqphU3qh4Q+X/U8Wk8kXFpDJV3KTyRsWkclJxonJSMamcVEwqU8UXD2utdcnDWmtd8rDWWpf8cJnKGypTxRsqN1VMKjepTBWTyhsqX1ScqJxUTCqTylQxqZxUTCpfqJxUTBWTylQxqbyh8kbFScWkMqn8poe11rrkYa21LnlYa61LfvhI5aTiROVE5aTiRGWqmFROKk4qJpWTikllqjhROamYVKaKSWWqOKk4qfii4qRiUrlJ5aRiUjmpmFS+UDmpmComld/0sNZalzystdYlD2utdYn9wQcqJxVvqEwVv0llqphU3qg4UflNFScqb1ScqJxUfKFyU8WkclIxqZxUTCpTxU0qU8X/p4e11rrkYa21LnlYa61L7A8uUjmpeEPljYovVKaKSWWqmFSmikllqphUpooTlaliUnmj4kRlqphUTiomlaniROWk4guVk4pJZaqYVE4qJpWTiknli4qbHtZa65KHtda65GGttS6xP/hAZap4Q+WkYlKZKiaVqeILlaliUpkqTlROKiaVqeJvUnmj4iaVk4pJ5Y2Kv0llqjhRualiUpkqvnhYa61LHtZa65KHtda6xP7gA5U3Kk5UTireUPmbKt5Q+U0Vk8pJxaQyVZyoTBUnKm9UvKFyU8WkclIxqZxUTCpTxYnKVDGpnFR88bDWWpc8rLXWJQ9rrXXJDx9VTCpTxRcVJypvVEwqJxWTylQxqUwVb1RMKlPFTRUnFV+oTBVTxaQyVfxLVG6qOKmYVKaKqWJSOam46WGttS55WGutSx7WWusS+4N/iMpJxYnKScWJyhsVb6jcVDGpTBWTylTxN6lMFZPKScWkMlWcqEwVJypTxaTyRcWJyk0Vk8pU8cXDWmtd8rDWWpc8rLXWJT9cpjJVTCpTxUnFpHJS8V9WMal8oTJVnKicVEwqb1R8ofJFxYnKicpJxaTymyomlanipOKmh7XWuuRhrbUueVhrrUt++EhlqnhDZaqYVN5QmSpOVKaKv6liUvmi4g2VqWJSmVSmikllqphUTiomlaliUvlNFZPKicobKicVJypTxRsqU8UXD2utdcnDWmtd8rDWWpfYH1yk8kbFpDJVvKFyUjGpTBVvqJxUvKHymyp+k8pUcaLyN1VMKm9UnKicVEwqU8Wk8kXFicpU8cXDWmtd8rDWWpc8rLXWJT9cVjGpnKhMFZPKVPGbVE4qporfVPGFyhsqJxWTyhsqJxU3qZxUTCpTxYnKVPFGxaTyX/aw1lqXPKy11iUPa611yQ8fqZxUvKEyVZyoTBWTyhsVk8qJyhcVJypfVEwqU8VUMalMKlPFTSo3VUwqb6hMFW+oTBUnFW+onKicVNz0sNZalzystdYlD2utdckPf5nKGypvqEwVk8pUcVIxqZxUnKi8UfGFylQxqbxRMamcVEwVk8pJxYnKVDGpvFExqbyhMlVMKlPFicpNFZPKVPHFw1prXfKw1lqXPKy11iU/XFYxqbxR8YXKScWkMlVMKl+oTBVvqEwVk8pJxb9E5aRiUpkqTlROKk5UpopJZao4UZkqJpU3KiaVqeL/08Naa13ysNZalzystdYlP3xUcZPKFxWTylRxojJVnKhMKlPF31QxqbxR8UbFpHJScaLyRsWkMlV8oXKiclIxqUwVk8obFZPKVDGp/KaHtda65GGttS55WGutS+wPPlB5o2JSmSr+JSpTxaRyUnGiclIxqUwVk8pJxRsqU8WkMlWcqEwVJypTxRsqU8WkMlVMKlPFpPJFxRsqX1T8poe11rrkYa21LnlYa61L7A8+UPmi4kRlqjhRmSreUHmjYlKZKk5U3qiYVKaKSWWqmFR+U8WJyknFFypvVLyhMlVMKn9TxYnKScUXD2utdcnDWmtd8rDWWpf88FHFb6o4UZkqJpWp4ouKSeUNlaniROVvqnhD5URlqpgqJpXfVDGpnKhMFScqU8WJylTxhsqkclLxmx7WWuuSh7XWuuRhrbUu+eEjlb+p4o2KSWWq+JsqJpWp4kTlRGWqmFTeUJkq3qj4QuWLikllqjipmFROKm5SmSpOKiaVSeWk4ouHtda65GGttS55WGutS364rOImld+kMlV8UXGiMlVMKlPFpDJVnKh8UXGTylRxUnGiMlVMKlPFpDJVnFS8oTJVvFHxRcWJyk0Pa611ycNaa13ysNZal/zwy1TeqPhNFZPKicoXKl+ofFExqZyo/E0qv6nipGJSmSomlZOKqWJSOVH5mypuelhrrUse1lrrkoe11rrkh/8xKlPFpHKiclIxqZxUnKhMFScqk8obFZPKb1KZKiaVE5U3VE4q3lA5qZhU3qiYVKaKE5UvVKaKLx7WWuuSh7XWuuRhrbUu+eE/rmJSmVSmiknli4qbVL6omFQmlaniC5UvKiaVqWJSmSpOVCaVqWKq+KJiUpkqvlA5UZkqJpXf9LDWWpc8rLXWJQ9rrXXJD7+s4m+qmFQmlZOKSWVSmSomlZOKqeINlaliUpkqJpU3VKaKqeJEZVKZKqaKL1ROKiaVqeI3qZxUTConFZPKpPI3Pay11iUPa611ycNaa11if/CByt9UMalMFW+oTBUnKlPFGypTxRcqN1W8oTJVTCpvVLyhMlVMKm9UTCpTxaTyRsVNKm9UTCpTxRcPa611ycNaa13ysNZal9gfrLXWBQ9rrXXJw1prXfKw1lqXPKy11iUPa611ycNaa13ysNZalzystdYlD2utdcnDWmtd8rDWWpc8rLXWJQ9rrXXJw1prXfKw1lqX/B9DznLbmHDNswAAAABJRU5ErkJggg==', '{\"id\":\"17575062336:9@s.whatsapp.net\",\"name\":\"codeyon temporary\",\"lid\":\"30190013001766:9@lid\"}', NULL, 'INACTIVE', '2025-06-10 08:32:52');

-- --------------------------------------------------------

--
-- Table structure for table `meta_api`
--

CREATE TABLE `meta_api` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `waba_id` varchar(999) DEFAULT NULL,
  `business_account_id` varchar(999) DEFAULT NULL,
  `access_token` varchar(999) DEFAULT NULL,
  `business_phone_number_id` varchar(999) DEFAULT NULL,
  `app_id` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meta_api`
--

INSERT INTO `meta_api` (`id`, `uid`, `waba_id`, `business_account_id`, `access_token`, `business_phone_number_id`, `app_id`, `createdAt`) VALUES
(1, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'xxxxxxxx', 'xxxxxxxx', 'xxxxxxxx', 'xxxxxxxx', 'xxxxxxxx', '2024-02-21 16:04:31'),
(4, '3mHW89bMykCd8pVYRHqnUb0kSqgUcoow', 'xxxxxxxx', 'xxxxxxxx', 'xxxxxxxx', 'xxxxxxxx', 'xxxxxxxx', '2025-06-09 09:59:32');

-- --------------------------------------------------------

--
-- Table structure for table `meta_templet_media`
--

CREATE TABLE `meta_templet_media` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `templet_name` varchar(999) DEFAULT NULL,
  `meta_hash` varchar(999) DEFAULT NULL,
  `file_name` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meta_templet_media`
--

INSERT INTO `meta_templet_media` (`id`, `uid`, `templet_name`, `meta_hash`, `file_name`, `createdAt`) VALUES
(11, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', '5_june_image', '4::aW1hZ2UvcG5n:ARYM_e7D6Ar_DRxIfEqaWB9CvTobQ8vJ8TF3DfFquJH51iN7SX8CE5RZcmBYbfBfKqjnwP1SOdztMt0rkJv4-4lwdzmqU7H6nEU-kOYmXBE1UQ:e:1749478631:1135749217773168:100009064343338:ARaAUZ-scyYuiv5LqUY', 'qoMwaZ5rsqZtnrHcze9ZyTGXfgnoV2bp.png', '2025-06-05 14:17:11');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `payment_mode` varchar(999) DEFAULT NULL,
  `amount` varchar(999) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `s_token` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id` int(11) NOT NULL,
  `slug` varchar(999) DEFAULT NULL,
  `title` varchar(999) DEFAULT NULL,
  `image` varchar(999) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `permanent` int(1) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `slug`, `title`, `image`, `content`, `permanent`, `createdAt`) VALUES
(3, 'privacy-policy', 'Privacy policy', 'yLUH6z8H3bQJzraErEpz7CQWepftq7D6.png', '<h2>What is Lorem Ipsum?</h2><p class=\"ql-align-justify\"><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><h2>Why do we use it?</h2><p class=\"ql-align-justify\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><p><br></p><h2>Where does it come from?</h2><p class=\"ql-align-justify\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p class=\"ql-align-justify\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p><p><br></p>', 1, '2024-02-28 09:21:17'),
(4, 'terms-and-conditions', 'termns', 'yLUH6z8H3bQJzraErEpz7CQWepftq7D6.png', '<h2>What is Lorem Ipsum?</h2><p class=\"ql-align-justify\"><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><h2>Why do we use it?</h2><p class=\"ql-align-justify\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><p><br></p><h2>Where does it come from?</h2><p class=\"ql-align-justify\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p class=\"ql-align-justify\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p><p><br></p>', 1, '2024-02-28 09:26:11'),
(17, 'lorem-one', 'Lorem one', 'dt6jyFCr8b0VFEZWv8qUNSfyxAeBR6Zz.png', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur semper dolor nisi, eget porta urna eleifend eget. Aliquam erat volutpat. Quisque elementum metus id metus pharetra, et sagittis eros rhoncus. Donec lacinia viverra erat, vitae suscipit leo ultricies feugiat. Phasellus vulputate, est a volutpat molestie, ex diam gravida nisi, ac porta nulla urna eu ipsum. Ut lobortis erat id porttitor suscipit. Integer tristique neque eu diam ornare, sit amet tincidunt nulla luctus. Morbi ultricies nisl sit amet mattis bibendum. Nam gravida at est vel eleifend. Cras ultricies congue ligula id convallis. Phasellus sit amet dolor et neque dapibus iaculis non eu dui. Proin neque lorem, condimentum eu lacus ac, facilisis egestas lacus. Nunc fermentum sagittis tellus, eget varius augue sollicitudin vel. Sed gravida ultrices vulputate.</p><p class=\"ql-align-justify\">Proin a hendrerit orci. Maecenas ultricies leo a diam porttitor imperdiet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc at dui ut felis tincidunt facilisis. Sed interdum arcu ut arcu pharetra vehicula. Duis laoreet congue enim sit amet ullamcorper. Praesent dignissim ligula ut nibh auctor, vitae fringilla odio mattis.</p><p class=\"ql-align-justify\">Sed nulla lorem, tincidunt sit amet imperdiet nec, dapibus sed nulla. Ut eu condimentum elit, vitae consequat diam. Nunc eget dolor ac velit condimentum varius id in ipsum. Ut ultricies mollis diam et consectetur. Praesent ornare sapien lorem, eget condimentum mi iaculis at. Aliquam erat volutpat. Ut aliquam odio sed mattis tincidunt. Pellentesque ac sapien ac tellus pretium volutpat a consectetur lacus. Aenean blandit nulla imperdiet blandit ultrices. Sed faucibus tristique felis sed laoreet. Suspendisse et vulputate dui, ac consectetur eros. Integer elementum dapibus urna, id accumsan dolor fermentum id. Aenean id urna malesuada ligula venenatis venenatis iaculis ac felis.</p><p class=\"ql-align-justify\">Donec hendrerit erat eget tincidunt finibus. Cras lacus odio, luctus sed elit non, pretium efficitur neque. Integer nec nunc sapien. Donec eu velit enim. Curabitur tincidunt lectus in tincidunt mollis. Donec ultrices dui augue, eu pulvinar arcu ultrices ac. Suspendisse eget neque nec orci mattis maximus at ut arcu. Vivamus leo ex, luctus eget lacus eget, rutrum condimentum massa. Vestibulum pulvinar ullamcorper erat eu tincidunt. Donec purus ante, auctor sit amet placerat sed, viverra ut leo. Aenean tristique massa non sodales viverra.</p><p class=\"ql-align-justify\">Quisque ac commodo eros. Etiam id ultricies mauris. Nam urna ex, viverra eu felis id, sodales tincidunt ipsum. Nulla pharetra in mauris fermentum convallis. Proin velit neque, consequat quis nunc nec, rutrum sollicitudin ipsum. Sed consequat rutrum commodo. Etiam tincidunt tellus vel leo euismod imperdiet. Suspendisse tempus sed tortor eget sollicitudin. Morbi feugiat, leo non euismod maximus, purus erat bibendum dui, ac fermentum arcu magna id tortor. Mauris mi ante, gravida non ex ut, venenatis ullamcorper nunc. Quisque feugiat justo ut lacus mattis aliquam. Curabitur euismod tincidunt turpis. Integer rutrum, nunc eu iaculis condimentum, massa odio facilisis velit, ut volutpat eros nisi ut risus. Nullam faucibus metus dolor, ut aliquet turpis condimentum non. Aliquam sit amet urna neque. Praesent facilisis blandit tincidunt.</p><p><br></p>', 0, '2025-04-19 13:54:32'),
(18, 'lorem-two', 'Lorem two', 'Ny3GD3L42ySjJGdNUBhNN2d016cSSwMD.png', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur semper dolor nisi, eget porta urna eleifend eget. Aliquam erat volutpat. Quisque elementum metus id metus pharetra, et sagittis eros rhoncus. Donec lacinia viverra erat, vitae suscipit leo ultricies feugiat. Phasellus vulputate, est a volutpat molestie, ex diam gravida nisi, ac porta nulla urna eu ipsum. Ut lobortis erat id porttitor suscipit. Integer tristique neque eu diam ornare, sit amet tincidunt nulla luctus. Morbi ultricies nisl sit amet mattis bibendum. Nam gravida at est vel eleifend. Cras ultricies congue ligula id convallis. Phasellus sit amet dolor et neque dapibus iaculis non eu dui. Proin neque lorem, condimentum eu lacus ac, facilisis egestas lacus. Nunc fermentum sagittis tellus, eget varius augue sollicitudin vel. Sed gravida ultrices vulputate.</p><p class=\"ql-align-justify\">Proin a hendrerit orci. Maecenas ultricies leo a diam porttitor imperdiet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc at dui ut felis tincidunt facilisis. Sed interdum arcu ut arcu pharetra vehicula. Duis laoreet congue enim sit amet ullamcorper. Praesent dignissim ligula ut nibh auctor, vitae fringilla odio mattis.</p><p class=\"ql-align-justify\">Sed nulla lorem, tincidunt sit amet imperdiet nec, dapibus sed nulla. Ut eu condimentum elit, vitae consequat diam. Nunc eget dolor ac velit condimentum varius id in ipsum. Ut ultricies mollis diam et consectetur. Praesent ornare sapien lorem, eget condimentum mi iaculis at. Aliquam erat volutpat. Ut aliquam odio sed mattis tincidunt. Pellentesque ac sapien ac tellus pretium volutpat a consectetur lacus. Aenean blandit nulla imperdiet blandit ultrices. Sed faucibus tristique felis sed laoreet. Suspendisse et vulputate dui, ac consectetur eros. Integer elementum dapibus urna, id accumsan dolor fermentum id. Aenean id urna malesuada ligula venenatis venenatis iaculis ac felis.</p><p class=\"ql-align-justify\">Donec hendrerit erat eget tincidunt finibus. Cras lacus odio, luctus sed elit non, pretium efficitur neque. Integer nec nunc sapien. Donec eu velit enim. Curabitur tincidunt lectus in tincidunt mollis. Donec ultrices dui augue, eu pulvinar arcu ultrices ac. Suspendisse eget neque nec orci mattis maximus at ut arcu. Vivamus leo ex, luctus eget lacus eget, rutrum condimentum massa. Vestibulum pulvinar ullamcorper erat eu tincidunt. Donec purus ante, auctor sit amet placerat sed, viverra ut leo. Aenean tristique massa non sodales viverra.</p><p class=\"ql-align-justify\">Quisque ac commodo eros. Etiam id ultricies mauris. Nam urna ex, viverra eu felis id, sodales tincidunt ipsum. Nulla pharetra in mauris fermentum convallis. Proin velit neque, consequat quis nunc nec, rutrum sollicitudin ipsum. Sed consequat rutrum commodo. Etiam tincidunt tellus vel leo euismod imperdiet. Suspendisse tempus sed tortor eget sollicitudin. Morbi feugiat, leo non euismod maximus, purus erat bibendum dui, ac fermentum arcu magna id tortor. Mauris mi ante, gravida non ex ut, venenatis ullamcorper nunc. Quisque feugiat justo ut lacus mattis aliquam. Curabitur euismod tincidunt turpis. Integer rutrum, nunc eu iaculis condimentum, massa odio facilisis velit, ut volutpat eros nisi ut risus. Nullam faucibus metus dolor, ut aliquet turpis condimentum non. Aliquam sit amet urna neque. Praesent facilisis blandit tincidunt.</p><p><br></p>', 0, '2025-04-19 13:54:39'),
(19, 'lorem-three', 'Lorem three', 'AVfIQlF7o2H9uai4yyzonnWOY9SeZGuQ.png', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur semper dolor nisi, eget porta urna eleifend eget. Aliquam erat volutpat. Quisque elementum metus id metus pharetra, et sagittis eros rhoncus. Donec lacinia viverra erat, vitae suscipit leo ultricies feugiat. Phasellus vulputate, est a volutpat molestie, ex diam gravida nisi, ac porta nulla urna eu ipsum. Ut lobortis erat id porttitor suscipit. Integer tristique neque eu diam ornare, sit amet tincidunt nulla luctus. Morbi ultricies nisl sit amet mattis bibendum. Nam gravida at est vel eleifend. Cras ultricies congue ligula id convallis. Phasellus sit amet dolor et neque dapibus iaculis non eu dui. Proin neque lorem, condimentum eu lacus ac, facilisis egestas lacus. Nunc fermentum sagittis tellus, eget varius augue sollicitudin vel. Sed gravida ultrices vulputate.</p><p class=\"ql-align-justify\">Proin a hendrerit orci. Maecenas ultricies leo a diam porttitor imperdiet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc at dui ut felis tincidunt facilisis. Sed interdum arcu ut arcu pharetra vehicula. Duis laoreet congue enim sit amet ullamcorper. Praesent dignissim ligula ut nibh auctor, vitae fringilla odio mattis.</p><p class=\"ql-align-justify\">Sed nulla lorem, tincidunt sit amet imperdiet nec, dapibus sed nulla. Ut eu condimentum elit, vitae consequat diam. Nunc eget dolor ac velit condimentum varius id in ipsum. Ut ultricies mollis diam et consectetur. Praesent ornare sapien lorem, eget condimentum mi iaculis at. Aliquam erat volutpat. Ut aliquam odio sed mattis tincidunt. Pellentesque ac sapien ac tellus pretium volutpat a consectetur lacus. Aenean blandit nulla imperdiet blandit ultrices. Sed faucibus tristique felis sed laoreet. Suspendisse et vulputate dui, ac consectetur eros. Integer elementum dapibus urna, id accumsan dolor fermentum id. Aenean id urna malesuada ligula venenatis venenatis iaculis ac felis.</p><p class=\"ql-align-justify\">Donec hendrerit erat eget tincidunt finibus. Cras lacus odio, luctus sed elit non, pretium efficitur neque. Integer nec nunc sapien. Donec eu velit enim. Curabitur tincidunt lectus in tincidunt mollis. Donec ultrices dui augue, eu pulvinar arcu ultrices ac. Suspendisse eget neque nec orci mattis maximus at ut arcu. Vivamus leo ex, luctus eget lacus eget, rutrum condimentum massa. Vestibulum pulvinar ullamcorper erat eu tincidunt. Donec purus ante, auctor sit amet placerat sed, viverra ut leo. Aenean tristique massa non sodales viverra.</p><p class=\"ql-align-justify\">Quisque ac commodo eros. Etiam id ultricies mauris. Nam urna ex, viverra eu felis id, sodales tincidunt ipsum. Nulla pharetra in mauris fermentum convallis. Proin velit neque, consequat quis nunc nec, rutrum sollicitudin ipsum. Sed consequat rutrum commodo. Etiam tincidunt tellus vel leo euismod imperdiet. Suspendisse tempus sed tortor eget sollicitudin. Morbi feugiat, leo non euismod maximus, purus erat bibendum dui, ac fermentum arcu magna id tortor. Mauris mi ante, gravida non ex ut, venenatis ullamcorper nunc. Quisque feugiat justo ut lacus mattis aliquam. Curabitur euismod tincidunt turpis. Integer rutrum, nunc eu iaculis condimentum, massa odio facilisis velit, ut volutpat eros nisi ut risus. Nullam faucibus metus dolor, ut aliquet turpis condimentum non. Aliquam sit amet urna neque. Praesent facilisis blandit tincidunt.</p><p><br></p>', 0, '2025-04-19 13:54:44'),
(20, 'lorem-four', 'Lorem four', 'Dn7HK81io00p1xORi4IASpetwRUvnSs4.png', '<p class=\"ql-align-justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur semper dolor nisi, eget porta urna eleifend eget. Aliquam erat volutpat. Quisque elementum metus id metus pharetra, et sagittis eros rhoncus. Donec lacinia viverra erat, vitae suscipit leo ultricies feugiat. Phasellus vulputate, est a volutpat molestie, ex diam gravida nisi, ac porta nulla urna eu ipsum. Ut lobortis erat id porttitor suscipit. Integer tristique neque eu diam ornare, sit amet tincidunt nulla luctus. Morbi ultricies nisl sit amet mattis bibendum. Nam gravida at est vel eleifend. Cras ultricies congue ligula id convallis. Phasellus sit amet dolor et neque dapibus iaculis non eu dui. Proin neque lorem, condimentum eu lacus ac, facilisis egestas lacus. Nunc fermentum sagittis tellus, eget varius augue sollicitudin vel. Sed gravida ultrices vulputate.</p><p class=\"ql-align-justify\">Proin a hendrerit orci. Maecenas ultricies leo a diam porttitor imperdiet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc at dui ut felis tincidunt facilisis. Sed interdum arcu ut arcu pharetra vehicula. Duis laoreet congue enim sit amet ullamcorper. Praesent dignissim ligula ut nibh auctor, vitae fringilla odio mattis.</p><p class=\"ql-align-justify\">Sed nulla lorem, tincidunt sit amet imperdiet nec, dapibus sed nulla. Ut eu condimentum elit, vitae consequat diam. Nunc eget dolor ac velit condimentum varius id in ipsum. Ut ultricies mollis diam et consectetur. Praesent ornare sapien lorem, eget condimentum mi iaculis at. Aliquam erat volutpat. Ut aliquam odio sed mattis tincidunt. Pellentesque ac sapien ac tellus pretium volutpat a consectetur lacus. Aenean blandit nulla imperdiet blandit ultrices. Sed faucibus tristique felis sed laoreet. Suspendisse et vulputate dui, ac consectetur eros. Integer elementum dapibus urna, id accumsan dolor fermentum id. Aenean id urna malesuada ligula venenatis venenatis iaculis ac felis.</p><p class=\"ql-align-justify\">Donec hendrerit erat eget tincidunt finibus. Cras lacus odio, luctus sed elit non, pretium efficitur neque. Integer nec nunc sapien. Donec eu velit enim. Curabitur tincidunt lectus in tincidunt mollis. Donec ultrices dui augue, eu pulvinar arcu ultrices ac. Suspendisse eget neque nec orci mattis maximus at ut arcu. Vivamus leo ex, luctus eget lacus eget, rutrum condimentum massa. Vestibulum pulvinar ullamcorper erat eu tincidunt. Donec purus ante, auctor sit amet placerat sed, viverra ut leo. Aenean tristique massa non sodales viverra.</p><p class=\"ql-align-justify\">Quisque ac commodo eros. Etiam id ultricies mauris. Nam urna ex, viverra eu felis id, sodales tincidunt ipsum. Nulla pharetra in mauris fermentum convallis. Proin velit neque, consequat quis nunc nec, rutrum sollicitudin ipsum. Sed consequat rutrum commodo. Etiam tincidunt tellus vel leo euismod imperdiet. Suspendisse tempus sed tortor eget sollicitudin. Morbi feugiat, leo non euismod maximus, purus erat bibendum dui, ac fermentum arcu magna id tortor. Mauris mi ante, gravida non ex ut, venenatis ullamcorper nunc. Quisque feugiat justo ut lacus mattis aliquam. Curabitur euismod tincidunt turpis. Integer rutrum, nunc eu iaculis condimentum, massa odio facilisis velit, ut volutpat eros nisi ut risus. Nullam faucibus metus dolor, ut aliquet turpis condimentum non. Aliquam sit amet urna neque. Praesent facilisis blandit tincidunt.</p><p><br></p>', 0, '2025-04-19 13:54:48');

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` int(11) NOT NULL,
  `filename` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `filename`, `createdAt`) VALUES
(43, '5l2kFGpo9l8qHmn1bhyOVpI2X0ChdHQy.png', '2024-04-06 10:50:48'),
(44, 'C5K9ldid2VbQzGN0FJn7RmYvAldBYTp0.png', '2024-04-06 10:50:52'),
(45, 'sicqacUYe65Ja4uQpqneMb9OHFSvgEwW.png', '2024-04-06 10:50:55'),
(46, 'iS6Ck9qESObGxbHvsnbjZwg0u1tmk5aQ.png', '2024-04-06 10:50:57'),
(47, 'Y9biaHPQHuBThrSG7tkhBY0nTSAToOyS.png', '2024-04-06 10:51:01'),
(48, 'IpHtSvouRUz43GCggo7fGOUqXQOQnbZ5.png', '2024-04-06 10:51:04'),
(49, 'viwWPuRX1BmwvTvTmo4pjzBLPyJ9xC9d.png', '2024-04-06 10:51:07'),
(50, 'GDeA9DOAOqE3zLmKpOqGcla5erHunQgn.php', '2024-07-23 17:02:41');

-- --------------------------------------------------------

--
-- Table structure for table `phonebook`
--

CREATE TABLE `phonebook` (
  `id` int(11) NOT NULL,
  `name` varchar(999) DEFAULT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phonebook`
--

INSERT INTO `phonebook` (`id`, `name`, `uid`, `createdAt`) VALUES
(34, 'a big name of phonebook', '3mHW89bMykCd8pVYRHqnUb0kSqgUcoow', '2025-06-09 10:36:54'),
(35, 'a big name of phonebook is here which is more big', '3mHW89bMykCd8pVYRHqnUb0kSqgUcoow', '2025-06-09 10:37:07'),
(36, 'a book', '3mHW89bMykCd8pVYRHqnUb0kSqgUcoow', '2025-06-09 10:41:17'),
(37, 'Codeyon', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', '2025-06-09 12:44:08');

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `id` int(11) NOT NULL,
  `title` varchar(999) DEFAULT NULL,
  `short_description` longtext DEFAULT NULL,
  `allow_tag` int(1) DEFAULT 0,
  `allow_note` int(1) DEFAULT 0,
  `allow_chatbot` int(1) DEFAULT 0,
  `contact_limit` varchar(999) DEFAULT NULL,
  `allow_api` int(1) DEFAULT 0,
  `is_trial` int(1) DEFAULT 0,
  `price` bigint(20) DEFAULT NULL,
  `price_strike` varchar(999) DEFAULT NULL,
  `plan_duration_in_days` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `qr_account` int(11) DEFAULT 0,
  `wa_warmer` int(11) DEFAULT 0,
  `rest_api_qr` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `plan`
--

INSERT INTO `plan` (`id`, `title`, `short_description`, `allow_tag`, `allow_note`, `allow_chatbot`, `contact_limit`, `allow_api`, `is_trial`, `price`, `price_strike`, `plan_duration_in_days`, `createdAt`, `qr_account`, `wa_warmer`, `rest_api_qr`) VALUES
(17, 'Trial', 'This is a trial plan with all the featrues', 1, 1, 1, '100', 1, 1, 0, NULL, '10', '2025-04-19 13:50:55', 10, 1, 1),
(19, 'Premium', 'This ia one-year plan best for small agencies', 1, 1, 1, '100', 1, 0, 499, '299', '365', '2025-04-19 13:52:15', 10, 1, 1),
(20, 'Platinum', 'This plan comes with the one-year validity and cover everything', 1, 1, 1, '10000', 1, 0, 1899, '699', '365', '2025-04-19 13:52:57', 24, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `socket_id` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `uid`, `socket_id`, `createdAt`) VALUES
(874, 'sIttvqkwEKFZRRtAIPN7f2o7b9A5sI3E', 'u6FiF8KScmQ0aUk8AAAB', '2024-03-02 09:59:55'),
(1315, 'n9xrxIvwIajEo2JO2poQ0b3UyUnhUF3g', 'KcMja1Ewtt6hRl4QAAAR', '2024-08-25 12:23:45'),
(1318, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'a2BB6UyN2OL02Rm5AAAB', '2025-02-02 11:28:23');

-- --------------------------------------------------------

--
-- Table structure for table `smtp`
--

CREATE TABLE `smtp` (
  `id` int(11) NOT NULL,
  `email` varchar(999) DEFAULT NULL,
  `host` varchar(999) DEFAULT NULL,
  `port` varchar(999) DEFAULT NULL,
  `password` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `username` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `smtp`
--

INSERT INTO `smtp` (`id`, `email`, `host`, `port`, `password`, `createdAt`, `username`) VALUES
(1, 'email@smtp.com', 'email@smtp.com', '587', 'password', '2024-02-28 16:44:12', 'email@smtp.com');

-- --------------------------------------------------------

--
-- Table structure for table `templets`
--

CREATE TABLE `templets` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `type` varchar(999) DEFAULT NULL,
  `title` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `templets`
--

INSERT INTO `templets` (`id`, `uid`, `content`, `type`, `title`, `createdAt`) VALUES
(9, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', '{\"type\":\"text\",\"text\":{\"preview_url\":true,\"body\":\"{{OTHER_MSG}}\"}}', 'TEXT', 'kj', '2024-07-05 06:35:08');

-- --------------------------------------------------------

--
-- Table structure for table `testimonial`
--

CREATE TABLE `testimonial` (
  `id` int(11) NOT NULL,
  `title` varchar(999) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `reviewer_name` varchar(999) DEFAULT NULL,
  `reviewer_position` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Jobs de upload/disparo
CREATE TABLE IF NOT EXISTS upload_jobs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  job_id VARCHAR(64) NOT NULL,
  uid VARCHAR(64) NOT NULL,
  sessao VARCHAR(64) NULL,
  status ENUM('RUNNING','DONE','FAILED') NOT NULL DEFAULT 'RUNNING',
  delay_min INT NOT NULL DEFAULT 500,
  delay_max INT NOT NULL DEFAULT 1500,
  ordem ENUM('sequencial','embaralhada') NOT NULL DEFAULT 'sequencial',
  intercalar TINYINT(1) NOT NULL DEFAULT 0,
  sent INT NOT NULL DEFAULT 0,
  failed INT NOT NULL DEFAULT 0,
  duplicates INT NOT NULL DEFAULT 0,
  report_csv VARCHAR(255) NULL,
  report_txt VARCHAR(255) NULL,
  created_at DATETIME NOT NULL,
  finished_at DATETIME NULL,
  INDEX(job_id),
  INDEX(uid)
);

-- Logs por número
CREATE TABLE IF NOT EXISTS upload_job_logs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  job_id VARCHAR(64) NOT NULL,
  uid VARCHAR(64) NOT NULL,
  numero VARCHAR(32) NOT NULL,
  status ENUM('SENT','FAILED','INVALID','DUPLICATE') NOT NULL,
  error_message TEXT NULL,
  payload JSON NULL,
  created_at DATETIME NOT NULL,
  INDEX(job_id),
  INDEX(uid),
  INDEX(numero)
);


--
-- Dumping data for table `testimonial`
--

INSERT INTO `testimonial` (`id`, `title`, `description`, `reviewer_name`, `reviewer_position`, `createdAt`) VALUES
(1, '“Highly customisable and friendly\"', 'We work in the hotel business, so keeping in touch with people travelling is very easy using WhatsApp. WhatsCRm help us to have multiple people answering guests. It also allows us to automate basic replies such as the address', 'Eduardo Zeballos', 'CEO', '2024-02-27 14:12:05'),
(3, '\"Cutting-edge and Intuitive Communication Solution\"', '\"At our design studio, effective communication is key to delivering exceptional results for our clients. WhatsCRm has revolutionized our workflow by streamlining communication channels and allowing our team to collaborate seamlessly. With its intuitive interface and customizable features, we can effortlessly manage client inquiries, share project updates, and ensure timely responses. WhatsCRm has become an indispensable tool for enhancing productivity and client satisfaction.\"', 'Sophia Chen', 'Creative Director', '2024-03-01 15:44:21'),
(4, '\"Efficient and Versatile Messaging Platform\"', '\n\"Efficient and Versatile Messaging Platform\"\n\n\"Being in the real estate industry demands constant communication with clients and prospects. WhatsCRm has been a game-changer for our agency, providing us with an efficient and versatile messaging platform. We can easily organize client conversations, schedule property viewings, and follow up on leads all in one place. Its user-friendly interface and robust features have significantly boosted our team\'s productivity and client engagement.\"', 'Jonathan Rodriguez', 'Real Estate Agent', '2024-03-01 15:45:07');

-- --------------------------------------------------------

--
-- Table structure for table `undefined`
--

CREATE TABLE `undefined` (
  `session` varchar(50) NOT NULL,
  `id` varchar(80) NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`value`))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `role` varchar(999) DEFAULT 'user',
  `uid` varchar(999) DEFAULT NULL,
  `name` varchar(999) DEFAULT NULL,
  `email` varchar(999) DEFAULT NULL,
  `password` varchar(999) DEFAULT NULL,
  `mobile_with_country_code` varchar(999) DEFAULT NULL,
  `timezone` varchar(999) DEFAULT 'Asia/Kolkata',
  `plan` longtext DEFAULT NULL,
  `plan_expire` varchar(999) DEFAULT NULL,
  `trial` int(1) DEFAULT 0,
  `api_key` varchar(999) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `role`, `uid`, `name`, `email`, `password`, `mobile_with_country_code`, `timezone`, `plan`, `plan_expire`, `trial`, `api_key`, `createdAt`) VALUES
(1, 'user', 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'John Doe', 'user@user.com', '$2b$10$gf6jkuByoJUOF23GAl.WuesT6DUGiCA1LT8nnYWvQcXzfePGu4rrG', '+19876543211', 'Asia/Kolkata', '{\"id\":20,\"title\":\"Platinum\",\"short_description\":\"This plan comes with the one-year validity and cover everything\",\"allow_tag\":1,\"allow_note\":1,\"allow_chatbot\":1,\"contact_limit\":\"10000\",\"allow_api\":1,\"is_trial\":0,\"price\":1899,\"price_strike\":\"699\",\"plan_duration_in_days\":\"365\",\"createdAt\":\"2025-04-19T08:22:57.000Z\",\"qr_account\":24,\"wa_warmer\":1,\"rest_api_qr\":1}', '1776606782955', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiJsV3ZqNksweEkwRmxTS0pveVY3YWs5RE4wbXp2S0pLOCIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzQ0NzMyNTQ3fQ.NDmk6V-ls4iUharrTADtYWXRD2IIjqLZOT1IrzPUO1A', '2024-02-02 13:10:33');

-- --------------------------------------------------------

--
-- Table structure for table `warmers`
--

CREATE TABLE `warmers` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `instances` longtext DEFAULT NULL,
  `is_active` int(11) DEFAULT 1,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warmers`
--

INSERT INTO `warmers` (`id`, `uid`, `instances`, `is_active`, `createdAt`) VALUES
(2, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', '[\"lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8_MwU44R0m\",\"lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8_MgSkCu6k\"]', 0, '2025-04-15 12:47:19');

-- --------------------------------------------------------

--
-- Table structure for table `warmer_script`
--

CREATE TABLE `warmer_script` (
  `id` int(11) NOT NULL,
  `uid` varchar(999) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warmer_script`
--

INSERT INTO `warmer_script` (`id`, `uid`, `message`, `createdAt`) VALUES
(1, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'hey there', '2025-04-15 10:49:48'),
(2, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'hey there', '2025-04-15 10:49:50'),
(4, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'hey', '2025-04-15 11:04:30'),
(5, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'hey man', '2025-04-15 11:04:32'),
(6, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'how are you ', '2025-04-15 11:04:42'),
(7, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'i am good', '2025-04-15 11:04:44'),
(8, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'how are you doi', '2025-04-15 11:04:46'),
(9, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'hey', '2025-04-15 11:04:48'),
(10, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'yoa', '2025-04-15 11:04:50'),
(11, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'new', '2025-04-15 11:04:52'),
(12, 'lWvj6K0xI0FlSKJoyV7ak9DN0mzvKJK8', 'message', '2025-04-15 11:04:54');

-- --------------------------------------------------------

--
-- Table structure for table `web_private`
--

CREATE TABLE `web_private` (
  `id` int(11) NOT NULL,
  `pay_offline_id` varchar(999) DEFAULT NULL,
  `pay_offline_key` longtext DEFAULT NULL,
  `offline_active` int(1) DEFAULT 0,
  `pay_stripe_id` varchar(999) DEFAULT NULL,
  `pay_stripe_key` varchar(999) DEFAULT NULL,
  `stripe_active` int(1) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `pay_paypal_id` varchar(999) DEFAULT NULL,
  `pay_paypal_key` varchar(999) DEFAULT NULL,
  `paypal_active` varchar(999) DEFAULT NULL,
  `rz_id` varchar(999) DEFAULT NULL,
  `rz_key` varchar(999) DEFAULT NULL,
  `rz_active` varchar(999) DEFAULT NULL,
  `pay_paystack_id` varchar(999) DEFAULT NULL,
  `pay_paystack_key` varchar(999) DEFAULT NULL,
  `paystack_active` varchar(999) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `web_private`
--

INSERT INTO `web_private` (`id`, `pay_offline_id`, `pay_offline_key`, `offline_active`, `pay_stripe_id`, `pay_stripe_key`, `stripe_active`, `createdAt`, `pay_paypal_id`, `pay_paypal_key`, `paypal_active`, `rz_id`, `rz_key`, `rz_active`, `pay_paystack_id`, `pay_paystack_key`, `paystack_active`) VALUES
(1, 'Pay offline', 'Pay offline on this account number xxxxxxxxx\nand send a screenshot to us on this email xxx@xxx.com', 1, 'xxxxxxxxxxxxxxxxx', 'xxxxxxxxxxxxxxxxx', 1, '2024-02-26 17:06:06', 'xxxxxxxxxxxxxxxxx', 'xxxxxxxxxxxxxxxxx', '1', 'xxxxxxxxxxxxxxxxx', 'xxxxxxxxxxxxxxxxx', '1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `web_public`
--

CREATE TABLE `web_public` (
  `id` int(11) NOT NULL,
  `currency_code` varchar(999) DEFAULT NULL,
  `logo` varchar(999) DEFAULT NULL,
  `app_name` varchar(999) DEFAULT NULL,
  `custom_home` varchar(999) DEFAULT NULL,
  `is_custom_home` int(1) DEFAULT 0,
  `meta_description` longtext DEFAULT NULL,
  `currency_symbol` varchar(999) DEFAULT NULL,
  `chatbot_screen_tutorial` varchar(999) DEFAULT NULL,
  `broadcast_screen_tutorial` varchar(999) DEFAULT NULL,
  `home_page_tutorial` varchar(999) DEFAULT NULL,
  `login_header_footer` int(1) DEFAULT 1,
  `exchange_rate` varchar(999) DEFAULT NULL,
  `google_client_id` varchar(999) DEFAULT NULL,
  `google_login_active` int(11) DEFAULT 1,
  `rtl` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `web_public`
--

INSERT INTO `web_public` (`id`, `currency_code`, `logo`, `app_name`, `custom_home`, `is_custom_home`, `meta_description`, `currency_symbol`, `chatbot_screen_tutorial`, `broadcast_screen_tutorial`, `home_page_tutorial`, `login_header_footer`, `exchange_rate`, `google_client_id`, `google_login_active`, `rtl`) VALUES
(1, 'USD', 'FOJPDz2ggPeya6yDTBfhkKtxkubH05WZ.png', 'whatsCRM', 'https://google.com', 0, 'des updated', '$', 'https://youtu.be/Wg_23HLxdHc?si=yv5aIMY1OsnwUrNy', 'https://youtu.be/Wg_23HLxdHc?si=yv5aIMY1OsnwUrNy', 'https://youtu.be/rFNoXYE_efo', 1, '1', 'xxxxxxxxxxxxxxx', 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_chats`
--
ALTER TABLE `agent_chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_task`
--
ALTER TABLE `agent_task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth`
--
ALTER TABLE `auth`
  ADD UNIQUE KEY `idxunique` (`session`,`id`),
  ADD KEY `idxsession` (`session`),
  ADD KEY `idxid` (`id`);

--
-- Indexes for table `beta_campaign`
--
ALTER TABLE `beta_campaign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beta_campaign_logs`
--
ALTER TABLE `beta_campaign_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beta_chatbot`
--
ALTER TABLE `beta_chatbot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beta_chats`
--
ALTER TABLE `beta_chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beta_conversation`
--
ALTER TABLE `beta_conversation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beta_flows`
--
ALTER TABLE `beta_flows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `broadcast`
--
ALTER TABLE `broadcast`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `broadcast_log`
--
ALTER TABLE `broadcast_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chatbot`
--
ALTER TABLE `chatbot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_tags`
--
ALTER TABLE `chat_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_widget`
--
ALTER TABLE `chat_widget`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_form`
--
ALTER TABLE `contact_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flow`
--
ALTER TABLE `flow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flow_data`
--
ALTER TABLE `flow_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flow_session`
--
ALTER TABLE `flow_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gen_links`
--
ALTER TABLE `gen_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `g_auth`
--
ALTER TABLE `g_auth`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instance`
--
ALTER TABLE `instance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meta_api`
--
ALTER TABLE `meta_api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meta_templet_media`
--
ALTER TABLE `meta_templet_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phonebook`
--
ALTER TABLE `phonebook`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `smtp`
--
ALTER TABLE `smtp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `templets`
--
ALTER TABLE `templets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonial`
--
ALTER TABLE `testimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `undefined`
--
ALTER TABLE `undefined`
  ADD UNIQUE KEY `idxunique` (`session`,`id`),
  ADD KEY `idxsession` (`session`),
  ADD KEY `idxid` (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warmers`
--
ALTER TABLE `warmers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warmer_script`
--
ALTER TABLE `warmer_script`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_private`
--
ALTER TABLE `web_private`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_public`
--
ALTER TABLE `web_public`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `agent_chats`
--
ALTER TABLE `agent_chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `agent_task`
--
ALTER TABLE `agent_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `beta_campaign`
--
ALTER TABLE `beta_campaign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `beta_campaign_logs`
--
ALTER TABLE `beta_campaign_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `beta_chatbot`
--
ALTER TABLE `beta_chatbot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `beta_chats`
--
ALTER TABLE `beta_chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `beta_conversation`
--
ALTER TABLE `beta_conversation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `beta_flows`
--
ALTER TABLE `beta_flows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `broadcast`
--
ALTER TABLE `broadcast`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `broadcast_log`
--
ALTER TABLE `broadcast_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `chatbot`
--
ALTER TABLE `chatbot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_tags`
--
ALTER TABLE `chat_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `chat_widget`
--
ALTER TABLE `chat_widget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `contact_form`
--
ALTER TABLE `contact_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `flow`
--
ALTER TABLE `flow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `flow_data`
--
ALTER TABLE `flow_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `flow_session`
--
ALTER TABLE `flow_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `gen_links`
--
ALTER TABLE `gen_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `g_auth`
--
ALTER TABLE `g_auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `instance`
--
ALTER TABLE `instance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `meta_api`
--
ALTER TABLE `meta_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `meta_templet_media`
--
ALTER TABLE `meta_templet_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `phonebook`
--
ALTER TABLE `phonebook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `plan`
--
ALTER TABLE `plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1319;

--
-- AUTO_INCREMENT for table `smtp`
--
ALTER TABLE `smtp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `templets`
--
ALTER TABLE `templets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `testimonial`
--
ALTER TABLE `testimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `warmers`
--
ALTER TABLE `warmers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `warmer_script`
--
ALTER TABLE `warmer_script`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `web_private`
--
ALTER TABLE `web_private`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `web_public`
--
ALTER TABLE `web_public`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
