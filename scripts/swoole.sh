#!/bin/bash

install_swoole() {
    echo "--------------------------------------------"
    echo ""
    echo "     Indtall Swoole-1.7.17"
    echo ""
    echo "     By:Andy http://www.moqifei.com"
    echo ""
    echo "--------------------------------------------"

    cd ${current_dir}/src
    tar -zxvf swoole-src-swoole-1.7.17-stable.tar.gz
    cd swoole-src-swoole-1.7.17-stable

    sed -i '/swoole.so/d' /usr/local/php/etc/php.ini
    zend_ext_dir="/usr/local/php/lib/php/extensions/no-debug-non-zts-20131226/"
    if [ -s "${zend_ext_dir}swoole.so" ]; then
        rm -f "${zend_ext_dir}swoole.so"
    fi

    /usr/local/php/bin/phpize
    ./configure --with-php-config=/usr/local/php/bin/php-config
    make && make install

    sed -i '/; Windows Extensions/i\extension=swoole.so' /usr/local/php/etc/php.ini

    /etc/init.d/php-fpm restart

    echo "====== swoole install completed ======"
    echo "swoole installed successfully!"

}