FROM wordpress:5.2.4-php7.1-apache

LABEL author=FranciscoMat email=francisco@f5sites.com

EXPOSE 80
EXPOSE 443

RUN apt-get update && apt-get install -y \
	nano  \
	curl \
	certbot \
	python-certbot-apache \
	letsencrypt \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir /var/log/dockervhost/

#	a2enmod ssl \
	#certbot

ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# RUN rm  -rf /etc/apache2/sites-enabled
# ADD vhosts /etc/apache2/sites-enabled
#ADD letsencrypt /etc/letsencrypt
RUN a2enmod ssl
RUN a2enmod headers
