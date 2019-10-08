ENGINE=zspirengine
EDITOR=zsgamedit
MODE=debug

zspire: ${ENGINE} ${EDITOR}
	@echo Build has been completed.

${ENGINE}: ${ENGINE}/ZSpireEngine.pro ${MODE}_engine/Makefile
	cd ${MODE}_engine; make -j8

${MODE}_engine/Makefile: ${ENGINE}/ZSpireEngine.pro
	mkdir -p ${MODE}_engine
	cd ${MODE}_engine; qmake ../${ENGINE}/ZSpireEngine.pro

${EDITOR}: ${EDITOR}/ZSpireGameEd.pro ${MODE}_editor/Makefile
	cd ${MODE}_editor; make -j8

${MODE}_editor/Makefile : ${EDITOR}/ZSpireGameEd.pro
	mkdir -p ${MODE}_editor
	cd ${MODE}_editor; qmake ../${EDITOR}/ZSpireGameEd.pro

clean: clean_${ENGINE} clean_${EDITOR}
	@echo Clean has been completed.

clean_${ENGINE}:
	rm -rfv ${MODE}_engine

clean_${EDITOR}:
	rm -rfv ${MODE}_editor
