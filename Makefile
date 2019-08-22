DEBUG ?= 
CJK ?= -V CJKmainfont:思源宋体 -V CJKoptions:BoldFont=Source\ Han\ Serif\ SC\ Heavy,ItalicFont=FandolKai,SmallCapsFont=思源黑体

all: build clean
build: quiz

quiz:
	panbook art --style=elegantpaper $(DEBUG) $(CJK) -G ext-wrap-noanswer:true
solution:
	panbook art --style=elegantpaper $(DEBUG) $(CJK)
clean:
	panbook clean