#!/usr/bin/env bash

now=$(date +"%m-%d-%Y, "%T"")

echo " "
echo "------------- macesdev foundation -------------"
echo "---------------- mdkn@23.1.4.7 ---------------- "
echo " "

echo "◉ - Dosyalar güncelleniyor.."
git add . 
git add -A &>/dev/null
echo "✔ - Dosyalar güncellendi!"
echo "◉ - Uzak değişiklikler ekleniyor.."
git fetch &>/dev/null
echo "✔ - Değişiklikler eklendi!"
echo "◉ - Dallar güncelleniyor.."
git merge &>/dev/null
echo "✔ - Dallar güncellendi!"
echo "◉ - Değişiklikler temin ediliyor.."
git commit -m "mdkn@latest - $now" &>/dev/null
echo "✔ - Değişilikler eklendi!"
echo "◉ - Güncelleniyor.."
git push -f origin main &>/dev/null
echo "✔ - Güncellendi!"


echo " "
echo "Güncelleme başarılı, mdev.account.build çalıştırılmak üzere sevk ediliyor.."
echo " "