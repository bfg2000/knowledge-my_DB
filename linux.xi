. Системная информация:
    . отобразить архитектуру компьютера 
    | arch 
    | uname -m
    . отобразить используемую версию ядра 
    | uname -r
    . показать аппаратные системные компоненты — (SMBIOS / DMI) 
    | hdparm -i /dev/hda 
    . вывести характеристики жёсткого диска 
    | dmidecode -q 
    . протестировать производительность чтения данных с  жёсткого диска 
    | hdparm -tT /dev/sda
    . отобразить информацию о процессоре 
    | cat /proc/cpuinfo 
    . показать прерывания 
    | cat /proc/interrupts
    . проверить использование памяти 
    | cat /proc/meminfo
    . показать файл(ы) подкачки 
    | cat /proc/swaps
    . вывести версию ядра 
    | cat /proc/version 
    . показать сетевые интерфейсы и статистику по ним 
    | cat /proc/mounts 
    . отобразить смонтированные файловые системы 
    | lspci -tv
    . показать в виде дерева PCI устройства 
    | cat /proc/net/dev 
    . показать в виде дерева USB устройства 
    | lsusb -tv
    . вывести системную дату
    | date
    . вывести таблицу-календарь 2007-го года 
    | cal 2007
    . установить системные дату и время  
    | date 041217002007.00* 
        ММДДЧЧммГГГГ.СС (МесяцДеньЧасМинутыГод.Секунды) 
    . сохранить системное время в BIOS 
    | clock -w
. Остановка системы: 
    . остановить систему
    | shutdown -h now 
    | init 0 
    | telinit 0 
    . запланировать остановку системы на указанное  время 
    | shutdown -h hours:minutes & 
    . отменить запланированную по расписанию остановку системы 
    | shutdown -r now
    . перегрузить систему 
    | reboot
    | shutdown -c
    . выйти из системы 
    | logout 

. Файлы и директории: 
    . перейти в директорию '/home' 
    | cd /home 
    . перейти в директорию уровнем выше 
    | cd .. 
    . перейти в директорию двумя уровнями выше 
    | cd ../.. 
    . перейти в домашнюю директорию 
    | cd 
    . перейти в домашнюю директорию пользователя user 
    | cd ~user 
    . перейти в директорию, в которой находились до перехода в текущую  директорию 
    | cd
    . показать текущую директорию 
    | pwd 
    . отобразить содержимое текущей директории 
    | ls 
    . отобразить содержимое текущей директории с добавлением к именам  символов, характеризующих тип 
    | ls -F 
    . показать детализированное представление файлов и директорий в текущей  директории 
    | ls -l 
    . показать скрытые файлы и директории в текущей директории 
    | ls *[0-9]* 
    . показать файлы и директории содержащие в имени цифры 
    | tree 
    | lstree 
    . показать дерево файлов и директорий, начиная от корня 
    | ls / 
    . создать директорию с именем 'dir1' 
    | mkdir dir1 
    . показать все файлы в текущей дирректории, включая скрытые
    | ls -a 
    . создать две директории одновременно 
    | mkdir dir1 dir2 
    . создать дерево директорий 
    | mkdir -p /tmp/dir1/dir2 
    . удалить файл с именем 'file1' 
    | rm -f file1 
    . удалить директорию с именем 'dir1' 
    | rmdir dir1 
    . удалить директорию с именем 'dir1' и рекурсивно всё её содержимое 
    | rm -rf dir1 dir2 
    . удалить две директории и рекурсивно их содержимое
    | rm -rf dir1 
    .  скопировать файл file1 в файл file2 
    | cp file1 file2  
    . переместить файл или директорию 
    | mv dir1 new_dir 
    . копировать все файлы директории dir в текущую директорию 
    | cp -a /tmp/dir1 . 
    . копировать директорию dir1 со всем содержимым в текущую  директорию 
    | cp dir/* . 
    . копировать директорию dir1 в директорию dir2 
    | cp -a dir1 dir2 
    . создать символическую ссылку на файл или директорию 
    | ln -s file1 lnk1 
    . создать «жёсткую» (физическую) ссылку на файл или директорию 
    | ln file1 lnk1*
    . модифицировать дату и время создания файла, при  его отсутствии, создать файл с указанными датой и временем (YYMMDDhhmm) 
    | touch -t 0712250000 fileditest 
. поиск файлов: 
    . найти файлы и директории с именем file1. Поиск начать с  корня (/) 
    | find / -name file1 — 
    . найти файл и директорию принадлежащие пользователю user1.  Поиск начать с корня (/) 
    | find / -user user1 
    . найти все файлы и директории, имена которых  оканчиваются на '. bin'. Поиск начать с '/ home/user1'* 
    | find /home/user1 -name "*.bin" 
    . найти все файлы в '/usr/bin', время последнего  обращения к которым более 100 дней 
    | find /usr/bin -type f -atime +100 
    . найти все файлы в '/usr/bin', созданные или  изменённые в течении последних 10 дней 
    | find /usr/bin -type f -mtime -10 
    . найти все фалы и директории, имена  которых оканчиваются на '.rpm', и изменить права доступа к ним 
    | find / -name *.rpm -exec chmod 755 '{}' \; 
    . найти все фалы и директории, имена которых  оканчиваются на '.rpm', игнорируя съёмные носители, такие как cdrom, floppy и т.п. 
    | locate "*.ps" 
    . найти все файлы, содержащие в имени '.ps'. Предварительно  рекомендуется выполнить команду 'updatedb' 
    | find / -xdev -name "*.rpm" 
    . найти, начиная от корня, все файлы с выставленным SUID 
    | find / -perm -u+s 
    . показывает размещение бинарных файлов, исходных кодов и  руководств, относящихся к файлу 'halt' 
    | whereis halt 
    . отображает полный путь к файлу 'halt' 
    | which halt 
    . поиск файлов в текущей дирректории с показаом размера фала (дирректории)
    | du --max-depth=1 -hac   
. Монтирование файловых систем: 
    . монтирует раздел 'hda2' в точку монтирования  '/mnt/hda2'. 
    Убедитесь в наличии директории-точки монтирования '/mnt/hda2' 
    | mount /dev/hda2 /mnt/hda2
    . размонтирует раздел 'hda2'. Перед выполнением, покиньте  '/mnt/hda2' 
    | umount /dev/hda2 
    . принудительное размонтирование раздела. Применяется в  случае, когда раздел занят каким-либо пользователем 
    | fuser -km /mnt/hda2 
    . выполнить размонтирование без занесения информации в  /etc/mtab. 
    Полезно когда файл имеет атрибуты «только чтение» или недостаточно  места на диске 
    | umount -n /mnt/hda2 
    . монтировать флоппи-диск 
    | mount /dev/fd0 /mnt/floppy 
    . монтировать CD или DVD 
    | mount /dev/cdrom /mnt/cdrom 
    . монтировать CD-R/CD-RW или DVD-R/DVD RW(+-) 
    | mount /dev/hdc /mnt/cdrecorder 
    . смонтировать ISO-образ 
    | mount -o loop file.iso /mnt/cdrom 
    . монтировать файловую систему Windows FAT32 
    | mount -t vfat /dev/hda5 /mnt/hda5 
    . монтировать сетевую файловую систему Windows (SMB/CIFS) 
    | mount -t smbfs -o username=user,password=pass //winclient/share /mnt/share 
    . «монтирует» директорию в  директорию (binding). 
    Доступна с версии ядра 2.4.0. Полезна, например, для  предоставления содержимого пользовательской директории через ftp при работе 
    ftp-сервера в «песочнице» (chroot), когда симлинки сделать невозможно.
    Выполнение данной команды сделает копию содержимого /home/user/prg в /var/ftp/user 
    | mount -o bind /home/user/prg /var/ftp/user 
. Дисковое пространство: 
    . отображает информацию о смонтированных разделах с отображением  общего, доступного и используемого пространства 
    (Прим. переводчика. ключ -h  работает не во всех *nix системах) 
    | df -h 
    . выдаёт список файлов и директорий рекурсивно с сортировкой по  возрастанию размера и позволяет осуществлять 
    постраничный просмотр 
    | ls -lSr |more 
    . подсчитывает и выводит размер, занимаемый директорией 'dir1'  (Прим. переводчика. ключ -h работает не во всех *nix системах) 
    | du -sh dir1
    . отображает размер и имена файлов и директорий, с  соритровкой по размеру 
    | du -sk * | sort -rn 
    . показывает размер  используемого дискового пространства, занимаемое файлами rpm-пакета, с  сортировкой по размеру (fedora, redhat и т.п.) 
    | rpm -q -a --qf '%10{SIZE}t%{NAME}n' | sort -k1,1n 
    . показывает  размер используемого дискового пространства, занимаемое файлами deb-пакета, с  сортировкой по размеру (ubuntu, debian т.п.) 
    | dpkg-query -W -f='${Installed-Size;10}t${Package}n' | sort -k1,1n 
. Пользователи и группы: 
    . создать новую группу с именем group_name 
    | groupadd group_name 
    . удалить группу group_name 
    | groupdel group_name 
    . переименовать группу old_group_name в new_group_name 
    | groupmod -n new_group_name old_group_name 
    . создать пользователя user1, назначить ему в качестве домашнего каталога /home/user1, в качестве shell'а /bin/bash, включить его в группу admin и добавить комментарий Nome Cognome 
    | useradd -c "Nome Cognome" -g admin -d /home/user1 -s /bin/bash user1 
    . создать пользователя user1 
    | useradd user1 
    . удалить пользователя user1 и его домашний каталог 
    | userdel -r user1 
    . изменить атрибуты пользователя 
    | usermod -c "User FTP" -g system -d /ftp/user1 -s /bin/nologin user1 
    . сменить пароль 
    | passwd 
    . сменить пароль пользователя user1 (только root) 
    | passwd user1 
    . установить дату окончания действия учётной записи  пользователя user1 
    | chage -E 2005-12-31 user1 
    . проверить корректность системных файлов учётных записей.  Проверяются файлы /etc/passwd и /etc/shadow 
    | pwck 
    . проверяет корректность системных файлов учётных записей. Проверяется  файл/etc/group 
    | grpck 
    . изменяет первичную группу текущего пользователя.  
    Если указать «-», ситуация будет идентичной той, в которой пользователь вышил  из системы и снова вошёл. 
    Если не указывать группу, первичная группа будет  назначена из /etc/passwd 
    | newgrp [-] group_name 
. Выставление/изменение полномочий на файлы: 
    . просмотр полномочий на файлы и директории в текущей директории 
    | ls -lh 
    . вывести содержимое директории /tmp и  разделить вывод на пять колонок
    | ls /tmp | pr -T5 -W$COLUMNS  
    . добавить полномочия на директорию directory1  ugo(User Group Other)+rwx(Read Write eXecute) — всем полные права. 
    Аналогичное  можно сделать таким образом chmod 777 directory1
    | chmod ugo+rwx directory1 
    . отобрать у группы и всех остальных все полномочия  на директорию directory1. 
    | chmod go-rwx directory1 
    . назначить владельцем файла file1 пользователя 
    | chown user1 file1 
    . назначить рекурсивно владельцем директории  directory1 пользователя user1 
    | user1 chown -R user1 directory1
    . сменить группу-владельца файла file1 на group1 
    | chgrp group1 file1 
    . сменить владельца и группу владельца файла file1 
    | chown user1:group1 file1 
    . назначить SUID-бит файлу /bin/binary_file. 
    Это даёт  возможность любому пользователю запускать на выполнение файл с  полномочиями владельца файла. 
    | chmod u+s /bin/binary_file 
    . снять SUID-бит с файла /bin/binary_file. 
    | chmod u-s /bin/binary_file 
    . назначить SGID-бит директории /home/public.
    | chmod g+s /home/public 
    . снять SGID-бит с директории /home/public.
    | chmod g-s /home/public 
    . назначить STIKY-бит директории /home/public.  Позволяет удалять файлы только владельцам 
    | chmod o+t /home/public 
    . снять STIKY-бит с директории /home/public Специальные атрибуты файлов: 
    | chmod o-t /home/public 
    . позволить открывать файл на запись только в режиме добавления 
    | chattr +a file1 
    . позволяет ядру автоматически сжимать/разжимать содержимое  файла. 
    | chattr +c file1 
    . указывает утилите dump игнорировать данный файл во время  выполнения backup'а 
    | chattr +d file1 
    . делает файл недоступным для любых изменений: редактирование,  удаление, перемещение, создание линков на него. 
    | chattr +i file1 
    . позволяет сделать удаление файла безопасным, т.е. выставленный  атрибут s говорит о том,
     что при удалении файла, место, занимаемое файлом на  диске заполняется нулями, 
     что предотвращает возможность восстановления  данных. 
    | chattr +s file1 
    . указывает, что, при сохранении изменений, будет произведена  синхронизация, как при выполнении команды sync 
    | chattr +S file1 
    . данный атрибут указывает, что при удалении файла содержимое его будет сохранено и при необходимости
     пользователь сможет его восстановить 
    | chattr +u file1 
    . показать атрибуты файлов
    | lsattr  
. Архивирование и сжатие файлов: 
    . разжимает файл 'file1.gz' 
    | bunzip2 file1.bz2
    . сжимает файл 'file1' 
    | gunzip file1.gz
    | gzip file1 или bzip2 file1
    . сжать файл file1 с максимальным сжатием
    | gzip -9 file1
    . создать rar-архив 'file1.rar' и включить в него файл test_file rar 
    | rar a file1.rar test_file
    . bсоздать rar-архив 'file1.rar' и включить в него file1,  file2 и dir1 
    | rar a file1.rar file1 file2 dir1
    . распаковать rar-архив 
    | rar x file1.rar 
    | unrar x file1.rar
    . создать tar-архив archive.tar, содержащий файл file1 
    | tar -cvf archive.tar file1 
    . создать tar-архив archive.tar, содержащий файл file1, file2 и dir1 
    | tar -cvf archive.tar file1 file2 dir1 
    . показать содержимое архива
    | tar -tf archive.tar 
    . распаковать архив 
    | tar -xvf archive.tar 
    . распаковать архив в /tmp 
    | tar -xvf archive.tar -C /tmp 
    . создать архив и сжать его с помощью bzip2
    (Прим. переводчика. ключ -j работает не во всех *nix системах)
    | tar -cvfj archive.tar.bz2 dir1 
    . разжать архив и распаковать его
    (Прим. переводчика.  ключ -j работает не во всех *nix системах) 
    | tar -xvfj archive.tar.bz2 
    . создать архив и сжать его с помощью gzip  
    | tar -xvfz archive.tar.gz
    . разжать архив и распаковать его 
    | tar -cvfz archive.tar.gz dir1 
    . создать сжатый zip-архив
    | zip file1.zip file1  
    . создать сжатый zip-архив и со включением в него  нескольких файлов и/или директорий 
    | zip -r file1.zip file1 file2 dir1 
    . разжать и распаковать zip-архив 
    | unzip file1.zip 
    . RPM пакеты (Fedora, Red Hat и тому подобное): 
    
        rpm -ivh package.rpm — установить пакет с выводом сообщений и прогресс-бара rpm -ivh --nodeps package.rpm — установить пакет с выводом сообщений и  прогресс-бара без контроля зависимостей 
        
        rpm -U package.rpm — обновить пакет без изменений конфигурационных файлов,  в случае отсутствия пакета, он будет установлен 
        
        rpm -F package.rpm — обновить пакет только если он установлен 
        
        rpm -e package_name.rpm — удалить пакет 
        
        rpm -qa — отобразить список всех пакетов, установленных в системе rpm -qa | grep httpd — среди всех пакетов, установленных в системе, найти пакет  содержащий в своём имени «httpd» 
        
        rpm -qi package_name — вывести информацию о конкретном пакете rpm -qg "System Environment/Daemons" — отобразить пакеты входящие в группу  пакетов 
        
        rpm -ql package_name — вывести список файлов, входящих в пакет rpm -qc package_name — вывести список конфигурационных файлов, входящих в  пакет 
        
        rpm -q package_name --whatrequires — вывести список пакетов, необходимых для  установки конкретного пакета по зависимостям 
        
        rpm -q package_name --whatprovides — show capability provided by a rpm package rpm -q package_name --scripts — отобразит скрипты, запускаемые при  установке/удалении пакета 
        
        rpm -q package_name --changelog — вывести историю ревизий пакета rpm -qf /etc/httpd/conf/httpd.conf — проверить какому пакету принадлежит  указанный файл. Указывать следует полный путь и имя файла. 
        
        rpm -qp package.rpm -l — отображает список файлов, входящих в пакет, но ещё не  установленных в систему 
        
        rpm --import /media/cdrom/RPM-GPG-KEY — импортировать публичный ключ  цифровой подписи 
        
        rpm --checksig package.rpm — проверит подпись пакета 
        
        rpm -qa gpg-pubkey — проверить целостность установленного содержимого  пакета 
        
        rpm -V package_name — проверить размер, полномочия, тип, владельца, группу,  MD5-сумму и дату последнего изменеия пакета 
        
        rpm -Va — проверить содержимое всех пакеты установленные в систему.  Выполняйте с осторожностью! 
        
        rpm -Vp package.rpm — проверить пакет, который ещё не установлен в систему rpm2cpio package.rpm | cpio --extract --make-directories *bin* — извлечь из  пакета файлы содержащие в своём имени bin 
        
        rpm -ivh /usr/src/redhat/RPMS/`arch`/package.rpm — установить пакет,  собранный из исходных кодов 
        
        rpmbuild --rebuild package_name.src.rpm — собрать пакет из исходных кодов YUM — средство обновления пакетов(Fedora, RedHat и тому подобное): yum install package_name — закачать и установить пакет
        
        yum update — обновить все пакеты, установленные в систему 
        
        yum update package_name — обновить пакет 
        
        yum remove package_name — удалить пакет 
        
        yum list — вывести список всех пакетов, установленных в систему 
        
        yum search package_name — найти пакет в репозиториях 
        
        yum clean packages — очисть rpm-кэш, удалив закачанные пакеты 
        
        yum clean headers — удалить все заголовки файлов, которые система использует  для разрешения зависимостей 
        
        yum clean all — очисть rpm-кэш, удалив закачанные пакеты и заголовки DEB пакеты (Debian, Ubuntu и тому подобное): 
    . Debian-пакеты (dpkg)    
        dpkg -i package.deb — установить / обновить пакет 
        
        dpkg -r package_name — удалить пакет из системы 
        
        dpkg -l — показать все пакеты, установленные в систему 
        
        dpkg -l | grep httpd — среди всех пакетов, установленных в системе, найти пакет  содержащий в своём имени «httpd» 
        
        dpkg -s package_name — отобразить информацию о конкретном пакете dpkg -L package_name — вывести список файлов, входящих в пакет,  установленный в систему 
        
        dpkg --contents package.deb — отобразить список файлов, входящих в пакет,  который ещё не установлен в систему 
        
        dpkg -S /bin/ping — найти пакет, в который входит указанный файл. APT — средство управление пакетами (Debian, Ubuntu и тому подобное): apt-get update — получить обновлённые списки пакетов 
        
        apt-get upgrade — обновить пакеты, установленные в систему 
        
        apt-get install package_name — установить / обновить пакет 
        
        apt-cdrom install package_name — установить / обновить пакет с cdrom'а apt-get remove package_name — удалить пакет, установленный в систему с  сохранением файлов конфигурации 
        
        apt-get purge package_name — удалить пакет, установленный в систему с  удалением файлов конфигурации 
        
        apt-get check — проверить целостность зависимостей 
        
        apt-get clean — удалить загруженные архивные файлы пакетов 
        
        apt-get autoclean — удалить старые загруженные архивные файлы пакетов Pacman — средство управление пакетами (Arch, Frugalware и alike) 
    
    pacman -S name — install package «name» with dependencies 
    
    pacman -R name — delete package «name» and all files of it 

Просмотр содержимого файлов: 
cat file1 — вывести содержимое файла file1 на стандартное устройство вывода tac file1 — вывести содержимое файла file1 на стандартное устройство вывода в  обратном порядке (последняя строка становиться первой и т.д.) 
more file1 — постраничный вывод содержимого файла file1 на стандартное  устройство вывода 
less file1 — постраничный вывод содержимого файла file1 на стандартное  устройство вывода, но с возможностью пролистывания в обе стороны (вверх-вниз),  поиска по содержимому и т.п. 
head -2 file1 — вывести первые две строки файла file1 на стандартное устройство  вывода. По умолчанию выводится десять строк 
tail -2 file1 — вывести последние две строки файла file1 на стандартное устройство  вывода. По умолчанию выводится десять строк 
tail -f /var/log/messages — выводить содержимое файла /var/log/messages на  стандартное устройство вывода по мере появления в нём текста. 

Манипуляции с текстом:
grep -HR OLDTEXT ./ | awk '{print $1}' | sed 's/:.*$//' | grep -v '~' | sort | uniq |  xargs perl -i -pe "s/OLD_TEXT/NEW_TEXT/g;" — Поиск и замена текста OLDTEXT на NEW_TEXT во многих файлах одновременно с рекурсивным обходом директорий. 
cat file_originale | [operation: sed, grep, awk, grep и т.п.] > result.txt — общий  синтаксис выполнения действий по обработке содержимого файла и вывода  результата в новый 
cat file_originale | [operazione: sed, grep, awk, grepи т.п.] >> result.txt — общий  синтаксис выполнения действий по обработке содержимого файла и вывода  результата в существующий файл. Если файл не существует, он будет создан grep Aug /var/log/messages — из файла '/var/log/messages' отобрать и вывести на  стандартное устройство вывода строки, содержащие «Aug» 
grep ^Aug /var/log/messages — из файла '/var/log/messages' отобрать и вывести на  стандартное устройство вывода строки, начинающиеся на «Aug» grep [0-9] /var/log/messages — из файла '/var/log/messages' отобрать и вывести на  стандартное устройство вывода строки, содержащие цифры 
grep Aug -R /var/log/* — отобрать и вывести на стандартное устройство вывода  строки, содержащие «Augr», во всех файлах, находящихся в директории /var/log и  ниже 
sed 's/stringa1/stringa2/g' example.txt — в файле example.txt заменить «string1» на  «string2», результат вывести на стандартное устройство вывода. sed '/^$/d' example.txt — удалить пустые строки из файла example.txt sed '/ *#/d; /^$/d' example.txt — удалить пустые строки и комментарии из файла  example.txt 
echo 'esempio' | tr '[:lower:]' '[:upper:]' — преобразовать символы из нижнего  регистра в верхний 
sed -e '1d' result.txt — удалить первую строку из файла example.txt sed -n '/string1/p' — отобразить только строки, содержащие «string1» sed -e 's/ *$//' example.txt — удалить пустые символы в конце каждой строки sed -e 's/string1//g' example.txt — удалить строку «string1» из текста не изменяя  всего остального 
sed -n '1,8p;5q' example.txt — взять из файла с первой по восьмую строки и из них  вывести первые пять 
sed -n '5p;5q' example.txt — вывести пятую строку 
sed -e 's/0*/0/g' example.txt — заменить последовательность из любого количества  нулей одним нулём 
cat -n file1 — пронумеровать строки при выводе содержимого файла cat example.txt | awk 'NR%2==1' — при выводе содержимого файла, не выводить  чётные строки файла 
echo a b c | awk '{print $1}' — вывести первую колонку. Разделение, по  умолчанию, по пробелу/пробелам или символу/символам табуляции echo a b c | awk '{print $1,$3}' — вывести первую и третью колонки. Разделение,  по умолчанию, по проблелу/пробелам или символу/символам табуляции paste file1 file2 — объединить содержимое file1 и file2 в виде таблицы: строка 1 из  file1 = строка 1 колонка 1-n, строка 1 из file2 = строка 1 колонка n+1-m paste -d '+' file1 file2 — объединить содержимое file1 и file2 в виде таблицы с  разделителем «+» 
sort file1 file2 — отсортировать содержимое двух файлов 
sort file1 file2 | uniq — отсортировать содержимое двух файлов, не отображая  повторов
sort file1 file2 | uniq -u — отсортировать содержимое двух файлов, отображая  только уникальные строки (строки, встречающиеся в обоих файлах, не выводятся  на стандартное устройство вывода) 
sort file1 file2 | uniq -d — отсортировать содержимое двух файлов, отображая  только повторяющиеся строки 
comm -1 file1 file2 — сравнить содержимое двух файлов, не отображая строки  принадлежащие файлу 'file1' 
comm -2 file1 file2 — сравнить содержимое двух файлов, не отображая строки  принадлежащие файлу 'file2' 
comm -3 file1 file2 — сравнить содержимое двух файлов, удаляя строки  встречающиеся в обоих файлах 

Преобразование наборов символов и файловых форматов: 
dos2unix filedos.txt fileunix.txt — конвертировать файл текстового формата из  MSDOS в UNIX (разница в символах возврата каретки) 
unix2dos fileunix.txt filedos.txt — конвертировать файл текстового формата из  UNIX в MSDOS (разница в символах возврата каретки) 
recode ..HTML < page.txt > page.html — конвертировать содержимое тестового  файла page.txt в html-файл page.html 
recode -l | more — вывести список доступных форматов 

Анализ файловых систем: 
badblocks -v /dev/hda1 — проверить раздел hda1 на наличие bad-блоков fsck /dev/hda1 — проверить/восстановить целостность linux-файловой системы  раздела hda1 
fsck.ext2 /dev/hda1 или e2fsck /dev/hda1 — проверить/восстановить целостность  файловой системы ext2 раздела hda1 
e2fsck -j /dev/hda1 — проверить/восстановить целостность файловой системы ext3  раздела hda1 с указанием, что журнал расположен там же 
fsck.ext3 /dev/hda1 — проверить/восстановить целостность файловой системы ext3  раздела hda1 
fsck.vfat /dev/hda1 или fsck.msdos /dev/hda1 или dosfsck /dev/hda1 — проверить/восстановить целостность файловой системы fat раздела hda11 Форматирование файловых систем: 
mkfs /dev/hda1 — создать linux-файловую систему на разделе hda1 
mke2fs /dev/hda1 — создать файловую систему ext2 на разделе hda1 
mke2fs -j /dev/hda1 — создать журналирующую файловую систему ext3 на разделе  hda1 
mkfs -t vfat 32 -F /dev/hda1 — создать файловую систему FAT32 на разделе hda1 fdformat -n /dev/fd0 — форматирование флоппи-диска без проверки mkswap /dev/hda3 — создание swap-пространства на разделе hda3 
swap-пространство: 
mkswap /dev/hda3 — создание swap-пространства на разделе hda3 
swapon /dev/hda3 — активировать swap-пространство, расположенное на разделе  hda3 
swapon /dev/hda2 /dev/hdb3 — активировать swap-пространства, расположенные  на разделах hda2 и hdb3 

Создание резервных копий (backup): 
dump -0aj -f /tmp/home0.bak /home — создать полную резервную копию  директории /home в файл /tmp/home0.bak 
dump -1aj -f /tmp/home0.bak /home — создать инкрементальную резервную копию  директории /home в файл /tmp/home0.bak 
restore -if /tmp/home0.bak — восстановить из резервной копии /tmp/home0.bak rsync -rogpav --delete /home /tmp — синхронизировать /tmp с /home
rsync -rogpav -e ssh --delete /home ip_address:/tmp — синхронизировать через SSH-туннель 
rsync -az -e ssh --delete ip_addr:/home/public /home/local — синхронизировать локальную директорию с удалённой директорией через ssh-туннель со сжатием rsync -az -e ssh --delete /home/local ip_addr:/home/public — синхронизировать удалённую директорию с локальной директорией через ssh-туннель со сжатием 
dd bs=1M if=/dev/hda | gzip | ssh user@ip_addr 'dd of=hda.gz' — сделать «слепок»  локального диска в файл на удалённом компьютере через ssh-туннель tar -Puf backup.tar /home/user — создать инкрементальную резервную копию директории '/home/user' в файл backup.tar с сохранением полномочий ( cd /tmp/local/ && tar c . ) | ssh -C user@ip_addr 'cd /home/share/ && tar x -p' — копирование содержимого /tmp/local на удалённый компьютер через ssh-туннель в /home/share/ 
( tar c /home ) | ssh -C user@ip_addr 'cd /home/backup-home && tar x -p' — копирование содержимого /home на удалённый компьютер через ssh-туннель в /home/backup-home 
tar cf - . | (cd /tmp/backup ; tar xf - ) — копирование одной директории в другую с  сохранением полномочий и линков 
find /home/user1 -name '*.txt' | xargs cp -av --target-directory=/home/backup/ -- parents — поиск в /home/user1 всех файлов, имена которых оканчиваются на '.txt', и  копирование их в другую директорию 
find /var/log -name '*.log' | tar cv --files-from=- | bzip2 > log.tar.bz2 — поиск в  /var/log всех файлов, имена которых оканчиваются на '.log', и создание bzip-архива  из них 

dd
dd if=/dev/hda of=/dev/fd0 bs=512 count=1 — создать копию MBR (Master Boot  Record) с /dev/hda на флоппи-диск 
dd if=/dev/fd0 of=/dev/hda bs=512 count=1 — восстановить MBR с флоппи-диска на /dev/hda 

CDROM: 
cdrecord -v gracetime=2 dev=/dev/cdrom -eject blank=fast -force — clean a  rewritable cdrom 
mkisofs /dev/cdrom > cd.iso — create an iso image of cdrom on disk 
mkisofs /dev/cdrom | gzip > cd_iso.gz — create a compressed iso image of cdrom on  disk 
mkisofs -J -allow-leading-dots -R -V "Label CD" -iso-level 4 -o ./cd.iso data_cd — create an iso image of a directory 
cdrecord -v dev=/dev/cdrom cd.iso — burn an ISO image 
gzip -dc cd_iso.gz | cdrecord dev=/dev/cdrom — burn a compressed ISO image mount -o loop cd.iso /mnt/iso — mount an ISO image 
cd-paranoia -B — rip audio tracks from a CD to wav files 
cd-paranoia -- "-3" — rip first three audio tracks from a CD to wav files cdrecord --scanbus — scan bus to identify the channel scsi 

Сеть (LAN и WiFi): 
ifconfig eth0 — показать конфигурацию сетевого интерфейса eth0 
ifup eth0 — активировать (поднять) интерфейс eth0 
ifdown eth0 — деактивировать (опустить) интерфейс eth0 
ifconfig eth0 192.168.1.1 netmask 255.255.255.0 — выставить интерфейсу eth0 IP адрес и маску подсети 
ifconfig eth0 promisc — перевести интерфейс eth0 в promiscuous-режим для  «отлова» пакетов (sniffing) 
ifconfig eth0 -promisc — отключить promiscuous-режим на интерфейсе eth0 dhclient eth0 — активировать интерфейс eth0 в dhcp-режиме.
route -n 
netstat -rn — вывести локальную таблицу маршрутизации 
route add -net 0/0 gw IP_Gateway — задать IP-адрес шлюза по умолчанию (default  gateway) 
route add -net 192.168.0.0 netmask 255.255.0.0 gw 192.168.1.1 — добавить  статический маршрут в сеть 192.168.0.0/16 через шлюз с IP-адресом 192.168.1.1 route del 0/0 gw IP_gateway — удалить IP-адрес шлюза по умолчанию (default  gateway) 
echo "1" > /proc/sys/net/ipv4/ip_forward — разрешить пересылку пакетов  (forwarding) 
hostname — отобразить имя компьютера 
host www.example.com или host 192.0.43.10 — разрешить имя www.example.com  хоста в IP-адрес и наоборот 
ip link show — отобразить состояние всех интерфейсов 
mii-tool eth0 — отобразить статус и тип соединения для интерфейса eth0 ethtool eth0 — отображает статистику интерфейса eth0 с выводом такой  информации, как поддерживаемые и текущие режимы соединения 
netstat -tupn — отображает все установленные сетевые соединения по протоколам  TCP и UDP без разрешения имён в IP-адреса и PID'ы и имена процессов,  обеспечивающих эти соединения 
netstat -tupln — отображает все сетевые соединения по протоколам TCP и UDP без  разрешения имён в IP-адреса и PID'ы и имена процессов, слушающих порты tcpdump tcp port 80 — отобразить весь трафик на TCP-порт 80 (обычно — HTTP) iwlist scan — просканировать эфир на предмет, доступности беспроводных точек  доступа 
iwconfig eth1 — показать конфигурацию беспроводного сетевого интерфейса eth1 Microsoft Windows networks(SAMBA): 
nbtscan ip_addr 
nmblookup -A ip_addr — разрешить netbios-имя nbtscan не во всех системах  ставится по умолчанию, возможно, придётся доустанавливать вручную. nmblookup  включён в пакет samba. 
smbclient -L ip_addr/hostname — отобразить ресурсы, предоставленные в общий  доступ на windows-машине 
smbget -Rr smb://ip_addr/share — подобно wget может получить файлы с  windows-машин через smb-протокол 
mount -t smbfs -o username=user,password=pass //winclient/share /mnt/share — смонтировать smb-ресурс, предоставленный на windows-машине, в локальную  файловую систему 

IPTABLES (firewall): 
iptables -t filter -nL 
iptables -nL — отобразить все цепочки правил 
iptables -t nat -L — отобразить все цепочки правил в NAT-таблице 
iptables -t filter -F или iptables -F — очистить все цепочки правил в filter-таблице iptables -t nat -F — очистить все цепочки правил в NAT-таблице 
iptables -t filter -X — удалить все пользовательские цепочки правил в filter-таблице iptables -t filter -A INPUT -p tcp --dport telnet -j ACCEPT — позволить входящее  подключение telnet'ом 
iptables -t filter -A OUTPUT -p tcp --dport http -j DROP — блокировать  исходящие HTTP-соединения 
iptables -t filter -A FORWARD -p tcp --dport pop3 -j ACCEPT — позволить  «прокидывать» (forward) POP3-соединения
iptables -t filter -A INPUT -j LOG --log-prefix "DROP INPUT" — включить  журналирование ядром пакетов, проходящих через цепочку INPUT, и добавлением  к сообщению префикса «DROP INPUT» 
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE — включить NAT  (Network Address Translate) исходящих пакетов на интерфейс eth0. Допустимо при использовании с динамически выделяемыми IP-адресами. 
iptables -t nat -A PREROUTING -d 192.168.0.1 -p tcp -m tcp --dport 22 -j DNAT -- to-destination 10.0.0.2:22 — перенаправление пакетов, адресованных одному хосту,  на другой хост 

Мониторинг и отладка: 
top — отобразить запущенные процессы, используемые ими ресурсы и другую  полезную информацию (с автоматическим обновлением данных) 
ps -eafw — отобразить запущенные процессы, используемые ими ресурсы и  другую полезную информацию (единожды) 
ps -e -o pid,args --forest — вывести PID'ы и процессы в виде дерева 
pstree — отобразить дерево процессов 
kill -9 98989 или kill -KILL 98989 — «убить» процесс с PID 98989 «на смерть» (без  соблюдения целостности данных) 
kill -TERM 98989 — корректно завершить процесс с PID 98989 
kill -1 98989 или kill -HUP 98989 — заставить процесс с PID 98989 перепрочитать  файл конфигурации 
lsof -p 98989 — отобразить список файлов, открытых процессом с PID 98989 lsof /home/user1 — отобразить список открытых файлов из директории /home/user1 strace -c ls >/dev/null — вывести список системных вызовов, созданных и  полученных процессом ls 
strace -f -e open ls >/dev/null — вывести вызовы библиотек 
watch -n1 'cat /proc/interrupts' — отображать прерывания в режиме реального  времени 
last reboot — отобразить историю перезагрузок системы 
last user1 — отобразить историю регистрации пользователя user1 в системе и  время его нахождения в ней 
lsmod — вывести загруженные модули ядра 
free -m — показать состояние оперативной памяти в мегабайтах 
smartctl -A /dev/hda — контроль состояния жёсткого диска /dev/hda через SMART smartctl -i /dev/hda — проверить доступность SMART на жёстком диске /dev/hda tail /var/log/dmesg — вывести десять последних записей из журнала загрузки ядра tail /var/log/messages — вывести десять последних записей из системного журнала Другие полезные команды: 
apropos …keyword — выводит список команд, которые так или иначе относятся к  ключевым словам. Полезно, когда вы знаете что делает программа, но не помните  команду 
man ping — вызов руководства по работе с программой, в данном случае, — ping whatis …keyword — отображает описание действий указанной программы mkbootdisk --device /dev/fd0 `uname -r` — создаёт загрузочный флоппи-диск gpg -c file1 — шифрует файл file1 с помощью GNU Privacy Guard 
gpg file1.gpg — дешифрует файл file1 с помощью GNU Privacy Guard wget -r http://www.example.com — загружает рекурсивно содержимое сайта  http://www.example.com 
wget -c http://www.example.com/file.iso — загрузить файл  
http://www.example.com/file.iso с возможностью останова и продолжения в  последствии
echo 'wget -c http://www.example.com/files.iso' | at 09:00 — начать закачку в  указанное время 
ldd /usr/bin/ssh — вывести список библиотек, необходимых для работы ssh alias hh='history' — назначить алиас hh команде history
