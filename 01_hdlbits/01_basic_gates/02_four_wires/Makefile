SRC=dut.sv tb.sv
OUT=simv
WAVE=wave.vcd

sim:
	iverilog -g2012 -o $(OUT) $(SRC)
	vvp $(OUT)

open:
	explorer.exe .

clean:
	rm -f $(OUT) $(WAVE)
