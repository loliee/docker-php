require 'serverspec'

set :backend, :exec

describe command('docker run --rm --name php56-version"$(date +%s)" loliee/docker-php:5.6 php -v') do
    its(:stdout) { should match /PHP 5.6.20/ }
end

describe command('docker run --name php56-module-test"$(date +%s)" loliee/docker-php:5.6 php -m') do
    its(:stdout) { should match /bcmath/ }
    its(:stdout) { should match /bz2/ }
    its(:stdout) { should match /ctype/ }
    its(:stdout) { should match /curl/ }
    its(:stdout) { should match /exif/ }
    its(:stdout) { should match /fileinfo/ }
    its(:stdout) { should match /ftp/ }
    its(:stdout) { should match /gd/ }
    its(:stdout) { should match /gettext/ }
    its(:stdout) { should match /hash/ }
    its(:stdout) { should match /iconv/ }
    its(:stdout) { should match /imap/ }
    its(:stdout) { should match /intl/ }
    its(:stdout) { should match /json/ }
    its(:stdout) { should match /mbstring/ }
    its(:stdout) { should match /mcrypt/ }
    its(:stdout) { should match /mongodb/}
    its(:stdout) { should match /mysql/ }
    its(:stdout) { should match /mysqli/ }
    its(:stdout) { should match /odbc/ }
    its(:stdout) { should match /pcntl/ }
    its(:stdout) { should match /pdo/ }
    its(:stdout) { should match /pdo_mysql/ }
    its(:stdout) { should match /pdo_pgsql/ }
    its(:stdout) { should match /pdo_sqlite/ }
    its(:stdout) { should match /pgsql/ }
    its(:stdout) { should match /Phar/ }
    its(:stdout) { should match /redis/ }
    its(:stdout) { should match /SimpleXML/ }
    its(:stdout) { should match /soap/ }
    its(:stdout) { should match /sockets/ }
    its(:stdout) { should match /sysvmsg/ }
    its(:stdout) { should match /sysvsem/ }
    its(:stdout) { should match /sysvshm/ }
    its(:stdout) { should match /tidy/ }
    its(:stdout) { should match /tokenizer/ }
    its(:stdout) { should match /Xdebug/ }
    its(:stdout) { should match /xml/ }
    its(:stdout) { should match /xmlreader/ }
    its(:stdout) { should match /xmlrpc/ }
    its(:stdout) { should match /xmlwriter/ }
    its(:stdout) { should match /xsl/ }
    its(:stdout) { should match /zip/ }
end
