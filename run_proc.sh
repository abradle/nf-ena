/home/ec2-user/nextflow run graph.nf -with-docker busybox
awk '!x[$0]++' work/*/*/output_part*/nodes.txt > nodes.txt
awk '!x[$0]++' work/*/*/output_part*/attributes.txt > attributes.txt
awk '!x[$0]++' work/*/*/output_part*/edges.txt > edges.txt


