all:    
	chmod a+rwx `pwd`
	python gm_main.py --file `pwd`/samplegraph.txt --dest_dir `pwd`/output --belief_file `pwd`/priorsbelief.txt --unweighted --undirected

run_epi:    
	chmod a+rwx `pwd`
	python gm_main.py --file `pwd`/../datafiles/soc-Epinions1-nosharp.txt --dest_dir `pwd`/output_epi --unweighted --undirected > running_epi &

test:    
	chmod a+rwx `pwd`
	python gm_main.py --file `pwd`/unittest1_0.txt --dest_dir `pwd`/output --unweighted --undirected

install:
	sudo apt-get install python-psycopg2

all.tar:
	tar -zcvf graphminer.tar.gz *.txt makefile *.py matlab output doc

clean:
	rm *.pyc


