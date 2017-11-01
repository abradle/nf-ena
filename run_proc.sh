/home/ec2-user/nextflow run graph.nf -resume -with-docker busybox
awk '!x[$0]++' /mnt/shared/ec2-user/work/*/*/output_part*/nodes.txt > nodes.txt
awk '!x[$0]++' /mnt/shared/ec2-user/work/*/*/output_part*/attributes.txt > attributes.txt
awk '!x[$0]++' /mnt/shared/ec2-user/work/*/*/output_part*/edges.txt > edges.txt


