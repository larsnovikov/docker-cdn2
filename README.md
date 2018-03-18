Готовый контейнер для cdn [https://github.com/larsnovikov/cdn]
=====================

# Установка

 - Склонируйте этот репозиторий
 - Выполните `bash startup.sh`
 - Следуйте подсказкам
 - PROFIT

# Описание

Сборка происходит из трех контейнеров:
 - nginx_front (web-сервер принимающий и обрабатывающий запросы к фотографиям)
 - nginx_app (web-сервер принимающий и обрабатывающий запросы к приложению (загрузка и удаление картинки))
 - php-fpm (fpm для nginx_app)
 
# Хранение картинок

<p>
    Исходники картнок должны располагаться в директории images/input 
</p>
<p>
    Файлы водяных знаков должны располагаться в директории images/watermark 
</p>
<p>
    Выходные картинки будут сохраняться в директории images/output/<storage_name>, где <storage_name> - папка хранилища. Предполагается, что хранилища будут примонтированными жесткими дисками.
</p>
