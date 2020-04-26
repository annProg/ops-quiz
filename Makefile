DEBUG ?= 
CJK ?= -V CJKmainfont:思源宋体 -V CJKoptions:BoldFont=Source\ Han\ Serif\ SC\ Heavy,ItalicFont=FandolKai,SmallCapsFont=思源黑体
FILE = ops-quiz-art-elegantpaper.pdf

all: build clean
build: quiz solution

answer:
	cd answer
	latexmk -xelatex answer.tex
quiz:
	panbook art --style=elegantpaper $(DEBUG) $(CJK)
	mv build/$(FILE) build/ops-quiz.pdf
solution:
	panbook art --style=elegantpaper $(DEBUG) $(CJK) -M ext-wrap-solu:true
	mv build/$(FILE) build/ops-quiz-solution.pdf
clean:
	panbook clean