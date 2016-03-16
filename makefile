demo:    
	chmod a+rwx `pwd`
	python gm_main.py --file `pwd`/samplegraph.txt --dest_dir `pwd`/output --belief_file `pwd`/priorsbelief.txt --unweighted --undirected

run_soc-Epinions1:    
	chmod a+rwx `pwd`
	wget http://snap.stanford.edu/data/soc-Epinions1.txt.gz
	gunzip soc-Epinions1.txt.gz
	grep -v "#" soc-Epinions1.txt > soc-Epinions1-nosharp.txt
	mkdir -p `pwd`/output/soc-Epinions1
	python gm_main.py --file `pwd`/soc-Epinions1-nosharp.txt --dest_dir `pwd`/output/soc-Epinions1 --delim '	' --unweighted --undirected
	rm soc-Epinions1-nosharp.txt soc-Epinions1.txt

run_soc-Slashdot0811:    
	chmod a+rwx `pwd`
	wget https://snap.stanford.edu/data/soc-Slashdot0811.txt.gz
	gunzip soc-Slashdot0811.txt.gz
	grep -v "#" soc-Slashdot0811.txt > soc-Slashdot0811-nosharp.txt
	mkdir -p `pwd`/output/soc-Slashdot0811
	python gm_main.py --file `pwd`/soc-Slashdot0811-nosharp.txt --dest_dir `pwd`/output/soc-Slashdot0811 --delim '	' --unweighted --undirected
	rm soc-Slashdot0811-nosharp.txt soc-Slashdot0811.txt

timing_soc-Epinions1:    
	chmod a+rwx `pwd`
	wget http://snap.stanford.edu/data/soc-Epinions1.txt.gz
	gunzip soc-Epinions1.txt.gz
	grep -v "#" soc-Epinions1.txt > soc-Epinions1-nosharp.txt
	mkdir -p `pwd`/output/soc-Epinions1/timing
	python gm_main.py --file `pwd`/soc-Epinions1-nosharp.txt --dest_dir `pwd`/output/soc-Epinions1 --delim '	' --unweighted --undirected --node_ordering=slashburn --index_method=btree --index_order_by='(src_id, slashburn)' > test.timing
	rm soc-Epinions1-nosharp.txt soc-Epinions1.txt


run_com-amazon:
	chmod a+rwx `pwd`
	wget http://snap.stanford.edu/data/bigdata/communities/com-amazon.ungraph.txt.gz
	gunzip com-amazon.ungraph.txt.gz
	grep -v "#" com-amazon.ungraph.txt > com-amazon.ungraph-nosharp.txt
	mkdir -p `pwd`/output/com-amazon
	python gm_main.py --file `pwd`/com-amazon.ungraph-nosharp.txt --dest_dir `pwd`/output/com-amazon --delim '	' --unweighted --undirected
	rm com-amazon.ungraph.txt com-amazon.ungraph-nosharp.txt

run_email-Enron:
	chmod a+rwx `pwd`
	wget http://snap.stanford.edu/data/email-Enron.txt.gz
	gunzip email-Enron.txt.gz
	grep -v "#" email-Enron.txt > email-Enron-nosharp.txt
	mkdir -p `pwd`/output/email-Enron
	python gm_main.py --file `pwd`/email-Enron-nosharp.txt --dest_dir `pwd`/output/email-Enron --delim '	' --unweighted --undirected
	rm email-Enron.txt email-Enron-nosharp.txt

run_king-james:
	chmod a+rwx `pwd`
	wget http://konect.uni-koblenz.de/downloads/tsv/moreno_names.tar.bz2
	tar -vxjf moreno_names.tar.bz2
	grep -v "%" `pwd`/moreno_names/out.moreno_names_names > `pwd`/moreno_names/out.moreno_names_names-nosharp
	mkdir -p `pwd`/output/king-james
	python gm_main.py --file `pwd`/moreno_names/out.moreno_names_names-nosharp --dest_dir `pwd`/output/king-james --delim ' ' --undirected
	rm -r `pwd`/moreno_names
	rm moreno_names.tar.bz2

run_unit_tests:    
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
	python gm_main.py --file `pwd`/unit_tests/unittest5.txt --dest_dir `pwd`/output/unittest5 --unweighted --undirected
	python gm_main.py --file `pwd`/unit_tests/unittest5.txt --dest_dir `pwd`/output/unittest5 --unweighted --undirected --node_ordering=slashburn --index_method=btree --index_order_by='(src_id, dst_id)'
	python gm_main.py --file `pwd`/unit_tests/unittest5.txt --dest_dir `pwd`/output/unittest5 --unweighted --undirected --node_ordering=pagerank --index_method=btree --index_order_by='(src_id, dst_id)'
	python gm_main.py --file `pwd`/unit_tests/unittest5.txt --dest_dir `pwd`/output/unittest5 --unweighted --undirected --node_ordering=degree --index_method=btree --index_order_by='(src_id)'
	python gm_main.py --file `pwd`/unit_tests/unittest5.txt --dest_dir `pwd`/output/unittest5 --unweighted --undirected --node_ordering=coreness --index_method=btree --index_order_by='(src_id)'

install:
	sudo apt-get install python-psycopg2

all.tar:
	tar -zcvf graphminer.tar.gz *.txt makefile *.py matlab output doc

clean:
	rm -rf *.pyc output/*


