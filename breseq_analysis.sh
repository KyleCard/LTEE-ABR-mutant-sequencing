# breseq.sh by Kyle Card

# Trimmed raw sequence reads in BaseSpace to remove Illumina-specific adapters
# Then sequence reads were quality filtered on the Galaxy platform with Trimmomatic v0.38 and settings: SLIDINGWINDOW:4:20 MINLEN:36
# Quality control checks were then performed using FastQC

# Run this shell script from the 'LTEE_WGS_project' directory that contains a 'trimmed_read_files' folder with all of the trimmed read files

#####

# breseq for variant calling
cd trimmed_read_files

for i in {60..67} {72..75} {80..83} {108..115} {120..123} {128..131} {148..155} {160..163} {184..187} {212..219} {224..227} {232..235}
do
	mkdir KJC"$i"
	cd ./KJC"$i"
	breseq -r ../REL606.gbk ../KJC"$i"_R1.fastq ../KJC"$i"_R2.fastq -j 12
	cd ..
done

cd ..
