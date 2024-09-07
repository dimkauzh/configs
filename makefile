..PHONY: install update

install:
	rm -rf ~/.config/i3/*
	rm -rf ~/.config/polybar/*
	rm -rf ~/.config/rofi/*
	rm -rf ~/.config/kitty/*
	rm -rf ~/.config/picom/*
	rm -rf ~/.config/dunst/*
	rm ~/.zshrc

	mkdir ~/.config/i3
	mkdir ~/.config/polybar
	mkdir ~/.config/rofi
	mkdir ~/.config/kitty
	mkdir ~/.config/picom
	mkdir ~/.config/dunst

	cp -r i3/* ~/.config/i3/
	cp -r polybar/* ~/.config/polybar/
	cp -r rofi/* ~/.config/rofi/
	cp -r kitty/* ~/.config/kitty/
	cp -r picom/* ~/.config/picom/
	cp -r dunst/* ~/.config/dunst/
	cp .zshrc ~/.zshrc

update:
	rm -rf i3/
	rm -rf polybar/
	rm -rf rofi/
	rm -rf kitty/
	rm -rf picom/
	rm -rf dunst/
	rm .zshrc

	mkdir i3
	mkdir polybar
	mkdir rofi
	mkdir kitty
	mkdir picom
	mkdir dunst

	cp -r ~/.config/i3/* i3/
	cp -r ~/.config/polybar/* polybar/
	cp -r ~/.config/rofi/* rofi/
	cp -r ~/.config/kitty/* kitty/
	cp -r ~/.config/picom/* picom/
	cp -r ~/.config/dunst/* dunst/
	cp ~/.zshrc .zshrc

