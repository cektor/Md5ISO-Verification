#!/bin/bash

# GNU License | Fatih ÖNDER - https://fatihonder.org.tr - https://github.com/cektor

read -p "ISO dosyasının yolunu girin: " iso_file
read -p "Beklenen MD5 özet değerini girin: " expected_md5

if [ -z "$iso_file" ] || [ -z "$expected_md5" ]; then
    echo "Hata: Geçerli bir ISO dosyası yolunu ve beklenen MD5 değerini girmelisiniz."
    exit 1
fi

if [ ! -f "$iso_file" ]; then
    echo "Hata: $iso_file dosyası bulunamadı!"
    exit 1
fi

# ISO dosyasının MD5 toplamını kontrol etme
computed_md5=$(md5sum "$iso_file" | awk '{print $1}')

if [ "$computed_md5" == "$expected_md5" ]; then
    echo "MD5 toplamı doğru!"
else
    echo "Hatalı MD5 toplamı! Dosya bozulmuş olabilir."
fi

