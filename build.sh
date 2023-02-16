#!/usr/bin/env bash
var=$(date)
var=`date`
echo " "
echo "------------- macesdev foundation -------------"
echo "---------------- mdkn@23.1.4.7 ---------------- "
echo " "

echo "◉ - Dosyalar güncelleniyor.."
git add . 
git add -A &>/dev/null
echo "✔ - Dosyalar güncellendi!"
echo "◉ - Uzak değişiklikler ekleniyor.."
git fetch 
echo "✔ - Değişiklikler eklendi!"
echo "◉ - Dallar güncelleniyor.."
git merge 
echo "✔ - Dallar güncellendi!"
echo "◉ - Değişiklikler temin ediliyor.."
git commit -m "mdev.mdkn@latest - $var"
echo "✔ - Değişilikler eklendi!"
echo "◉ - Güncelleniyor.."
git push -f origin main
echo "✔ - Güncellendi!"

echo " "
echo "Güncelleme başarılı, mdev.account.build çalıştırılmak üzere sevk ediliyor.."
echo " "