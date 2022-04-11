#!/bin/bash
verify_minimum_env() {
	if [ -z "$BRANCH" ] ; then
		echo 'BRANCH option is not specified, use: master'
		BRANCH="master"
	fi

	if [ -z "$REPO" ] ; then
		echo 'REPO option is not specified, use: git@github.com:xiyejin/pact-demo.git'
	fi
}


# main
_main() {
	echo "1.verify env."
	verify_minimum_env
	echo "2.clone code from $BRANCH $REPO"
        git clone -b $BRANCH $REPO
	cd pact-demo
	echo "3.pip3 install requirements."
	pip3 install -r pact-python-master-1227/requirements_dev.txt
	echo "4.start app."
	export PYTHONPATH="$PYTHONPATH:./pact-python-master-1227"
	python3 -u pact-python-master-1227/consumer/op_cicd.py > test.log
}

_main
