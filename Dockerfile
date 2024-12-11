# Используем официальный образ Jenkins LTS
FROM jenkins/jenkins:lts

# Указываем, что Jenkins будет запущен с административными правами
USER root

# Устанавливаем дополнительные зависимости, если нужно (по умолчанию ничего не добавляется)
RUN apt-get update && apt-get install -y \
    curl \
    git \
    && apt-get clean

# Открываем порт для Jenkins
EXPOSE 8080
EXPOSE 50000

# Определяем директорию для Jenkins
VOLUME /var/jenkins_home

# Указываем команду по умолчанию
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]