# gdtools_analysis.sh by Kyle Card

# Run this shell script from the 'LTEE_WGS_project' directory

#####

# Assigns path to variable. Change this string to where your 'LTEE_WGS_project' folder is
pth='/mnt/c/Users/cardk/Documents/LTEE_WGS_project'

# Creates new directories to store the sequencing results and .gd files, then moves them
mkdir sequencing_results
mkdir gd_files


for i in {60..67} {72..75} {80..83} {108..115} {120..123} {128..131} {148..155} {160..163} {184..187} {212..219} {224..227} {232..235}
do
	mv trimmed_read_files/KJC"$i" sequencing_results
done


for i in {60..67} {72..75} {80..83} {108..115} {120..123} {128..131} {148..155} {160..163} {184..187} {212..219} {224..227} {232..235}
do
	cd sequencing_results/KJC"$i"/data/
	cp output.gd KJC"$i".gd
	mv KJC"$i".gd $pth/gd_files
	cd ../../
done


# Downloads the parental strain .gd files from Jeff Barrick's GitHub repository
cd gd_files/
curl -o REL11348.gd https://raw.githubusercontent.com/barricklab/LTEE-Ecoli/master/LTEE-clone-curated/Ara%2B4_50000gen_11348.gd
curl -o REL11367.gd https://raw.githubusercontent.com/barricklab/LTEE-Ecoli/master/LTEE-clone-curated/Ara%2B5_50000gen_11367.gd
curl -o REL11339.gd https://raw.githubusercontent.com/barricklab/LTEE-Ecoli/master/LTEE-clone-curated/Ara-5_50000gen_11339.gd
curl -o REL11389.gd https://raw.githubusercontent.com/barricklab/LTEE-Ecoli/master/LTEE-clone-curated/Ara-6_50000gen_11389.gd

cd ..

# Compare mutants derived from the Ara+4 background against their parental strain
gdtools COMPARE -o AraP4_annotation.html -r read_files/REL606.gbk gd_files/REL11348.gd gd_files/KJC64.gd gd_files/KJC72.gd gd_files/KJC80.gd gd_files/KJC112.gd gd_files/KJC120.gd gd_files/KJC128.gd gd_files/KJC152.gd gd_files/KJC160.gd gd_files/KJC184.gd gd_files/KJC216.gd gd_files/KJC224.gd gd_files/KJC232.gd
gdtools COMPARE -o AraP5_annotation.html -r read_files/REL606.gbk gd_files/REL11367.gd gd_files/KJC65.gd gd_files/KJC73.gd gd_files/KJC81.gd gd_files/KJC113.gd gd_files/KJC121.gd gd_files/KJC129.gd gd_files/KJC153.gd gd_files/KJC161.gd gd_files/KJC185.gd gd_files/KJC217.gd gd_files/KJC225.gd gd_files/KJC233.gd
gdtools COMPARE -o AraM5_annotation.html -r read_files/REL606.gbk gd_files/REL11339.gd gd_files/KJC66.gd gd_files/KJC74.gd gd_files/KJC82.gd gd_files/KJC114.gd gd_files/KJC122.gd gd_files/KJC130.gd gd_files/KJC154.gd gd_files/KJC162.gd gd_files/KJC186.gd gd_files/KJC218.gd gd_files/KJC226.gd gd_files/KJC234.gd
gdtools COMPARE -o AraM6_annotation.html -r read_files/REL606.gbk gd_files/REL11389.gd gd_files/KJC67.gd gd_files/KJC75.gd gd_files/KJC83.gd gd_files/KJC115.gd gd_files/KJC123.gd gd_files/KJC131.gd gd_files/KJC155.gd gd_files/KJC163.gd gd_files/KJC187.gd gd_files/KJC219.gd gd_files/KJC227.gd gd_files/KJC235.gd


# KJC152, KJC184, and KJC217 are cross contaminants