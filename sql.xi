. Индексы
    . btree индексы (используются в 90% случаев и создаются по умолчанию)
        + поиск по полному значению
        + поиск по самому левому префиксу
        + поиск по префиксу столбца
        + поиск по полному совпадению одной части и диапазону в другой части
        + запросы только по индексу

        - поиск без использования левой чати ключа
        - нельзая пропускать таблицы
        - оптимизация поиска в диапазоне

    . hash индекс
        . не пишется в журнал транзакции, хранится во временной таблице
        . вычисляется хэш и по нему индексируеются значения

        - нельзя использовать данные в индексе, чтобы избежать чтеня строк
        - нельзя использовать для сортировки, так как строки в нем хранятся
        в отсортированном виде
        - не поддерживает поиск по частичному ключу
        . поддерживает только сранение на равенство с операторами =, IN(), <=>
        . быстрый доступ к данным если нет коллизий в хэшах
        - операции обслуживания могут оказаться медленным, если количество коллизий велико

    . GiST [R-Tree](используют для хранения географических координат)
        | CREATE TABLE city (
        | id serial primary key,
        | name text not null,
        | area polygon );

        | CREATE INDEX idx_city area ON city USING gist (area);

    . GIN (инвертированный индекс)
        исполь для полнотекстового поиска, по тексту в полях (json, массивы и тд)
        | CREATE TABLE movies (
        | id SERIAL PRIMARY KEY,
        | title TEXT NOT NULL,
        | genres TEXT[] NOT NULL );

        | CREATE INDEX idx_movies_genres ON movies USING GIN (genres);

    . битовый индекс (руками не создается, использует postgres для объединения условий)

    . частичный индекс 
        не индексирует все поля (например предметы персонажа)
        | CREATE INDEX idx_items_avatar_id ON items (avatar_id) WHERE avatar_id IS NOT NULL;

    . функциональный индекс (строится от какого то поля)
        | CREATE INDEX idx_movies ON movies (LOWER(title)); - создать регистронезависимый индекс

    . кластерный индекс
        . по умолчанию данные в таблице не упорядочнены. 
        . данный индекс используют если надо упорядочить данные в таблице для храненения
        . сохраняет не только значения колонки в сортированном виде, но и данные всей строки
        . позволяет минимизировать количество операций чтения  с диска. В таблице может быть только один кластерный индекс
        . рекомендуется делать при больших изменениях в таблиице

        | CREATE TABLE movies (
        | id SERIAL PRIMARY KEY,
        | title TEXT NOT NULL );

        | CLUSTER movies USING movies_pkey;
        | CLUSTER movies; - провести повторную кластеризацию по ранее заданному условию
        | CLUSTER;        - провести кластеризацию всей таблицы

    . покрывающий индекс
        . часть запроса уже находится в индексе
        . содержит все данные, необходимые для выполнения запроса


    . создание индекса
        | CREATE [UNIQUE] INDEX [CONCURRENTLY]
        |        [[IF NOT EXISTS] имя] ON имя_таблицы [USING метод]
        |    ({ имя_столбца | выражение по которому создается индекс })
        |       [COLLATE правило_сортировки] [класс_операторов]
        |       [ ASC | DESC ] [ NULLS { FIRST | LAST } ]
        | )
        | [WITH (параметр_хранения = значение [,...] )]
        | [TABLESPACE табличное_пространство]
        | [WHERE предикат]

        | CREATE INDEX text_index ON test_table (col varchar_pattern_ops);

        . класс класс_операторов
            - test_pattern_ops
            - varchar_pattern_ops
            - bpchar_pattern_ops

. JOIN - стратегии
    . mergee join
     - когда надо получить упорядоченную последовательность
        соединение двух отсортированных последовательностей.
        Работает быстро и за один проход обоих список.
    . hash join
     - используется когда нет возможности воспользовться индесами, но нужен join
        меньшее отношение помещается в хэш-таблицу. Затем для каждой строки из большей таблицы выполняется поиск значений, 
        соответствующих условию соединения. Соединение токлько по условию эквивалентности.
    . nested loop
     - самый часто используемый
        соедиение вложенными циклами

    . запрос (пример)
    | SELECT * FROM movies m JOIN movie_genres g ON m.id = g.movie_id;

. проверка статистики запросов в БД
    1 - настрока файла конфигурации postgresql.conf
    | shared_preload_libraries = 'pg_stat_statements'
    | pg_stat_statements.max = 10000
    | pg_stat_statements.track = all
    2 - использование
    | CREATE extension IF NOT EXISTS pg_stat_statements;
    | SELECT pg_stat_statements_reset();
    | ...
    | SELECT * FROM pg_stat_statements;
. протоколирование запросов
    . конфигурация
        | log_duration = on
        | log_min_duration_statement = 50   # если запрос выполняется более указанного времени (в мс), то логировать его
    . запрос
        | SET log_min_duration_statement = 50;
        | SELECT * FROM movies WHERE title = 'Alice in Wondarland';
    . настройка протоколироварния запросов через pgbadger
        . конфигурация
        | log_duration = on
        | log_lock_waits = on;
        | log_min_duration_statement = 50;
        | log_filename = 'postgresql-%Y-%m-%d_%H%M%S'
        | log_directory = '/var/log/postgresql'
        | logging_collector = on

        логирование происходит в CSV формате, пригодном для анализа утилитой pgbadger
        . установка
        | sudo apt install libtext-csv-xs-perl pgbadger
        | pgbadger /var/log/*.csv



