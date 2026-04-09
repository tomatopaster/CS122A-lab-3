`include "src/halfadder.sv"

module fulladder (
  /** Input Ports */
  input wire val1,
  input wire val2,
  input wire carryin,
  /** Output Ports */
  output logic res,
  output logic carryout
);

/** Logic */
// Tryna figure out how to put these modules together for sake of learning the general syntax and stuff :P
logic res1, carry1, carry2;

halfadder ha1(
  .val1(val1), 
  .val2(val2), 
  .res(res1), 
  .carryout(carry1)
);

halfadder ha2(
  .val1(res1), 
  .val2(carryin), 
  .res(res), 
  .carryout(carry2)
);

assign carryout = carry1 | carry2;

endmodule