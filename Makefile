DEBUG ?= 
CJK ?= -V CJKmainfont:思源宋体 -V CJKoptions:BoldFont=Source\ Han\ Serif\ SC\ Heavy,ItalicFont=FandolKai,SmallCapsFont=思源黑体

all: build clean
build: quiz

quiz:
	panbook art --style=elegantpaper $(DEBUG) $(CJK)
solution:
	panbook art --style=elegantpaper $(DEBUG) $(CJK) -G ext-zh_en-lang:en
clean:
	panbook clean