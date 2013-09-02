INSERT INTO `user_roles`
    (`id`, `parent_id`, `is_default`, `role_id`)
VALUES
    (1, NULL, 1, 'guest'),
    (2, 1, 0, 'user'),
    (3, 2, 0, 'moderator'),
    (4, 3, 0, 'administrator');