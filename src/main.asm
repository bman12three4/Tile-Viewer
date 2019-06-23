.include "monitor.inc"
.include "display.inc"

.import	draw

.define UPDATEPT $6
.define UPDATERT $8

.CODE

_main:
	jsr HGR		; Hires setup stuff
	jsr BKGND
loop:	jsr update	; update runs the "game logic" (more to come)
	rts		; to every tile, which animates belts and assemblers
	
update:	ldx #00		; This loop just updates any animated tiles, like conveyors.
view:	txa
	sta TILENUM
	sta TILECD
	jsr draw
	lda TILECD
	tax
footer:	inx
	inx
	cpx #32;100
	bne view
	rts	
	
	