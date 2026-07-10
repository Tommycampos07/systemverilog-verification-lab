module tb_and_gate;

  logic a;
  logic b;
  logic y;
  int errors;

  and_gate dut (
    .a(a),
    .b(b),
    .y(y)
  );

  task check(input logic ta, input logic tb, input logic expected);
    begin
      a = ta;
      b = tb;
      #1;

      if (y !== expected) begin
        $display("ERROR: a=%0b b=%0b expected=%0b got=%0b", a, b, expected, y);
        errors++;
      end
    end
  endtask

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb_and_gate);

    errors = 0;

    check(0, 0, 0);
    check(0, 1, 0);
    check(1, 0, 0);
    check(1, 1, 1);

    if (errors == 0)
      $display("PASS");
    else
      $display("FAIL: errors = %0d", errors);

    $finish;
  end

endmodule
