all:    
	chmod a+rwx `pwd`
	python gm_main.py --file `pwd`/unittest5.txt --dest_dir `pwd`/output  --unweighted --undirected

epi:
	chmod a+rwx `pwd`
	python gm_main.py --file `pwd`/../datafiles/soc-Epinions1-nosharp.txt --dest_dir `pwd`/output_epi --unweighted --undirected

slash:
	chmod a+rwx `pwd`
	python gm_main.py --file `pwd`/../datafiles/soc-Slashdot0811-nosharp.txt --dest_dir `pwd`/output_slash --unweighted --undirected
	
install:
	sudo apt-get install python-psycopg2

all.tar:
	tar -zcvf graphminer.tar.gz *.txt makefile *.py matlab output doc

clean:
	rm *.pyc


