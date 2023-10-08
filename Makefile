# Auto Swoosh Makefile

Auto\ Swoosh.app: auto-swoosh.sh
	appify "$<" "$@"
	
clean:
	$(RM) -fr Auto\ Swoosh.app

install: Auto\ Swoosh.app
	$(RM) -fr ${HOME}/Applications/Auto\ Swoosh.app
	cp -pr Auto\ Swoosh.app ${HOME}/Applications