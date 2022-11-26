CREATE TABLE `users`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL
);

ALTER TABLE
    `users` ADD PRIMARY KEY `users_id_primary`(`id`);

CREATE TABLE `games`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `white_player` INT NOT NULL,
    `black_player` INT NOT NULL,
    `fen_string` VARCHAR(255) NOT NULL,
    `is_active` TINYINT(1) NOT NULL,
    `winner` INT,
    `start_time` DATETIME NOT NULL,
    `end_time` DATETIME
);

ALTER TABLE
    `games` ADD PRIMARY KEY `games_id_primary`(`id`);

CREATE TABLE `game_turn_history`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `game_id` INT NOT NULL,
    `turn_num` INT NOT NULL,
    `player_id` INT NOT NULL,
    `square_from` VARCHAR(255) NOT NULL,
    `square_to` VARCHAR(255) NOT NULL
);

ALTER TABLE
    `game_turn_history` ADD PRIMARY KEY `game_turn_history_id_primary`(`id`);

CREATE TABLE `notifications`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `type` VARCHAR(255) NOT NULL,
    `recipient_id` INT NOT NULL,
    `sender_id` INT NOT NULL,
    `game_id` INT NOT NULL,
    `responded` TINYINT(1)
);

ALTER TABLE
    `notifications` ADD PRIMARY KEY `notifications_id_primary`(`id`);

ALTER TABLE
    `games` ADD CONSTRAINT `games_white_player_foreign` FOREIGN KEY(`white_player`) REFERENCES `users`(`id`);

ALTER TABLE
    `games` ADD CONSTRAINT `games_black_player_foreign` FOREIGN KEY(`black_player`) REFERENCES `users`(`id`);

ALTER TABLE
    `games` ADD CONSTRAINT `games_winner_foreign` FOREIGN KEY(`winner`) REFERENCES `users`(`id`);

ALTER TABLE
    `game_turn_history` ADD CONSTRAINT `game_turn_history_game_id_foreign` FOREIGN KEY(`game_id`) REFERENCES `games`(`id`);

ALTER TABLE
    `game_turn_history` ADD CONSTRAINT `game_turn_history_player_id_foreign` FOREIGN KEY(`player_id`) REFERENCES `users`(`id`);

ALTER TABLE
    `notifications` ADD CONSTRAINT `notifications_recipient_id_foreign` FOREIGN KEY(`recipient_id`) REFERENCES `users`(`id`);

ALTER TABLE
    `notifications` ADD CONSTRAINT `notifications_sender_id_foreign` FOREIGN KEY(`sender_id`) REFERENCES `users`(`id`);

ALTER TABLE
    `notifications` ADD CONSTRAINT `notifications_game_id_foreign` FOREIGN KEY(`game_id`) REFERENCES `games`(`id`);