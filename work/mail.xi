. проблемы
    . 451 Temporary local problem - please try later
        протестировать сервер 
        | exim -bd -d+all

        . вариант решения - 1
            добавить в /etc/hosts.allow
            | exim: ALL в host.allow

        . вариант решения -2 
        в файле /etc/exim/exim.conf
        #вместо строки
        | malware = *
        #написать
        | malware = */defer_ok
            #пример
                | deny
                |    message = This message contains virus ($malware_name)
                |    hosts   = *
                |    malware = */defer_ok
        #перезагрузить exim

        ![wikiword link](https://github.com/bfg2000/knowledge-my_DB/blob/main/img/test.png)