`include "src/fulladder.sv"

module adder4bit (
  /** Input Ports */
  input wire [3:0] val1,
  input wire [3:0] val2,
  /** Output Ports */
  output logic [4:0] res
);

/** Logic */
wire carry1, carry2, carry3;

fulladder fa1(
  .val1(val1[0]),
  .val2(val2[0]),
  .carryin(1'b0),
  .res(res[0]),
  .carryout(carry1)
);

fulladder fa2(
  .val1(val1[1]),
  .val2(val2[1]),
  .carryin(carry1),
  .res(res[1]),
  .carryout(carry2)
);

fulladder fa3(
  .val1(val1[2]),
  .val2(val2[2]),
  .carryin(carry2),
  .res(res[2]),
  .carryout(carry3)
);

fulladder fa4(
  .val1(val1[3]),
  .val2(val2[3]),
  .carryin(carry3),
  .res(res[3]),
  .carryout(res[4])
);

endmodule