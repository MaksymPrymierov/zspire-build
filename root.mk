ENGINE=zspirengine
EDITOR=zsgameedit

zspire: ${ENGINE} ${EDITOR}
	@echo Build has been completed.

${ENGINE}: ${ENGINE}/ZSpireEngine.pro ${ENGINE}/Makefile
	cd ${ENGINE}; make 

${ENGINE}/Makefile: ${ENGINE}/ZSpireEngine.pro
	cd ${ENGINE}; qmake ZSpireEngine.pro

${EDITOR}: ${EDITOR}/ZSpireGameEd.pro ${EDITOR}/Makefile
	cd ${EDITOR}; make

${EDITOR}/Makefile : ${EDITOR}/ZSpireGameEd.pro
	cd ${EDITOR}; qmake ZSpireGameEd.pro
