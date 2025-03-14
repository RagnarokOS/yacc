# Makefile for OpenBSD's yacc.
# $Ragnarok: Makefile,v 1.5 2025/03/04 19:33:44 lecorbeau Exp $

CFLAGS +=	 -O2 -w -D_GNU_SOURCE -D__unused= 
CPPFLAGS +=
LDFLAGS +=	
BINDIR =	/usr/bin
MANDIR =	/usr/share/man/man1
PROG =		oyacc

OBJS =	closure.o error.o lalr.o lr0.o main.o mkpar.o output.o reader.o \
	skeleton.o symtab.o verbose.o warshall.o portable.o

all: ${PROG}

${PROG}: ${OBJS}
	${CC} ${LDFLAGS} -o ${PROG} ${OBJS}

install: all
	install -d ${DESTDIR}${BINDIR}
	install -d ${DESTDIR}${MANDIR}
	install -m 555 ${PROG} ${DESTDIR}${BINDIR}
	install -m 555 yyfix.sh ${DESTDIR}${BINDIR}/yyfix
	install -m 444 yacc.1 ${DESTDIR}${MANDIR}/${PROG}.1
	install -m 444 yyfix.1 ${DESTDIR}${MANDIR}/yyfix.1

test:
	@echo "No tests"

clean:
	rm -f ${PROG} ${OBJS}

