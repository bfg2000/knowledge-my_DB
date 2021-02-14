. работа с pip
. pip работает от версии python 3.4+
. установка 
    . базовый пакет pip а более продвинутый  - pip3

. ообновление пакета pip
| python3 -m pip install --upgrade pip

. просмотр утсановленных пакетов
| python3.8 -m pip list

. основные команды pip
    . помощь по доступным командам
    | pip help
    . установка пакета(ов)
    | pip install package_name
    . удаление пакета(ов)
    | pip uninstall package_name
    . список установленных пакетов
    | pip list
    . показывает информацию об установленном пакете
    | pip show package_name
    . поиск пакетов по имени
    | pip search
    . использование с прокси
    | pip --proxy user:passwd@proxy.server:port
    . обновление пакета(ов)
    | pip install -U package_name
    . при обновлении, переустановить пакет, даже если он последней версии
    | pip install --force-reinstall


. работа с postgresql
    . установка
    | pip install psycopg2-binary
    . установка пакета под конкретную версию python
    | python3.8 -m pip install psycopg2-binary (--no-cache-dir)
    . переустановка пакета в случае ошибок при стандартной установке
    | pip uninstall psycopg2-binary
    | pip install psycopg2-binary --no-cache-dir

    . Для выполнения запроса к базе, необходимо с ней соединиться и получить курсор
    | import psycopg2
    | conn = psycopg2.connect(dbname='database', user='db_user', password='mypassword', host='localhost')
    | cursor = conn.cursor()
    . вывод запроса SELECT * from table1; (т.к. курсор является интерпретированным объектом)
    | for row in cursor:
    |   print(row)
    
    . Через курсор происходит дальнейшее общение в базой
    | cursor.execute('SELECT * FROM table1')
    | records = cursor.fetchall()
    | ...
    | cursor.close()
    | conn.close()

    . после выполнения запроса cursor.execute(), получить результат можно несколькими способами
       | cursor.fetchone() — возвращает 1 строку
       | cursor.fetchall() — возвращает список всех строк
       | cursor.fetchmany(size=5) — возвращает заданное количество строк

. синтаксис python
    . добавление нескольких (двух) параметров в массив за один запрос
    | current_position = (message.location.longitude, message.location.latitude)
    #создаем строку в виде ДОЛГОТА,ШИРИНА
    | coords = f"{current_position[0]},{current_position[1]}"