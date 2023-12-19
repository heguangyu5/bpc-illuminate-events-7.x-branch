libilluminate-events.so:
	./bpc-prepare.sh src.list
	$(MAKE) -C ./Illuminate libilluminate-events

libilluminate-events:
	bpc -v \
		-c bpc.conf  \
		-l illuminate-events \
		-u illuminate-container \
		-u illuminate-contracts \
		-u illuminate-support   \
		--input-file src.list

install-libilluminate-events:
	cd Illuminate && bpc -l illuminate-events --install
