CREATE TABLE clients
(
    id        BIGSERIAL PRIMARY KEY,
    login     TEXT      NOT NULL UNIQUE,
    password  TEXT      NOT NULL,
    full_name TEXT      NOT NULL,
    passport  TEXT      NOT NULL,
    birthday  DATE      NOT NULL,
    status    TEXT      NOT NULL DEFAULT 'INACTIVE' CHECK (status IN ('INACTIVE', 'ACTIVE')),
    created   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ALTER TABLE clients ADD COLUMN phone TEXT NOT NULL;

CREATE TABLE cards
(
    id       BIGSERIAL PRIMARY KEY,
    number   TEXT      NOT NULL,
    balance  BIGINT    NOT NULL DEFAULT 0,
    issuer   TEXT      NOT NULL CHECK ( issuer IN ('Visa', 'MasterCard', 'MIR') ),
    holder   TEXT      NOT NULL,
    owner_id BIGINT    NOT NULL REFERENCES clients (id),
    status   TEXT      NOT NULL DEFAULT 'INACTIVE' CHECK (status IN ('INACTIVE', 'ACTIVE')),
    created  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE icons
(
    id BIGINT PRIMARY KEY,
    link TEXT NOT NULL
);

CREATE TABLE transactions
(
  id BIGSERIAL PRIMARY KEY,
  amount BIGINT NOT NULL,
  card_id BIGINT NOT NULL REFERENCES cards (id),
  mcc_cod INT NOT NULL,
  icon_id BIGINT NOT NULL REFERENCES icons (id) ,
  status TEXT NOT NULL CHECK(status IN ('unsuccessfully', 'successfully')),
  created  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- DROP TABLE clients, cards, transactions, icons;

-- DROP TABLE cards;
