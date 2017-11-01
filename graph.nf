
/* Example Nextflow pipline that runs Docking using rDock 
*/

params.ligands = 'DSI_new.smi'
params.chunk = 500

ligands = file(params.ligands)

/* Splits the input SD file into multiple files of ${params.chunk} records.
* Each file is sent individually to the ligand_parts channel
*/
process sdsplit {

	container 'abradle/fragalysis'

	input:
    file ligands

    output:
    file 'ligands_part*' into ligand_parts mode flatten
    
    """
	python /usr/local/fragalysis/frag/network/scripts/split_input.py --input $ligands --chunk_size $params.chunk --output ligands_part
    """
}


/* Builds the graph for each part
*/
process graph {
	
	errorStrategy 'retry'
	container 'abradle/fragalysis'

	input:
    file part from ligand_parts
	
    output:
    file 'output_part*/edges.txt' into docked_parts
    
    """
     python /usr/local/fragalysis/frag/network/scripts/build_db.py --input  $part --base_dir ${part.name.replace('ligands', 'output')[0..-5]} 
    """
}


