..PHONY: install update

install:
	rm -rf ~/.config/gtk-2.0/*
	rm -rf ~/.config/gtk-3.0/*
	rm -rf ~/.config/gtk-4.0/*
	rm -rf ~/.config/i3/*
	rm -rf ~/.config/polybar/*
	rm -rf ~/.config/rofi/*
	rm -rf ~/.config/kitty/*
	rm -rf ~/.config/picom/*
	rm -rf ~/.config/dunst/*
	rm ~/.zshrc
	
	mkdir ~/.config/gtk-2.0
	mkdir ~/.config/gtk-3.0
	mkdir ~/.config/gtk-4.0
	mkdir ~/.config/i3
	mkdir ~/.config/polybar
	mkdir ~/.config/rofi
	mkdir ~/.config/kitty
	mkdir ~/.config/picom
	mkdir ~/.config/dunst

	cp -r gtk-2.0/* ~/.config/gtk-2.0/
	cp -r gtk-3.0/* ~/.config/gtk-3.0/
	cp -r gtk-4.0/* ~/.config/gtk-4.0/
	cp -r i3/* ~/.config/i3/
	cp -r polybar/* ~/.config/polybar/
	cp -r rofi/* ~/.config/rofi/
	cp -r kitty/* ~/.config/kitty/
	cp -r picom/* ~/.config/picom/
	cp -r dunst/* ~/.config/dunst/
	cp .zshrc ~/.zshrc

update:
	rm -rf gtk-2.0/
	rm -rf gtk-3.0/
	rm -rf gtk-4.0/
	rm -rf i3/
	rm -rf polybar/
	rm -rf rofi/
	rm -rf kitty/
	rm -rf picom/
	rm -rf dunst/
	rm .zshrc

	mkdir gtk-2.0
	mkdir gtk-3.0
	mkdir gtk-4.0
	mkdir i3
	mkdir polybar
	mkdir rofi
	mkdir kitty
	mkdir picom
	mkdir dunst

	cp -r ~/.config/gtk-2.0/* gtk-2.0/
	cp -r ~/.config/gtk-3.0/* gtk-3.0/
	cp -r ~/.config/gtk-4.0/* gtk-4.0/
	cp -r ~/.config/i3/* i3/
	cp -r ~/.config/polybar/* polybar/
	cp -r ~/.config/rofi/* rofi/
	cp -r ~/.config/kitty/* kitty/
	cp -r ~/.config/picom/* picom/
	cp -r ~/.config/dunst/* dunst/
	cp ~/.zshrc .zshrc

