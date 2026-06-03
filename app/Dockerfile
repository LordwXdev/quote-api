FROM php:8.2-apache

# Copy all PHP files into the web root
COPY . /var/www/html/

# Make sure Apache can read the files
RUN chown -R www-data:www-data /var/www/html/

EXPOSE 80

