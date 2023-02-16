#!/usr/bin/env bash
var=$(date)
var=`date`
echo " "
echo "------------- macesdev foundation -------------"
echo "---------------- mdkn@22.1.0.0 ---------------- "
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
git push
echo "✔ - Güncellendi!"

echo " "
echo "Güncelleme başarılı, mdev.account.build çalıştırılmak üzere sevk ediliyor.."
echo " "