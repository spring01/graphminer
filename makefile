demo:
	chmod a+rwx `pwd`
	python gm_main.py --file `pwd`/samplegraph.txt --dest_dir `pwd`/output --belief_file `pwd`/priorsbelief.txt --unweighted --undirected

play:
	util/stop_server.bash
	util/start_server.bash
	python gm_main.py --file `pwd`/test2.txt --dest_dir `pwd`/output --delim '	' --unweighted --undirected --reorder='page_rank DESC'

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

timing-play3:
	./stop_server.bash
	./start_server.bash
	wget http://snap.stanford.edu/data/${base_name}.txt.gz
	gunzip -f ${base_name}.txt.gz
	grep -v "#" ${base_name}.txt > ${base_name}-nosharp.txt
	python gm_main.py --file `pwd`/${base_name}-nosharp.txt --dest_dir `pwd`/output/timing_play --delim ${delim} --unweighted --undirected ${index_setting} ${order_setting}
	rm ${base_name}-nosharp.txt ${base_name}.txt

timing-play2:
	./stop_server.bash
	./start_server.bash
	wget http://snap.stanford.edu/data/soc-Epinions1.txt.gz
	gunzip soc-Epinions1.txt.gz
	grep -v "#" soc-Epinions1.txt > soc-Epinions1-nosharp.txt
	python gm_main.py --file `pwd`/soc-Epinions1-nosharp.txt --dest_dir `pwd`/output/timing_play --delim '	' --unweighted --undirected --index idx_src '(src_id)' False --index idx_dst '(dst_id)' True --reorder='random ASC'
	rm soc-Epinions1-nosharp.txt soc-Epinions1.txt

timing-play:
	./stop_server.bash
	./start_server.bash
	wget http://snap.stanford.edu/data/twitter_combined.txt.gz
	gunzip -f twitter_combined.txt.gz
	python gm_main.py --file `pwd`/twitter_combined.txt --dest_dir `pwd`/output/timing_play --delim ' ' --unweighted --undirected --index idx_src '(src_id)' False --index idx_dst '(dst_id)' True --reorder='page_rank ASC'
	rm twitter_combined.txt


run_com-amazon:
	wget http://snap.stanford.edu/data/bigdata/communities/com-amazon.ungraph.txt.gz
	gunzip com-amazon.ungraph.txt.gz
	grep -v "#" com-amazon.ungraph.txt > com-amazon.ungraph-nosharp.txt
	mkdir -p `pwd`/output/com-amazon
	python gm_main.py --file `pwd`/com-amazon.ungraph-nosharp.txt --dest_dir `pwd`/output/com-amazon --delim '	' --unweighted --undirected --index idx_src '(src_id)' False --index idx_dst '(dst_id)' True --reorder='none ASC'
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


