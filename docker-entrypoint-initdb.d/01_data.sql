INSERT INTO clients
VALUES (1,
        'petr',
        'password-hash',
        'Пётр Николаевич Иванов',
        '8204 95523',
        '1970.01.30',
        'ACTIVE',
        NOW());

-- если указываем имя таблицы и столбцы,то обязаны заполнять только то, что указали
-- остальное примет значение по умолчанию либо NULL (если не установлено NOT NULL)
INSERT INTO clients (login, password, full_name, passport, birthday, status)
VALUES ('petr I.',
        'password-hash',
        'Пётр Николаевич Иванов',
        '8204 95523',
        '1970.01.30',
        'ACTIVE');

INSERT INTO clients (login, password, full_name, passport, birthday, status)
VALUES ('vasya', 'password-hash', 'Василий Николаевич Иванов',
        '8205 96563', '1970.01.30', 'ACTIVE'),
       ('masha', 'password-hash', 'Мария Ивановна Петрова',
        '8205 48839', '1990.11.21', 'ACTIVE'),
       ('dasha', 'password-hash', 'Дарья Ивановна Крылова',
        '8205 94483', '1995.04.27', 'ACTIVE')
;

SELECT id, full_name, passport
FROM clients;

-- DELETE FROM clients WHERE id = 1;

INSERT INTO cards (number, balance, issuer, holder, owner_id, status, created)
VALUES ('**** 1234', 100000, 'MIR', 'Василий Николаевич Иванов', 1, 'ACTIVE', now()),
       ('**** 4567', 345000, 'Visa', 'Мария Ивановна Петрова', 1, 'ACTIVE', now()),
       ('**** 4123', 678923, 'MasterCard', 'Мария Ивановна Петрова', 2, 'ACTIVE', now());

SELECT id, balance, issuer
FROM cards;

INSERT INTO icons
VALUES (1,
        'https://img-premium.flaticon.com/png/512/4330/4330896.png?token=exp=1621423444~hmac=1323e52d039473e43b949bac5a0a31e1');

INSERT INTO transactions (amount, card_id, mcc_cod, icon_id, status)
VALUES (345567, 2, '5544', 1, 'unsuccessfully'),
       (100000, 2, '2332', 1, 'successfully'),
       (250000, 2, '5544', 1, 'successfully');

SELECT amount, mcc_cod, status, created FROM transactions ORDER BY amount;
