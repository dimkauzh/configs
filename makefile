.PHONY: install update

install:
	rm -rf ~/.config/i3/*
	rm -rf ~/.config/polybar/*
	rm -rf ~/.config/rofi/*
	rm -rf ~/.config/kitty/*

	mkdir ~/.config/i3
	mkdir ~/.config/polybar
	mkdir ~/.config/rofi
	mkdir ~/.config/kitty

	cp -r i3/* ~/.config/i3/
	cp -r polybar/* ~/.config/polybar/
	cp -r rofi/* ~/.config/rofi/
	cp -r kitty/* ~/.config/kitty/

update:
	rm -rf i3/
	rm -rf polybar/
	rm -rf rofi/
	rm -rf kitty/

	mkdir i3
	mkdir polybar
	mkdir rofi
	mkdir kitty

	cp -r ~/.config/i3/* i3/
	cp -r ~/.config/polybar/* polybar/
	cp -r ~/.config/rofi/* rofi/
	cp -r ~/.config/kitty/* kitty/
