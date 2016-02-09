all:    
	chmod a+rwx `pwd`
	python gm_main.py --file `pwd`/samplegraph.txt --dest_dir `pwd`/output --belief_file `pwd`/priorsbelief.txt --unweighted --undirected

run_epi:    
	chmod a+rwx `pwd`
	python gm_main.py --file `pwd`/../datafiles/soc-Epinions1-nosharp.txt --dest_dir `pwd`/output_epi --unweighted --undirected

run_slash:    
	chmod a+rwx `pwd`
	python gm_main.py --file `pwd`/../datafiles/soc-Slashdot0811-nosharp.txt --dest_dir `pwd`/output_slash --unweighted --undirected

test:    
	chmod a+rwx `pwd`
	python gm_main.py --file `pwd`/unittest1_0.txt --dest_dir `pwd`/output --unweighted --undirected
	python gm_main.py --file `pwd`/unittest1.txt --dest_dir `pwd`/output --unweighted --undirected
	python gm_main.py --file `pwd`/unittest2.txt --dest_dir `pwd`/output --unweighted --undirected
	python gm_main.py --file `pwd`/unittest3.txt --dest_dir `pwd`/output --unweighted --undirected
	python gm_main.py --file `pwd`/unittest4.txt --dest_dir `pwd`/output --unweighted --undirected
	python gm_main.py --file `pwd`/unittest5.txt --dest_dir `pwd`/output --unweighted --undirected

install:
	sudo apt-get install python-psycopg2

all.tar:
	tar -zcvf graphminer.tar.gz *.txt makefile *.py matlab output doc

clean:
	rm *.pyc


