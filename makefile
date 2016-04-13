demo:
	chmod a+rwx `pwd`
	mkdir -p `pwd`/output/demo
	python gm_main.py --file `pwd`/samplegraph.txt --dest_dir `pwd`/output/demo --belief_file `pwd`/priorsbelief.txt --unweighted --undirected

unit_tests:
	chmod a+rwx `pwd`
	mkdir -p `pwd`/output/unittest1
	python gm_main.py --file `pwd`/unit_tests/unittest1.txt --dest_dir `pwd`/output/unittest1 --unweighted --undirected
	mkdir -p `pwd`/output/unittest2
	python gm_main.py --file `pwd`/unit_tests/unittest2.txt --dest_dir `pwd`/output/unittest2 --unweighted --undirected
	mkdir -p `pwd`/output/unittest3
	python gm_main.py --file `pwd`/unit_tests/unittest3.txt --dest_dir `pwd`/output/unittest3 --unweighted --undirected
	mkdir -p `pwd`/output/unittest4
	python gm_main.py --file `pwd`/unit_tests/unittest4.txt --dest_dir `pwd`/output/unittest4 --unweighted --undirected
	mkdir -p `pwd`/output/unittest5

install:
	sudo apt-get install python-psycopg2

all.tar:
	tar -zcvf graphminer.tar.gz *.txt makefile *.py matlab output doc

clean:
	rm -rf *.pyc output/*


