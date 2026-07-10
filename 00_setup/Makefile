SRC=and_gate.sv and_gate_tb.sv
OUT=simv
WAVE=wave.vcd

sim:
	iverilog -g2012 -o $(OUT) $(SRC)
	vvp $(OUT)

wave:
	gtkwave $(WAVE) &

open:
	explorer.exe .

clean:
	rm -f $(OUT) $(WAVE)
