BEGIN TRANSACTION;
INSERT INTO active_storage_blobs VALUES(205181823,'aabbWNGW1VrxZ8Eu4zmyw13A','program.png','image/png','{"identified":true,"analyzed":true}',1000,'fdUivZUf74Y6pjAiemuvlg==','2020-02-29 04:30:34.083523');
TRUNCATE TABLE posts, corners, programs, likes RESTART IDENTITY;
COMMIT;
