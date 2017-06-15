CFLAGS	= -Wall -Werror -Wno-unused-function
YFLAGS	= -d
LFLAGS	= --yylineno
OFILES	= yajson.o yajson.g.o yajson.lx.o

yajson:	y.tab.h $(OFILES)
	$(CC) $(CFLAGS) -o yajson $(OFILES) -lfl -ly
yajson.o:	yajson.c
yajson.g.o:	yajson.g.y
yajson.lx.o:	y.tab.h yajson.lx.l

y.tab.h:	yajson.g.o

clean:
	-rm yajson y.tab.h $(OFILES)
