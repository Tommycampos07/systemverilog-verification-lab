module tb;

	logic a;
	logic b;
	logic c;

	logic w;
	logic x;
	logic y;
	logic z;

	int errors;

	top_module dut (

	.a(a),
	.b(b),
	.c(c),
	.w(w),
	.x(x),
	.y(y),
	.z(z)
);

task check(

	input logic ta,
	input logic tb,
	input logic tc

);

	begin

	  a = ta;
	  b = tb;
	  c = tc;

	  #1;

	  if (w !== ta) begin
	     $display("ERROR w: a = %0b expected = %0b got = %0b", a, ta, w);
	     errors++;
	  end

	  if (x !== tb) begin

	     $display("ERROR x: b = %0b expected = %0b got = %0b", b, tb, x);
	     errors++;
	  end

	  if (y !== tb) begin

	     $display("ERROR y: b = %0b expected = %0b got = %0b", b, tb, y);
	     errors++;
	  end

	  if (z !== tc) begin

	     $display("ERROR z: c = %0b expected = %0b got = %0b", c, tc, z);
	     errors++;
	  end
	end
  endtask

  initial begin

    $dumpfile("wave.vcd");
    $dumpvars(0, tb);

    errors = 0;

    check(1'b0, 1'b0, 1'b0);
    check(1'b0, 1'b1, 1'b0);
    check(1'b1, 1'b0, 1'b1);
    check(1'b1, 1'b1, 1'b1);

    if (errors == 0)
      $display("PASS");
    else
      $display("FAIL: errors = %0d", errors);

    $finish;
  end

endmodule
